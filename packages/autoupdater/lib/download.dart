part of autoupdater;

Future<String> downloadExe(AppVersion appVersion) async {
  String dir = Directory.systemTemp.createTempSync().path;
  File source = File(ctx.join(dir, '${appVersion.currentVersion}.exe'));

  if (!(await source.exists())) {
    var res = await http.get(Uri.parse(appVersion.exeUrl));
    await source.writeAsBytes(res.bodyBytes);
  }

  return source.path;
}
