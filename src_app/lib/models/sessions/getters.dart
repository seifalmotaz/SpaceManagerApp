import 'package:flutter/material.dart';
import 'package:spacemanager/models/courses/src.dart';
import 'package:spacemanager/models/prices/src.dart';
import 'package:spacemanager/models/reservations/src.dart';
import 'package:spacemanager/models/rooms/src.dart';
import 'package:spacemanager/models/sessions/src.dart';

extension SessionGetters on Session {
  Future<Price> get price async => await PriceCRUDQuery.read(priceId!);
  Future<Room> get room async => await RoomCRUDQuery.read(roomId!);
  Future<Course> get course async => await CourseCRUDQuery.read(courseId!);
  Future<Reservation> get reservation async =>
      await ReservationCRUDQuery.read(reservationId!);

  Future<int?> getTotal() async {
    // Normal pricing
    if (priceId != null) {
      return await normalPricing();
    }
    // Course pricing
    if (courseId != null && reservationId != null) {
      return await coursePricing();
    }
    // Room pricing
    if (roomId != null && reservationId == null) {
      return await roomPricing();
    }
    // Reservation pricing
    if (reservationId != null && roomId != null) {
      return await reservationPricing();
    }
  }

  Future<int> normalPricing() async {
    Price p = await price;
    DateTimeRange t = DateTimeRange(
      start: startTime!,
      end: DateTime.now(),
    );
    Duration time = t.duration;

    double rate = p.rate!;
    double _totalPrice = 0;
    double i = time.inMinutes % 60;

    if (i < 5) {
      for (var i = 0; i < guestsCount!; i++) {
        _totalPrice = _totalPrice + (time.inHours * rate);
      }
    } else {
      for (var i = 0; i < guestsCount!; i++) {
        _totalPrice = _totalPrice + ((time.inHours + 1) * rate);
      }
    }
    return _totalPrice.round();
  }

  Future<int> coursePricing() async {
    Course c = await course;
    DateTimeRange t = DateTimeRange(
      start: startTime!,
      end: endTime ?? DateTime.now(),
    );
    Duration time = t.duration;

    double rate = c.rate!;
    double _totalPrice = 0;
    double i = time.inMinutes % 60;

    if (i < 10) {
      _totalPrice = _totalPrice + (time.inHours * rate);
    } else {
      _totalPrice = _totalPrice + ((time.inHours + 1) * rate);
    }

    return _totalPrice.round();
  }

  Future<int> roomPricing() async {
    Room r = await room;
    DateTimeRange t = DateTimeRange(
      start: startTime!,
      end: DateTime.now(),
    );
    Duration time = t.duration;

    double rate = r.rate!;
    double _totalPrice = 0;
    double i = time.inMinutes % 60;

    if (i <= 10) {
      _totalPrice = _totalPrice + (time.inHours * rate);
    } else {
      _totalPrice = _totalPrice + ((time.inHours + 1) * rate);
    }
    return _totalPrice.round();
  }

  Future<int> reservationPricing([bool hourly = false]) async {
    Reservation res = await reservation;
    Room ro = await room;
    DateTimeRange resT = DateTimeRange(
      start: res.startTime!,
      end: res.endTime!,
    );
    Duration resTime = resT.duration;

    DateTimeRange _currentTime = DateTimeRange(
      start: startTime!,
      end: DateTime.now(),
    );
    Duration currentTime = _currentTime.duration;

    double rate = ro.rate!;

    double _totalPrice = 0;
    int i = currentTime.inMinutes - resTime.inMinutes;

    if (i <= 10 || hourly) {
      _totalPrice = _totalPrice + (resTime.inHours * rate);
    } else {
      _totalPrice = _totalPrice + ((currentTime.inHours + 1) * rate);
    }

    if (res.isPrePaid!) {
      double reservationPrePaidPrice = 0;
      reservationPrePaidPrice =
          reservationPrePaidPrice + (resTime.inHours * rate);

      _totalPrice =
          _totalPrice - (reservationPrePaidPrice * res.prePaidPersent);
    }

    return _totalPrice.round();
  }
}
