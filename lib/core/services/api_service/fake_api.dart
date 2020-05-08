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

  @override
  Future<List<User>> fetchUsers() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      User(
        name: 'Bob Dylan',
        email: 'dylan@bob.com',
        profilePictureURL: "https://lh3.googleusercontent.com/proxy/1xqT7FulCulpoRPUqP0JHE21Xop0jI0ch_NdsPY33gxo4pidUBERXXEKKfyUk-5_1-QfUwBuQyZSbaMJWKT02AwX2Bs4pGDdab9g5FlQdsskuiLKeHAJog",
        householdId: "",
        role: UserRole.PROSUMER_ROLE,
      ),
      User(
        name: 'Albert Einstein',
        email: 'einstein@ltu.se',
        profilePictureURL: "https://www.lavanguardia.com/r/GODO/LV/p7/WebSite/2020/04/18/Recortada/LV_20150906_LV_FOTOS_D_54435137640-kZSH--656x841@LaVanguardia-Web.jpg",
        householdId: "",
        role: UserRole.PROSUMER_ROLE,
      ),
      User(
        name: 'Roy Orbison',
        email: 'booking@orbison.com',
        profilePictureURL: "https://1.bp.blogspot.com/-tWU0BTPXGLs/T5VV4NWeG3I/AAAAAAAALwk/taE5g9Cn4IU/s1600/david-redfern-21.jpg",
        householdId: "",
        role: UserRole.PROSUMER_ROLE,
      )
    ];
  }

  @override
  Future<void> deleteCustomer(String customerEmail) async{
    await Future.delayed(Duration(seconds: 2));
  }

  @override
  Future<void> blockSelling(String householdId, int seconds) async {
    await Future.delayed(Duration(seconds: 2));
  }
}
