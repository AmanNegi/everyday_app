import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';
import 'package:everyday_app/globals.dart';

class SideDrawer extends StatefulWidget {
  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  double width, height;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top),
          Container(
            height: 0.3 * height,
            width: double.infinity,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 0.2 * height,
                      color: mainColor.withOpacity(0.2),
                    ),
                    Container(
                      height: 0.1 * height,
                      color: Theme.of(context).canvasColor,
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 0.025 * height),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            offset: Offset(0.0, 3.0),
                            color: Colors.black.withOpacity(0.05),
                            spreadRadius: 3.0,
                          ),
                        ],
                      ),
                      child: ClipOval(
                        child: Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 5.0,
                                offset: Offset(0.0, 10.0),
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 10.0,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Image.asset('assets/icon.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Mdi.chatOutline),
            title: Text("Chat with Community"),
            onTap: () => Navigator.of(context).pushNamed("/ChatPage"),
          ),
          ListTile(
            leading: Icon(Mdi.informationOutline),
            title: Text("About Us"),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: "Everyday App",
                applicationVersion: "1.0.0",
                applicationIcon:
                    Image.asset("assets/icon.png", height: 50, width: 50),
                applicationLegalese:
                    "Built, tested & Designed by Team 20 (Strangers)",
              );
            },
          ),
        ],
      ),
    );
  }
}
