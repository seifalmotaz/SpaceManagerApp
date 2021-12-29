import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

import 'controller.dart';

extension Rooms on HomeController {
  Future getRoomsReservations() async {
    List<Room> _rooms = await RoomCRUDQuery.list();
    List<RoomWithReservations> roomsReservations = [];
    for (Room r in _rooms) {
      List<ReservationWithGuest> res =
          await ReservationJoinsQuery.getByDateAndRoom(r.id!, isCourse: false);
      ReservationWithSessionWithGuest? runningSession =
          await SessionFindQuery.findNotEndedWithRoom(r.id!);
      roomsReservations.add(RoomWithReservations(
        room: r,
        running: runningSession,
        reservations: res,
      ));
    }
    rooms.value = roomsReservations;
  }
}
