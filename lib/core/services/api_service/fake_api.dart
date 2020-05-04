import 'dart:typed_data';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/enums/user_role.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:latlong/latlong.dart';

class FakeAPI implements ApiService {
  @override
  Future<AuthState> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if (email == 'hola@pedromalo.dev' && password == 'asdf') {
      return AuthState(
        user: User(
          name: "Pedro Malo",
          email: "hola@pedromalo.dev",
          profilePictureURL:
              "https://avatars1.githubusercontent.com/u/3115756?s=460&u=f2730d80135af68a86e4e68b5e3b3e7849bb3471&v=4",
          householdId: "",
          role: UserRole.PROSUMER_ROLE,
        ),
        token: "TOKEN_HERE",
        isAuthenticated: true,
      );
    }
    throw UserException('Unknown user or passowrd');
  }

  @override
  Future<AuthState> signUp(
    String name,
    String email,
    String password,
    LatLng coords,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    return AuthState(
      user: User(
        name: name,
        email: email,
        profilePictureURL:
            "https://avatars1.githubusercontent.com/u/3115756?s=460&u=f2730d80135af68a86e4e68b5e3b3e7849bb3471&v=4",
        householdId: "",
        role: UserRole.PROSUMER_ROLE,
      ),
      token: "TOKEN_HERE",
      isAuthenticated: true,
    );
  }

  @override
  AuthState logout() {
    return AuthState(
      user: null,
      token: "",
      isAuthenticated: false,
    );
  }

  @override
  Future<User> updateProfile(
    String name,
    String email,
    String password,
    Uint8List image,
  ) async {
    await Future.delayed(Duration(seconds: 2));
    return User(
      name: name,
      householdId: "",
      email: email,
      profilePictureURL:
          "https://avatars1.githubusercontent.com/u/3115756?s=460&u=f2730d80135af68a86e4e68b5e3b3e7849bb3471&v=4",
      role: UserRole.PROSUMER_ROLE,
    );
  }

  @override
  Future<void> setHouseholdRatio(double newRatio) async {
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<MyGLEData> fetchMyGLEData(String householdId) async {
    await Future.delayed(Duration(seconds: 2));
    return MyGLEData(
      frontPictureURL:
          'https://nitrocdn.com/OKfOZtnsuRztvuLgtZmxNVCzEpuOmcFt/assets/static/optimized/rev-4a0c718/wp-content/uploads/2019/03/Best-Home-Wind-Turbine-KiT.jpg',
      backPictureURL:
          'https://nitrocdn.com/OKfOZtnsuRztvuLgtZmxNVCzEpuOmcFt/assets/static/optimized/rev-4a0c718/wp-content/uploads/2019/03/Best-Home-Wind-Turbine-KiT.jpg',
      xCoord: 65.621653,
      yCoord: 22.119347,
    );
  }

  @override
  Future<String> uploadMyGLEPicture(
      Uint8List picture, MyGLEPictureKind pictureKind) async {
    await Future.delayed(Duration(seconds: 2));
    return 'https://nitrocdn.com/OKfOZtnsuRztvuLgtZmxNVCzEpuOmcFt/assets/static/optimized/rev-4a0c718/wp-content/uploads/2019/03/Best-Home-Wind-Turbine-KiT.jpg';
  }
}
