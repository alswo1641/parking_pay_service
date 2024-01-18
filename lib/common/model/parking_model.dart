import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'parking_model.freezed.dart';
part 'parking_model.g.dart';

@freezed
class ParkingLot with _$ParkingLot {
  const factory ParkingLot({
    required String prkplceNo,
    required String prkplceNm,
    String? prkplceSe,
    String? prkplceType,
    String? rdnmadr,
    String? lnmadr,
    int? prkcmprt,
    String? feedingSe,
    String? enforceSe,
    String? operDay,
    String? weekdayOperOpenHhmm,
    String? weekdayOperColseHhmm,
    String? satOperOperOpenHhmm,
    String? satOperCloseHhmm,
    String? holidayOperOpenHhmm,
    String? holidayCloseOpenHhmm,
    String? parkingchrgeInfo,
    int? basicTime,
    int? basicCharge,
    int? addUnitTime,
    int? addUnitCharge,
    int? dayCmmtktAdjTime,
    int? dayCmmtkt,
    int? monthCmmtkt,
    String? metpay,
    String? spcmnt,
    String? institutionNm,
    String? phoneNumber,
    double? latitude,
    double? longitude,
    @JsonKey(fromJson: _dateTimeFromString, toJson: _dateTimeToString)
    DateTime? referenceDate,
    String? insttCode,
  }) = _ParkingLot;

  factory ParkingLot.fromJson(Map<String, dynamic> json) =>
      _$ParkingLotFromJson(json);
}

DateTime? _dateTimeFromString(String? dateStr) {
  return dateStr == null ? null : DateTime.tryParse(dateStr);
}

String? _dateTimeToString(DateTime? dateTime) {
  return dateTime?.toIso8601String();
}
