import 'package:spacemanager/models/guests/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

extension SessionRef on Session {
  Future<Guest> guest() async => await GuestCRUDQuery.read(guestId!);
}
