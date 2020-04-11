import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;

  const CustomText(
      {Key key,
      @required this.text,
      @required this.fontSize,
      this.fontWeight,
      this.color})
      : super(key: key);
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text,
        style: GoogleFonts.muli(
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.color));
  }
}
