import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_data.g.dart';

@JsonSerializable()
class HomeData {
  final double windSpeed;
  final double temperature;
  final double electricityConsumption;
  final double electricityProduction;
  final double bufferLoad;
  final double ratio;
  final bool isSellingBlocked;
  final bool failure;

  HomeData({
    @required this.windSpeed,
    @required this.temperature,
    @required this.electricityConsumption,
    @required this.electricityProduction,
    @required this.bufferLoad,
    @required this.ratio,
    @required this.failure,
    @required this.isSellingBlocked,
  });

  static HomeData emptyData() => HomeData(
        windSpeed: 2.0,
        temperature: 12.0,
        electricityConsumption: 0.0,
        electricityProduction: 0.0,
        bufferLoad: 4.0,
        ratio: 0.5,
        failure: false,
        isSellingBlocked: false,
      );

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);
}
