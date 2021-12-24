import 'package:spacemanager/models/guests/src.dart';

extension GuestsOtions on Guest {
  /// Check if user exist
  /// and if not it will create new user.
  Future<Guest> checkGuestByPhone() async {
    late Guest u;
    if (id != null) {
      u = this;
    } else {
      Guest? one = await GuestFindQuery.getOneByPhone(phone!);
      if (one != null) {
        u = one;
      } else {
        int i = await create();
        u = await GuestCRUDQuery.read(i);
      }
    }
    return u;
  }
}
