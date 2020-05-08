import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/core/redux/actions/customers_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/views/manager_customers/manager_customers.dart';
import 'package:flutter/material.dart';

class ManagerCustomersViewConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) {
        if (store.state.customers == null) {
          store.dispatch(FetchCustomersAction());
        }
      },
      model: ViewModel(),
      builder: (context, model) => ManagerCustomerView(
        customers: model.customers,
        onCustomerDeleted: model.onUserDelete,
        token: model.token,
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  List<User> customers;
  Function(String) onUserDelete;
  String token;

  ViewModel.build({
    @required this.customers,
    @required this.onUserDelete,
    @required this.token,
  }) : super(equals: [customers]);

  @override
  BaseModel fromStore() => ViewModel.build(
        customers: state.customers,
        token: state.authState.token,
        onUserDelete: (email) =>
            dispatch(DeleteCustomerAction(customerEmail: email)),
      );
}
