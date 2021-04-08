import 'package:flutter/material.dart';
import 'route_generator.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:feature_discovery/feature_discovery.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FeatureDiscovery(
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.pink,
            fontFamily: GoogleFonts.poppins().fontFamily),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
