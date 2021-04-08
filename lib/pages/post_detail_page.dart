import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:everyday_app/globals.dart';

class PostDetailPage extends StatefulWidget {
  final CommunityItem item;

  PostDetailPage(this.item);
  @override
  _PostDetailPageState createState() => _PostDetailPageState();
}

class _PostDetailPageState extends State<PostDetailPage> {
  double width, height;
  bool isBookMarked = false;
  bool showFab = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        floatingActionButton: showFab
            ? FloatingActionButton(
                child: Icon(Icons.favorite),
                onPressed: () {
                  showFab = false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "Thanks for sharing love, it surely helps them!",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white),
                    ),
                  ));
                  setState(() {});
                },
              )
            : null,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              actions: [
                IconButton(
                  icon: Icon(
                    isBookMarked ? Icons.bookmark : Icons.bookmark_outline,
                    color: isBookMarked ? mainColor : Colors.white,
                  ),
                  onPressed: () {
                    isBookMarked = !isBookMarked;
                    setState(() {});
                  },
                )
              ],
              expandedHeight: 0.6 * height,
              flexibleSpace: LayoutBuilder(builder: (context, constraints) {
                return FlexibleSpaceBar(
                  background: Hero(
                    tag: widget.item.image,
                    child: Stack(
                      children: [
                        Image.network(
                          widget.item.image,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black12,
                                Colors.black45,
                                Colors.black87
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: Text(
                    widget.item.text,
                    maxLines: 2,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  titlePadding: EdgeInsets.only(left: 15.0, bottom: 6.0),
                );
              }),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(widget.item.description),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
