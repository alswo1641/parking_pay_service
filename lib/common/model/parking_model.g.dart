// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParkingLotImpl _$$ParkingLotImplFromJson(Map<String, dynamic> json) =>
    _$ParkingLotImpl(
      prkplceNo: json['prkplceNo'] as String,
      prkplceNm: json['prkplceNm'] as String,
      prkplceSe: json['prkplceSe'] as String?,
      prkplceType: json['prkplceType'] as String?,
      rdnmadr: json['rdnmadr'] as String?,
      lnmadr: json['lnmadr'] as String?,
      prkcmprt: json['prkcmprt'] as int?,
      feedingSe: json['feedingSe'] as String?,
      enforceSe: json['enforceSe'] as String?,
      operDay: json['operDay'] as String?,
      weekdayOperOpenHhmm: json['weekdayOperOpenHhmm'] as String?,
      weekdayOperColseHhmm: json['weekdayOperColseHhmm'] as String?,
      satOperOperOpenHhmm: json['satOperOperOpenHhmm'] as String?,
      satOperCloseHhmm: json['satOperCloseHhmm'] as String?,
      holidayOperOpenHhmm: json['holidayOperOpenHhmm'] as String?,
      holidayCloseOpenHhmm: json['holidayCloseOpenHhmm'] as String?,
      parkingchrgeInfo: json['parkingchrgeInfo'] as String?,
      basicTime: json['basicTime'] as int?,
      basicCharge: json['basicCharge'] as int?,
      addUnitTime: json['addUnitTime'] as int?,
      addUnitCharge: json['addUnitCharge'] as int?,
      dayCmmtktAdjTime: json['dayCmmtktAdjTime'] as int?,
      dayCmmtkt: json['dayCmmtkt'] as int?,
      monthCmmtkt: json['monthCmmtkt'] as int?,
      metpay: json['metpay'] as String?,
      spcmnt: json['spcmnt'] as String?,
      institutionNm: json['institutionNm'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      referenceDate: _dateTimeFromString(json['referenceDate'] as String?),
      insttCode: json['insttCode'] as String?,
    );

Map<String, dynamic> _$$ParkingLotImplToJson(_$ParkingLotImpl instance) =>
    <String, dynamic>{
      'prkplceNo': instance.prkplceNo,
      'prkplceNm': instance.prkplceNm,
      'prkplceSe': instance.prkplceSe,
      'prkplceType': instance.prkplceType,
      'rdnmadr': instance.rdnmadr,
      'lnmadr': instance.lnmadr,
      'prkcmprt': instance.prkcmprt,
      'feedingSe': instance.feedingSe,
      'enforceSe': instance.enforceSe,
      'operDay': instance.operDay,
      'weekdayOperOpenHhmm': instance.weekdayOperOpenHhmm,
      'weekdayOperColseHhmm': instance.weekdayOperColseHhmm,
      'satOperOperOpenHhmm': instance.satOperOperOpenHhmm,
      'satOperCloseHhmm': instance.satOperCloseHhmm,
      'holidayOperOpenHhmm': instance.holidayOperOpenHhmm,
      'holidayCloseOpenHhmm': instance.holidayCloseOpenHhmm,
      'parkingchrgeInfo': instance.parkingchrgeInfo,
      'basicTime': instance.basicTime,
      'basicCharge': instance.basicCharge,
      'addUnitTime': instance.addUnitTime,
      'addUnitCharge': instance.addUnitCharge,
      'dayCmmtktAdjTime': instance.dayCmmtktAdjTime,
      'dayCmmtkt': instance.dayCmmtkt,
      'monthCmmtkt': instance.monthCmmtkt,
      'metpay': instance.metpay,
      'spcmnt': instance.spcmnt,
      'institutionNm': instance.institutionNm,
      'phoneNumber': instance.phoneNumber,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'referenceDate': _dateTimeToString(instance.referenceDate),
      'insttCode': instance.insttCode,
    };
