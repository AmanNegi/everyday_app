import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:feature_discovery/feature_discovery.dart';
import '../data/data.dart';

class PullableButton extends StatefulWidget {
  final double height, width;

  PullableButton(this.width, this.height);

  @override
  _PullableButtonState createState() => _PullableButtonState();
}

class _PullableButtonState extends State<PullableButton> {
  double height, width;
  double buttonWidth, buttonHeight;
  Widget child = Icon(
    Mdi.phone,
    color: Colors.white,
    size: 35,
  );
  Color _color = Colors.pink;
  bool allowChangingValue = true;
  bool isExpanded = false;
  @override
  void initState() {
    height = widget.height;
    width = widget.width;
    buttonWidth = 0.175 * width;
    buttonHeight = 0.08 * height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.1 * height,
      right: 0,
      child: GestureDetector(
        onTap: () {
          buttonWidth = 0.25 * width;
          buttonHeight = 0.38 * height;
          child = _buildColumnChild();

          setState(() {});
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 150),
          curve: Curves.easeInOut,
          width: buttonWidth,
          height: buttonHeight,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          child: DescribedFeatureOverlay(
            title: Text("In case of emergency make calls from here"),
            contentLocation: ContentLocation.above,
            overflowMode: OverflowMode.extendBackground,
            tapTarget: Icon(
              Mdi.phone,
              color: Colors.black,
              size: 35,
            ),
            featureId: "callId",
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }

  Icon _buildIcon() {
    return Icon(
      Mdi.phone,
      color: Colors.white,
      size: 35,
    );
  }

  Column _buildColumnChild() {
    return Column(
      children: [
        Column(
            children: List.generate(
                callList.length, (index) => _buildNumberItem(callList[index]))),
        SizedBox(height: 10),
        GestureDetector(
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
            onTap: () {
              buttonWidth = 0.175 * width;
              buttonHeight = 0.08 * height;
              child = _buildIcon();
              isExpanded = false;
              setState(() {});
            })
      ],
    );
  }

  _buildNumberItem(CallItem item) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed("/CallPage", arguments: item),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.0),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Center(
            child: Icon(
          item.icon,
          color: Colors.white,
        )),
      ),
    );
  }

  alterColor() {
    if (_color == Colors.black)
      _color = Colors.black.withOpacity(0.3);
    else
      _color = Colors.black;
  }
}
