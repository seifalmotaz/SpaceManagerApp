import 'package:flutter/material.dart';

class RoomsWidget extends StatelessWidget {
  const RoomsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemExtent: 400,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          color: Colors.white,
        );
      },
    );
  }
}
