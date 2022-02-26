import 'package:flutter/material.dart';

abstract class Responsiveless extends StatelessWidget {
  const Responsiveless({Key? key}) : super(key: key);

  Widget xBuild(BuildContext context, Size size);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return xBuild(context, MediaQuery.of(context).size);
    });
  }
}
