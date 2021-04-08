import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:mdi/mdi.dart';
import '../widgets/side_drawer.dart';
import '../globals.dart';
import '../widgets/pullable_button.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter/scheduler.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width, height;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((Duration duration) {
      FeatureDiscovery.discoverFeatures(
        context,
        const <String>{
          'callId',
        },
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: scaffoldKey,
      drawer: SideDrawer(),
      appBar: _buildAppBar(),
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildHeading("Articles"),
              Container(
                height: 0.3 * height,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    return _buildItem(index);
                  },
                  itemCount: articleList.length,
                ),
              ),
              _buildHeading("Others"),
              _buildOtherSection(context),
              SizedBox(height: 10),
              _buildHeading("Community Posts"),
              _buildCommunityPostSection(),
            ],
          ),
        ),
        PullableButton(width, height),
      ]),
    );
  }

  _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () => scaffoldKey.currentState.openDrawer(),
        icon: Icon(
          Mdi.sortVariant,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        "Everyday App",
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  _buildCommunityPostSection() {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        CommunityItem item = communityList[index];
        return GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed("/PostDetailPage", arguments: item),
          child: Container(
            margin: EdgeInsets.all(10.0),
            height: 0.325 * height,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5.0,
                  offset: Offset(3.0, 3.0),
                  color: Colors.black.withOpacity(0.05),
                  spreadRadius: 4.0,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: item.image,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15.0),
                      child: Image.network(
                        item.image,
                        fit: BoxFit.cover,
                        height: 0.225 * height,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5.0,
                              offset: Offset(3.0, 3.0),
                              color: Colors.black.withOpacity(0.05),
                              spreadRadius: 4.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            item.image,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        child: Text(
                          item.text,
                          maxLines: 2,
                          style: TextStyle(fontSize: 13),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                )
              ],
            ),
          ),
        );
      },
      itemCount: communityList.length,
    );
  }

  _buildOtherSection(BuildContext context) {
    return Container(
      height: 0.15 * height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
            children: List.generate(
                otherList.length, (index) => _buildOthersItem(context, index))),
      ),
    );
  }

  _buildOthersItem(BuildContext context, int index) {
    return Expanded(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => otherList[index].page),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(3.0, 3.0),
                color: Colors.black.withOpacity(0.05),
                spreadRadius: 2.0,
              ),
            ],
            color: Theme.of(context).cardColor,
          ),
          margin: EdgeInsets.all(5.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                otherList[index].icon,
                color: mainColor,
                size: 35,
              ),
              SizedBox(height: 5),
              Center(
                child: Text(
                  otherList[index].text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: mainColor, fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildItem(int index) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          "/PostDetailPage",
          arguments: articleList[index],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: Image.network(
                  articleList[index].image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Colors.transparent,
                      Colors.black12,
                      Colors.black45,
                      Colors.black87
                    ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0.03 * width,
              right: 0.03 * width,
              bottom: 10,
              child: Text(
                articleList[index].text,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildHeading(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
      ),
    );
  }
}
