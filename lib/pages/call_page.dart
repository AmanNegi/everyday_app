import 'package:flutter/material.dart';
import '../data/data.dart';
import 'package:everyday_app/globals.dart';

class CallPage extends StatefulWidget {
  final CallItem item;

  CallPage(this.item);
  @override
  _CallPageState createState() => _CallPageState();
}

class _CallPageState extends State<CallPage>
    with SingleTickerProviderStateMixin {
  double width, height;
  AnimationController controller;
  Animation fadeAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    fadeAnimation = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    super.initState();
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: mainColor,
      body: Column(
        children: [
          Spacer(),
          AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: fadeAnimation,
                child: child,
              );
            },
            child: Center(
              child: Icon(
                widget.item.icon,
                size: 80,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "Calling ${widget.item.text}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Icon(
                Icons.close,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
