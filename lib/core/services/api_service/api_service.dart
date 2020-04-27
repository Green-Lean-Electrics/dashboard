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
}
