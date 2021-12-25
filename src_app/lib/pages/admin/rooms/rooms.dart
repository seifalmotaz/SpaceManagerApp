import 'package:flutter/material.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/pages/admin/base.dart';
import 'package:spacemanager/pages/admin/rooms/form.dart';
import 'package:spacemanager/pages/admin/rooms/list.dart';

class EditRoomsPage extends StatefulWidget {
  const EditRoomsPage({Key? key}) : super(key: key);

  @override
  _EditRoomsPageState createState() => _EditRoomsPageState();
}

class _EditRoomsPageState extends State<EditRoomsPage> {
  List<Room> rooms = [];

  getData() async {
    List<Room> c = await RoomCRUDQuery.list();
    setState(() {
      rooms = c;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdminBaseLayout(Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: RoomForm(onCreate: getData)),
        Flexible(
          flex: 2,
          child: RoomsList(
            rooms: rooms,
            onDelete: getData,
          ),
        ),
      ],
    ));
  }
}
