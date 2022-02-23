part of autoupdater;

Future<String> downloadExe(String url) async {
  String dir = Directory.systemTemp.createTempSync().path;
  File source = File(ctx.join(dir, 'setupfile.exe'));

  if (!(await source.exists())) {
    var res = await http.get(Uri.parse(url));
    await source.writeAsBytes(res.bodyBytes);
  }

  return source.path;
}
