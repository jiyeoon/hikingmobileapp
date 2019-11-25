import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


abstract class Styles{
  static const Color turquoise = Color(0x53B0AE);

  static const headlineText = TextStyle(
    //color: Color.fromARGB(0, 0, 0, 0.8),
    fontSize: 32,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );


  static const minorText = TextStyle(
    color: Colors.black45,
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const headlineName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold
  );

  static const headlineDescription = TextStyle(
    fontSize: 16,
  );

  static const cardTitleText = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );

  static const cardCategoryText = TextStyle(
    fontSize: 16,
  );

  static const detailpage_subtitle = TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 18,
      letterSpacing: 0.27,
      //color: Colors.
  );

  static const detailpage_details = TextStyle(
    fontWeight: FontWeight.w200,
    fontSize: 16,
    letterSpacing: 0.27,
    color: turquoise,
  );





}