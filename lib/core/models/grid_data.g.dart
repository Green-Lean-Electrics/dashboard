// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridData _$GridDataFromJson(Map<String, dynamic> json) {
  return GridData(
    realPrice: (json['realPrice'] as num)?.toDouble(),
    estimatedPrice: (json['estimatedPrice'] as num)?.toDouble(),
    ratio: (json['ratio'] as num)?.toDouble(),
    totalDemand: (json['totalDemand'] as num)?.toDouble(),
    bufferLoad: (json['bufferLoad'] as num)?.toDouble(),
    coalPlantProduction: (json['coalPlantProduction'] as num)?.toDouble(),
    coalPlantState:
        _$enumDecodeNullable(_$CoalPlantStateEnumMap, json['coalPlantState']),
    blackouts: (json['blackouts'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GridDataToJson(GridData instance) => <String, dynamic>{
      'realPrice': instance.realPrice,
      'estimatedPrice': instance.estimatedPrice,
      'totalDemand': instance.totalDemand,
      'bufferLoad': instance.bufferLoad,
      'ratio': instance.ratio,
      'coalPlantProduction': instance.coalPlantProduction,
      'coalPlantState': _$CoalPlantStateEnumMap[instance.coalPlantState],
      'blackouts': instance.blackouts,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$CoalPlantStateEnumMap = {
  CoalPlantState.STARTING: 'STARTING',
  CoalPlantState.RUNNING: 'RUNNING',
  CoalPlantState.STOPPING: 'STOPPING',
  CoalPlantState.STOPPED: 'STOPPED',
};
