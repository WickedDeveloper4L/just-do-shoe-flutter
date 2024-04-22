import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_do_shoe/models/cart.dart';
import 'package:just_do_shoe/pages/intropage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const IntroPage(),
              theme: ThemeData(
                  dividerTheme:
                      const DividerThemeData(color: Colors.transparent),
                  textTheme: GoogleFonts.interTextTheme()),
            ));
  }
}
