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
    loadingLocations: (json['loadingLocations'] as List)
        ?.map((e) => _$enumDecodeNullable(_$LoadingLocationsEnumMap, e))
        ?.toSet(),
    menuOption: _$enumDecodeNullable(_$MenuOptionEnumMap, json['menuOption']),
    myGLEData: json['myGLEData'] == null
        ? null
        : MyGLEData.fromJson(json['myGLEData'] as Map<String, dynamic>),
    customers: (json['customers'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'authState': instance.authState,
      'loadingLocations': instance.loadingLocations
          ?.map((e) => _$LoadingLocationsEnumMap[e])
          ?.toList(),
      'menuOption': _$MenuOptionEnumMap[instance.menuOption],
      'myGLEData': instance.myGLEData,
      'customers': instance.customers,
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

const _$LoadingLocationsEnumMap = {
  LoadingLocations.FRONT_YARD_PICTURE: 'FRONT_YARD_PICTURE',
  LoadingLocations.BACK_YARD_PICTURE: 'BACK_YARD_PICTURE',
  LoadingLocations.LOGIN_FORM: 'LOGIN_FORM',
  LoadingLocations.SIGNUP_FORM: 'SIGNUP_FORM',
  LoadingLocations.SETTINGS_FORM: 'SETTINGS_FORM',
  LoadingLocations.RATIO_SELECTION: 'RATIO_SELECTION',
};

const _$MenuOptionEnumMap = {
  MenuOption.PROSUMER_HOME: 'PROSUMER_HOME',
  MenuOption.PROSUMER_MY_GLE: 'PROSUMER_MY_GLE',
  MenuOption.SETTINGS: 'SETTINGS',
  MenuOption.MANAGER_GRID: 'MANAGER_GRID',
  MenuOption.MANAGER_GLE_USERS: 'MANAGER_GLE_USERS',
};
