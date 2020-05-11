import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grid_data.g.dart';

@JsonSerializable()
class GridData {
  final double realPrice;
  final double estimatedPrice;
  final double totalDemand;
  final double bufferLoad;
  final double ratio;
  final CoalPlantState coalPlantState;

  GridData({
    @required this.realPrice,
    @required this.estimatedPrice,
    @required this.ratio,
    @required this.totalDemand,
    @required this.bufferLoad,
    @required this.coalPlantState,
  });

  static GridData emptyData() => GridData(
        realPrice: 2.0,
        estimatedPrice: 1.8,
        ratio: 0.5,
        totalDemand: 120,
        bufferLoad: 65,
        coalPlantState: CoalPlantState.STARTING,
      );

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  factory GridData.fromJson(Map<String, dynamic> json) =>
      _$GridDataFromJson(json);

  Map<String, dynamic> toJson() => _$GridDataToJson(this);      
}
