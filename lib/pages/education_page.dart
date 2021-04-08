import 'package:flutter/material.dart';
import 'package:everyday_app/globals.dart';
import 'package:mdi/mdi.dart';
import '../data/data.dart';

class EducationPage extends StatefulWidget {
  @override
  _EducationPageState createState() => _EducationPageState();
}

class ExpandedItem {
  int index;
  bool isActive;

  ExpandedItem(this.index, this.isActive);
}

class _EducationPageState extends State<EducationPage> {
  double width, height;

  List<ExpandedItem> list = [
    ExpandedItem(0, true),
    ExpandedItem(1, false),
    ExpandedItem(2, false),
    ExpandedItem(3, false),
    ExpandedItem(4, false),
    ExpandedItem(5, false),
    ExpandedItem(6, false),
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Get Educated",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:
              List.generate(7, (index) => _buildListItem(list[index], index)),
        ),
      ),
    );
  }

  _buildListItem(ExpandedItem item, int index) {
    return GestureDetector(
      onTap: () {
        list[index].isActive = !list[index].isActive;
        setState(() {});
      },
      child: Container(
        color: Colors.white,
        child: AnimatedContainer(
          margin: EdgeInsets.all(10.0),
          duration: Duration(milliseconds: 150),
          // height: isActive(index) ? 0.4 * height : 0.075 * height,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: item.isActive ? mainColor.withOpacity(.1) : Colors.white,
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
                padding: EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: item.isActive
                          ? Alignment.topLeft
                          : Alignment.centerLeft,
                      child: Container(
                        width: 0.75 * width,
                        child: Text(
                          educatedTitleList[item.index],
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    item.isActive
                        ? Icon(
                            Mdi.chevronDown,
                            color: mainColor,
                          )
                        : Icon(Mdi.chevronRight)
                  ],
                ),
              ),
              item.isActive
                  ? Padding(
                      padding: EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 10.0),
                      child: Text(
                        educatedSubtitleList[item.index],
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
