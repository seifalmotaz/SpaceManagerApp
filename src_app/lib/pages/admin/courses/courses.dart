import 'package:flutter/material.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/pages/admin/base.dart';
import 'package:spacemanager/pages/admin/courses/form.dart';
import 'package:spacemanager/pages/admin/courses/list.dart';

class EditCoursesPage extends StatefulWidget {
  const EditCoursesPage({Key? key}) : super(key: key);

  @override
  _EditCoursesPageState createState() => _EditCoursesPageState();
}

class _EditCoursesPageState extends State<EditCoursesPage> {
  List<Course> courses = [];

  getData() async {
    List<Course> p = await CourseCRUDQuery.list();
    setState(() {
      courses = p;
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
        Flexible(
          child: CourseForm(
            onCreate: getData,
          ),
        ),
        Flexible(
          flex: 2,
          child: CoursesList(
            courses: courses,
            onDelete: getData,
          ),
        ),
      ],
    ));
  }
}
