import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/enums/user_role.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';

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
          userRole: UserRole.PROSUMER_ROLE,
        ),
        token: "TOKEN_HERE",
        isAuthenticated: true,
      );
    }
    throw UserException('Unknown user or passowrd');
  }

  @override
  AuthState logout() {
    return AuthState(
      user: null,
      token: "",
      isAuthenticated: false,
    );
  }
}
