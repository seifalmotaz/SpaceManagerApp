part of autoupdater;

class AppVersion {
  final String currentVersion;

  /// Last version download link
  final String exeUrl;

  /// is current app is the last version
  final bool isUpdated;

  AppVersion(this.exeUrl, this.isUpdated, this.currentVersion);
}

/// Get if current app is updated and get the last version download url
Future<AppVersion> getAppVersion() async {
  http.Response res = await http.get(Uri.parse(versionURL));
  Map<String, dynamic> data = jsonDecode(res.body);

  String lastVersion = data['last_version'];
  String downloadLink = data['download'];

  if (currentAppVersion == lastVersion) {
    return AppVersion(downloadLink, true, lastVersion);
  }
  return AppVersion(downloadLink, false, lastVersion);
}
