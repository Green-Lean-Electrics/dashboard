import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:latlong/latlong.dart';

class GraphqlAPI extends ApiService {
  @override
  Future<AuthState> login(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<AuthState> signUp(String name, String email, String password, LatLng coords) {
    // TODO: implement signUp
    throw UnimplementedError();
  }

  @override
  AuthState logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
}