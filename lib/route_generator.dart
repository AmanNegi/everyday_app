import 'package:flutter/material.dart';
import 'pages/welcome_page.dart';
import 'home_page.dart';
import "pages/call_page.dart";
import 'pages/education_page.dart';
import './pages/post_detail_page.dart';
import './pages/chat_page.dart';
import './pages/map_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (context) => WelcomePage());
      case "/HomePage":
        return MaterialPageRoute(builder: (context) => HomePage());
      case "/PostDetailPage":
        return MaterialPageRoute(builder: (context) => PostDetailPage(args));
      case "/CallPage":
        return MaterialPageRoute(builder: (context) => CallPage(args));
      case "/EducationPage":
        return MaterialPageRoute(builder: (context) => EducationPage());
      case "/MapPage":
        return MaterialPageRoute(builder: (context) => MapPage());
      case "/ChatPage":
        return MaterialPageRoute(builder: (context) => ChatPage());
      default:
        return MaterialPageRoute(builder: (context) => WelcomePage());
    }
  }
}
