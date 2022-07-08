import 'package:flutter/material.dart';
import 'package:sell_books_web/widget/nav_widget/nav_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_minimal_desktop.dart';
import 'package:sell_books_web/widget/nav_widget/nav_mobile.dart';

class NavMainScreen extends StatefulWidget {
  NavMainScreen({Key? key}) : super(key: key);

  @override
  State<NavMainScreen> createState() => _NavMainScreenState();
}

class _NavMainScreenState extends State<NavMainScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 1150) {
                  return desktopView(context);
                } else if (constraints.maxWidth >= 780 &&
                    constraints.maxWidth <= 1150) {
                  return minimal_desktop(context);
                } else {
                  return mobileView();
                }
              });
  }
}