import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AETxt extends StatelessWidget {
  const AETxt(this.txt, {super.key});
  final String txt;

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: GoogleFonts.lato(
        fontSize: 23,
        // fontStyle: FontStyle.italic,
        color: const Color.fromARGB(255, 251, 255, 255),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
