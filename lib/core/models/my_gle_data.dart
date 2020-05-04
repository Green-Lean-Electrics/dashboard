import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

part 'my_gle_data.g.dart';

@JsonSerializable()
class MyGLEData {
  final String frontPictureURL;
  final String backPictureURL;
  final double xCoord;
  final double yCoord;

  MyGLEData({
    @required this.frontPictureURL,
    @required this.backPictureURL,
    @required this.xCoord,
    @required this.yCoord,
  });

  @override
  String toString() {
    var encoder = new JsonEncoder.withIndent("     ");
    return encoder.convert(this.toJson());
  }

  MyGLEData copy({
    String frontPictureURL,
    String backPictureURL,
    double xCoord,
    double yCoord,
  }) {
    return MyGLEData(
      frontPictureURL: frontPictureURL ?? this.frontPictureURL,
      backPictureURL: backPictureURL ?? this.backPictureURL,
      xCoord: xCoord ?? this.xCoord,
      yCoord: yCoord ?? this.yCoord,
    );
  }

  @override
  int get hashCode => frontPictureURL.hashCode ^ backPictureURL.hashCode;

  factory MyGLEData.fromJson(Map<String, dynamic> json) =>
      _$MyGLEDataFromJson(json);

  Map<String, dynamic> toJson() => _$MyGLEDataToJson(this);

  @override
  bool operator ==(other) {
    return identical(this, other) ||
        (other is MyGLEData &&
            (this.frontPictureURL == other.frontPictureURL &&
                this.backPictureURL == other.backPictureURL &&
                this.xCoord == other.xCoord &&
                this.yCoord == other.yCoord));
  }
}
