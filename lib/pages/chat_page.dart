import 'package:flutter/material.dart';
import 'package:mdi/mdi.dart';

class ChatPage extends StatefulWidget {
  final bool showAppBar;
  ChatPage({this.showAppBar = true});
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  double width, height;
  TextEditingController textEditingController = TextEditingController();
  List<Message> listOfMessages = [
    Message("I'm waiting please help soon", true),
    Message("I have reached the nearby locality and will be there soon", false),
    Message("No, I need your help :(", true),
    Message("Hello? Are you fine?", false),
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Community"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true,
              padding: EdgeInsets.only(bottom: 15.0),
              children:
                  listOfMessages.map((e) => _buildChatMessage(e)).toList(),
            ),
          ),
          Container(
              height: 0.1 * height,
              color: Colors.white,
              child: buildTextField(context, "Message"))
        ],
      ),
    );
  }

  Widget _buildChatMessage(Message message) {
    return Align(
      alignment:
          message.isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: message.isSender
            ? EdgeInsets.only(right: 10.0, top: 10.0)
            : EdgeInsets.only(left: 10.0, top: 10.0),
        decoration: BoxDecoration(
          color: message.isSender
              ? Colors.white
              : Theme.of(context).primaryColor.withOpacity(0.6),
          borderRadius: BorderRadius.circular(10.0),
        ),
        constraints: BoxConstraints(
          maxWidth: 0.6 * width,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Text(
            message.text,
            style: TextStyle(
              color: message.isSender ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  buildTextField(BuildContext context, String hintText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              blurRadius: 10.0,
              color: Colors.black.withOpacity(0.05),
              offset: Offset(5.0, 5.0),
              spreadRadius: 5.0),
        ],
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: textEditingController,
          decoration: InputDecoration(
            isDense: true,
            contentPadding:
                EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.subtitle1,
            border: InputBorder.none,
            suffixIcon: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
                listOfMessages.insert(
                    0, Message(textEditingController.text, true));

                textEditingController.clear();
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle),
                child: Icon(
                  Mdi.arrowRight,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Message {
  String text;
  bool isSender;

  Message(this.text, this.isSender);
}
