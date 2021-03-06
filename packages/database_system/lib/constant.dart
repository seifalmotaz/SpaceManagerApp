import 'package:database_system/models/bill/bill.dart';
import 'package:database_system/models/item/item.dart';
import 'package:database_system/models/item_count/item_count.dart';
import 'package:database_system/sql/reservation/extra.dart';

import 'service.dart';
//
import './models/course/course.dart';
import './models/course_registration/course_registration.dart';
import './models/guest/guest.dart';
//
import './models/price/price.dart';
//
import './models/reservation/reservation.dart';
//
import './models/room/room.dart';
//
import './models/session/session.dart';
import 'sql/session/extra.dart';

typedef QueryData = Map<String, dynamic>;

// store
final BillQuery billQuery = BillQuery(DBService.to.db);
final ItemQuery itemQuery = ItemQuery(DBService.to.db);
final ItemCountQuery itemCountQuery = ItemCountQuery(DBService.to.db);

// Guests
final GuestQuery guestQuery = GuestQuery(DBService.to.db);
// Prices
final PriceQuery priceQuery = PriceQuery(DBService.to.db);
// Courses
final CourseQuery courseQuery = CourseQuery(DBService.to.db);
final CourseRegistrationQuery registrationQuery =
    CourseRegistrationQuery(DBService.to.db);
// Sessions
final SessionQuery sessionQuery =
    SessionQuery(DBService.to.db); // native queries
final StaffSessionQuery staffSessionQuery =
    StaffSessionQuery(DBService.to.db); // staff sessions

final GuestSessionQuery guestSessionQuery = GuestSessionQuery(DBService.to.db);

// room sessions
final RoomSessionQuery roomSessionQuery = RoomSessionQuery(DBService.to.db);

// courses sessions
final CourseSessionQuery courseSessionQuery =
    CourseSessionQuery(DBService.to.db);

// Room and Reservation
final RoomQuery roomQuery = RoomQuery(DBService.to.db);

final ReservationQuery reservationQuery = ReservationQuery(DBService.to.db);
final GuestReservationQuery guestReservationQuery =
    GuestReservationQuery(DBService.to.db);
final CourseReservationQuery courseReservationQuery =
    CourseReservationQuery(DBService.to.db);

final CourseRegistrationQuery courseRegistrationQuery =
    CourseRegistrationQuery(DBService.to.db);
