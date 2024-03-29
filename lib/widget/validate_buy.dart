import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeValidBuy {
  InputDecoration textInputDecoration() {
    return InputDecoration(
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(15.0, 18.0, 0.0, 10.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1)),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).colorScheme.secondary;
    if (color1.isEmpty == false) {
      c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      c2 = HexColor(color2);
    }

    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  // AlertDialog alartDialog(String title, String content, BuildContext context) {
  //   return AlertDialog(
  //     title: Text(title),
  //     content: Text(content),
  //     actions: [
  //       TextButton(
  //         child: const Text(
  //           "OK",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all(Colors.black38)),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ],
  //   );
  // }
}

class ThemeValidCard {
  InputDecoration textInputDecoration(String hintText) {
    return InputDecoration(
      border: InputBorder.none,
      disabledBorder: InputBorder.none,
      hintText: hintText,
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(15.0, 18.0, 0.0, 10.0),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black12, width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: Colors.red, width: 1)),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).colorScheme.secondary;
    if (color1.isEmpty == false) {
      c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      c2 = HexColor(color2);
    }

    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(Colors.transparent),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  // AlertDialog alartDialog(String title, String content, BuildContext context) {
  //   return AlertDialog(
  //     title: Text(title),
  //     content: Text(content),
  //     actions: [
  //       TextButton(
  //         child: Text(
  //           "OK",
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         style: ButtonStyle(
  //             backgroundColor: MaterialStateProperty.all(Colors.black38)),
  //         onPressed: () {
  //           Navigator.of(context).pop();
  //         },
  //       ),
  //     ],
  //   );
  // }
}
