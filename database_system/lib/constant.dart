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

// Guests
final GuestQuery guestQuery = GuestQuery(DBService.to.db);
// Prices
final PriceQuery priceQuery = PriceQuery(DBService.to.db);
// Courses
final CourseQuery courseQuery = CourseQuery(DBService.to.db);
final CourseRegistrationQuery registrationQuery =
    CourseRegistrationQuery(DBService.to.db);
// Sessions
final StaffSessionQuery staffSessionQuery = StaffSessionQuery(DBService.to.db);
final GuestSessionQuery guestSessionQuery = GuestSessionQuery(DBService.to.db);
final RoomSessionQuery roomSessionQuery = RoomSessionQuery(DBService.to.db);
final ReservationSessionQuery reservationSessionQuery =
    ReservationSessionQuery(DBService.to.db);
final CourseSessionQuery courseSessionQuery =
    CourseSessionQuery(DBService.to.db);
// Room and Reservation
final GuestReservationQuery guestReservationQuery =
    GuestReservationQuery(DBService.to.db);
final CourseRegistrationQuery courseRegistrationQuery =
    CourseRegistrationQuery(DBService.to.db);
final RoomQuery roomQuery = RoomQuery(DBService.to.db);
