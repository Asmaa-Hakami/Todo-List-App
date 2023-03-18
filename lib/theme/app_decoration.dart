import 'package:flutter/material.dart';

class AppDecoration {
  static InputDecorationTheme get textFieldDecoration => InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((6.00)),
            borderSide: const BorderSide(color: Color(0xffB6BFEF), width: 1)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular((6.00)),
            borderSide: const BorderSide(color: Color(0xffB6BFEF), width: 1)),
      );

  static BoxDecoration get groupStylewhitegray20041 => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          4.00,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0X40e6e6e6),
            spreadRadius: 2.00,
            blurRadius: 2.00,
            offset: Offset(
              0,
              4,
            ),
          ),
        ],
      );
  static BoxDecoration get groupStyleBlueWhite => BoxDecoration(
          color: const Color(0xff5F78FC),
          borderRadius: BorderRadius.circular((4.00)),
          boxShadow: const [
            BoxShadow(
                color: Color(0X40e6e6e6),
                spreadRadius: (2.00),
                blurRadius: (2.00),
                offset: Offset(0, 0))
          ]);
}
