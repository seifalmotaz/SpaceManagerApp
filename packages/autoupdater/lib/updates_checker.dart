part of autoupdater;

class AppVersion {
  final String currentVersion;

  /// Last version download link
  final String exeUrl;
  final String downgradeUrl;

  /// is current app is the last version
  final bool isUpdated;

  AppVersion(
      this.exeUrl, this.downgradeUrl, this.isUpdated, this.currentVersion);
}

/// Get if current app is updated and get the last version download url
Future<AppVersion> getAppVersion() async {
  http.Response res = await http.get(Uri.parse(versionURL));
  Map<String, dynamic> data = jsonDecode(res.body);

  String lastVersion = data['last_version'];
  String upgradeLink = data['upgrade'];
  String downgradeLink = data['downgrade'];

  if (currentAppVersion == lastVersion) {
    return AppVersion(upgradeLink, downgradeLink, true, lastVersion);
  }
  return AppVersion(upgradeLink, downgradeLink, false, lastVersion);
}
