import 'dart:typed_data';

import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:latlong/latlong.dart';

abstract class ApiService {
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

  Future<void> setHouseholdRatio(double newRatio);
}
