import 'package:flutter/material.dart';
import 'package:spaceadmin/constant/base_colors.dart';
import 'package:spaceadmin/pages/rooms/widgets/form.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  _RoomsPageState createState() => _RoomsPageState();
}

class _RoomsPageState extends State<RoomsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.bittersweet,
        title: const Text(
          'Edit rooms',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: const [
          RoomForm(),
        ],
      ),
    );
  }
}
