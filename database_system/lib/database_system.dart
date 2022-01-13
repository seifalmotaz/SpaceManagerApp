library database_system;

import 'package:database_system/models.dart';

// Guests
final GuestQuery guestQuery = GuestQuery(DBService.to.db);
// Prices
final PriceQuery priceQuery = PriceQuery(DBService.to.db);
// Courses
final CourseQuery courseQuery = CourseQuery(DBService.to.db);
final CourseRegistrationQuery registrationQuery =
    CourseRegistrationQuery(DBService.to.db);
// Sessions
final GuestSessionQuery guestSessionQuery = GuestSessionQuery(DBService.to.db);
final RoomSessionQuery roomSessionQuery = RoomSessionQuery(DBService.to.db);
final CourseSessionQuery courseSessionQuery =
    CourseSessionQuery(DBService.to.db);
// Room and Reservation
final GuestReservationQuery guestReservationQuery =
    GuestReservationQuery(DBService.to.db);
final CourseRegistrationQuery courseRegistrationQuery =
    CourseRegistrationQuery(DBService.to.db);
final RoomQuery roomQuery = RoomQuery(DBService.to.db);
