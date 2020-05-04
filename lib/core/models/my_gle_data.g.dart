// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_gle_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyGLEData _$MyGLEDataFromJson(Map<String, dynamic> json) {
  return MyGLEData(
    frontPictureURL: json['frontPictureURL'] as String,
    backPictureURL: json['backPictureURL'] as String,
    xCoord: (json['xCoord'] as num)?.toDouble(),
    yCoord: (json['yCoord'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$MyGLEDataToJson(MyGLEData instance) => <String, dynamic>{
      'frontPictureURL': instance.frontPictureURL,
      'backPictureURL': instance.backPictureURL,
      'xCoord': instance.xCoord,
      'yCoord': instance.yCoord,
    };
