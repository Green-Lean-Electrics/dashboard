import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';

class GraphqlAPI extends ApiService {
  @override
  Future<AuthState> login(String email, String password) async {
    throw UnimplementedError();
  }

  @override
  AuthState logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }
  
}