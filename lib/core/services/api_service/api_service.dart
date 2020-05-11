import 'dart:typed_data';

import 'package:dashboard/core/enums/coal_plant_state.dart';
import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:latlong/latlong.dart';

abstract class ApiService {
  // COMMON API CALLS

  Future<AuthState> login(String email, String password);
  Future<AuthState> signUp(
    String name,
    String email,
    String password,
    LatLng coords,
  );
  AuthState logout();
  Future<User> updateProfile(
    String name,
    String email,
    String password,
    Uint8List image,
  );

  // PROSUMER API CALLLS

  Future<void> setHouseholdRatio(double newRatio);
  Future<MyGLEData> fetchMyGLEData(String householdId);
  Future<String> uploadMyGLEPicture(
      Uint8List picture, MyGLEPictureKind pictureKind);

  // MANAGER API CALLS

  Future<List<User>> fetchUsers();
  Future<void> deleteCustomer(String customerEmail);
  Future<void> blockSelling(String householdId, int seconds);
  Future<void> setElectricityPrice(double newPrice);
  Future<void> setCoalPlantRatio(double ratio);
  Future<void> setCoalPlantState(CoalPlantState state);
}
