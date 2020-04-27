import 'package:dashboard/core/redux/state/auth_state.dart';

abstract class ApiService {
  Future<AuthState> login(String email, String password);
  AuthState logout();
}