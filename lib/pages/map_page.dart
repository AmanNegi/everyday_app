import 'package:flutter/material.dart';
import 'package:everyday_app/globals.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double width, height;
  int currentChipIndex = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nearby Shelters"),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/gmap.jpg",
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              height: 0.075 * height,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  _buildChip(0, "50 m"),
                  _buildChip(1, "100 m"),
                  _buildChip(2, "200 m"),
                  _buildChip(3, "500 m"),
                  _buildChip(4, "1 km"),
                  _buildChip(5, "2 km"),
                  _buildChip(6, "3 km"),
                  _buildChip(7, "4 km"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildChip(int index, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ActionChip(
        label: Text(
          text,
          style: TextStyle(
              color: index == currentChipIndex ? Colors.white : Colors.white70),
        ),
        backgroundColor: index == currentChipIndex ? mainColor : Colors.grey[400],
        onPressed: () {
          currentChipIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
