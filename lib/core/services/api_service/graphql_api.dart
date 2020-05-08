import 'dart:typed_data';
import 'package:dashboard/core/enums/my_gle_picture_kind.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/redux/state/auth_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/core/services/store_service.dart';
import 'package:dashboard/locator.dart';
import 'package:latlong/latlong.dart';
import 'package:graphql/client.dart';

class GraphqlAPI extends ApiService {
  final GraphQLClient _client = _buildGraphQLClient();

  @override
  Future<AuthState> login(String email, String password) async {
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation login($email: String!, $password: String!){
          login(email: $email, password: $password){
            user {
              name
              email
              householdId
              profilePictureURL
              role
            }
            token
          }
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'email': email,
        'password': password,
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }

    return AuthState(
      user: User.fromJson(result.data['login']['user']),
      token: result.data['login']['token'],
      isAuthenticated: true,
    );
  }

  @override
  Future<AuthState> signUp(
    String name,
    String email,
    String password,
    LatLng coords,
  ) async {
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation signup($input: SignupInput!){
          signup(input: $input){
            user {
              name
              email
              householdId
              profilePictureURL
              role
            }
            token
          }
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'input': <String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
          'xCoord': coords.latitude,
          'yCoord': coords.longitude
        },
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }

    return AuthState(
      user: User.fromJson(result.data['signup']['user']),
      token: result.data['signup']['token'],
      isAuthenticated: true,
    );
  }

  @override
  AuthState logout() {
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation logout(){
          logout
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
    );

    _client.mutate(options);

    return AuthState(user: null, token: "", isAuthenticated: false);
  }

  @override
  Future<User> updateProfile(
    String name,
    String email,
    String password,
    Uint8List image,
  ) async {
    var multipartFile;
    if (image != null) {
      multipartFile = MultipartFile.fromBytes(
        'picture',
        image,
        filename: '${DateTime.now().second}.jpg',
        contentType: MediaType("image", "jpg"),
      );
    }
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation updateUser($input: UpdateUserInput!) {
          updateUser(input: $input) {
            name
            email
            householdId
            role
            profilePictureURL
          }
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'input': <String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
          'picture': multipartFile,
        },
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }

    return User.fromJson(result.data['updateUser']);
  }

  @override
  Future<void> setHouseholdRatio(double newRatio) async {
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation setHouseholdRatio($newRatio: Float!){
          setHouseholdRatio(newRatio: $newRatio)
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{'newRatio': newRatio},
    );
    final QueryResult result = await _client.mutate(options);
    if (result.hasException) {
      throw UserException(result.exception.toString());
    }
  }

  @override
  Future<MyGLEData> fetchMyGLEData(String householdId) async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(r'''
        query House($id: String!){
          house(id: $id){
            frontPictureURL,
            backPictureURL,
            coords{
              x
              y
            }
          }
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'id': householdId,
      },
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }

    return MyGLEData(
      frontPictureURL: result.data['house']['frontPictureURL'],
      backPictureURL: result.data['house']['backPictureURL'],
      xCoord: result.data['house']['coords']['x'],
      yCoord: result.data['house']['coords']['y'],
    );
  }

  @override
  Future<String> uploadMyGLEPicture(
    Uint8List picture,
    MyGLEPictureKind pictureKind,
  ) async {
    var multipartFile = MultipartFile.fromBytes(
      'picture',
      picture,
      filename: '${DateTime.now().second}.jpg',
      contentType: MediaType("image", "jpg"),
    );

    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation uploadHouseholdPicture($picture: Upload!,  $kind: String!){
          uploadHouseholdPicture(picture: $picture, pictureKind: $kind)
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'picture': multipartFile,
        'kind': pictureKind.toString().split('.').last,
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }

    return result.data['uploadHouseholdPicture'];
  }

  @override
  Future<List<User>> fetchUsers() async {
    final QueryOptions options = QueryOptions(
      documentNode: gql(r'''
        query Users{
          users{
            name
            email
            householdId
            role
            profilePictureURL
          }
        }
      '''),
      fetchPolicy: FetchPolicy.cacheAndNetwork,
    );

    final QueryResult result = await _client.query(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }

    return (result.data['users']).map<User>(
      (element) {
        return User.fromJson(element);
      },
    ).toList();
  }

  @override
  Future<void> deleteCustomer(String customerEmail) async {
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation deleteUser($email: String!){
          deleteUser(userEmail: $email)
        }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'email': customerEmail,
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }
  }

  @override
  Future<void> blockSelling(String householdId, int seconds) async {
    final MutationOptions options = MutationOptions(
      documentNode: gql(r'''
        mutation blockSelling($id: String!, $seconds: Int!){
            blockSelling(id: $id, seconds: $seconds)
          }
      '''),
      fetchPolicy: FetchPolicy.noCache,
      variables: <String, dynamic>{
        'id': householdId,
        'seconds': seconds,
      },
    );

    final QueryResult result = await _client.mutate(options);

    if (result.hasException) {
      throw UserException(result.exception.toString());
    }
  }
}

GraphQLClient _buildGraphQLClient() {
  final HttpLink _httpLink = HttpLink(
    uri: 'https://pure-badlands-64215.herokuapp.com/graphql',
  );

  final AuthLink _authLink = AuthLink(
    getToken: () async {
      Store<AppState> store = await locator<StoreService>().getStore();
      if (!store.state.authState.isAuthenticated) {
        return "";
      }
      return store.state.authState.token;
    },
  );

  final ErrorLink _errorLink = ErrorLink(
    errorHandler: (ErrorResponse response) {
      throw UserException(response.exception.toString());
    },
  );

  final Link _link = Link.from([_authLink, _errorLink, _httpLink]);
  return GraphQLClient(
    cache: InMemoryCache(),
    link: _link,
  );
}
