import 'package:jiffy/jiffy.dart';

class ConvertingCSV {
  static List<List<dynamic>> toCSVList(List<Map<String, dynamic>> maps) {
    List<List<dynamic>> list = [];
    List<dynamic> keys = maps.first.keys.toList();
    list.add(keys);
    for (Map item in maps) {
      List<dynamic> l = [];
      for (String i in keys) {
        dynamic val = item[i];
        if (item[i] is int) {
          if ((val * 1000) > 10000000) {
            DateTime date = DateTime.fromMillisecondsSinceEpoch(val * 1000);
            Jiffy j = Jiffy(date);
            l.add(j.yMMMdjm);
          } else {
            l.add(item[i]);
          }
        } else {
          l.add(item[i]);
        }
      }
      list.add(l);
    }
    return list;
  }
}
