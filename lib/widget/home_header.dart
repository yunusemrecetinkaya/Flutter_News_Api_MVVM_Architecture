import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeHeader extends StatelessWidget {
  String header;
  HomeHeader({String header}) {
    this.header = header;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      textAlign: TextAlign.start,
      style: GoogleFonts.montserratAlternates(
        fontSize: 30,
        //fontWeight: FontWeight.bold,
        color: Colors.red,
      ),
    );
  }
}
