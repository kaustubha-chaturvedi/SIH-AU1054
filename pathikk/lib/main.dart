import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pathikk/utils/sotre.dart';
import 'package:pathikk/widgets/Home.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(store: appstore(), child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      routes: {"/": ((context) => HomeScreen())},
    );
  }
}
