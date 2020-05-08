import 'dart:async';
import 'package:meta/meta.dart';

import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/core/services/api_service/api_service.dart';
import 'package:dashboard/locator.dart';

class FetchCustomersAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    ApiService apiService = locator<ApiService>();
    List<User> customers = await apiService.fetchUsers();
    return state.copy(customers: customers);
  }
}

class DeleteCustomerAction extends ReduxAction<AppState> {
  final String customerEmail;

  DeleteCustomerAction({@required this.customerEmail});

  @override
  AppState reduce() {
    ApiService apiService = locator<ApiService>();
    apiService.deleteCustomer(customerEmail);
    return state.copy(
      customers: List.of(
        state.customers
          ..removeWhere((customer) => customer.email == customerEmail),
      ),
    );
  }
}
