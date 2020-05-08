// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    windSpeed: (json['windSpeed'] as num)?.toDouble(),
    temperature: (json['temperature'] as num)?.toDouble(),
    electricityConsumption: (json['electricityConsumption'] as num)?.toDouble(),
    electricityProduction: (json['electricityProduction'] as num)?.toDouble(),
    bufferLoad: (json['bufferLoad'] as num)?.toDouble(),
    ratio: (json['ratio'] as num)?.toDouble(),
    failure: json['failure'] as bool,
    isSellingBlocked: json['isSellingBlocked'] as bool,
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'windSpeed': instance.windSpeed,
      'temperature': instance.temperature,
      'electricityConsumption': instance.electricityConsumption,
      'electricityProduction': instance.electricityProduction,
      'bufferLoad': instance.bufferLoad,
      'ratio': instance.ratio,
      'isSellingBlocked': instance.isSellingBlocked,
      'failure': instance.failure,
    };
