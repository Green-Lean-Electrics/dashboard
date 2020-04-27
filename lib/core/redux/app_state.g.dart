// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) {
  return AppState(
    authState: json['authState'] == null
        ? null
        : AuthState.fromJson(json['authState'] as Map<String, dynamic>),
    isLoading: json['isLoading'] as bool,
    menuOption: _$enumDecodeNullable(_$MenuOptionEnumMap, json['menuOption']),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'authState': instance.authState,
      'isLoading': instance.isLoading,
      'menuOption': _$MenuOptionEnumMap[instance.menuOption],
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

const _$MenuOptionEnumMap = {
  MenuOption.PROSUMER_HOME: 'PROSUMER_HOME',
  MenuOption.PROSUMER_MY_GLE: 'PROSUMER_MY_GLE',
  MenuOption.PROSUMER_SETTINGS: 'PROSUMER_SETTINGS',
};
