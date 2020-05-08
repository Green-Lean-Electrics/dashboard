import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/ui/responsive/screen_type_layout.dart';
import 'package:dashboard/ui/widgets/common/progress_indicator.dart';
import 'package:dashboard/ui/widgets/customers/customer_tile.dart';
import 'package:flutter/material.dart';

class ManagerCustomerView extends StatelessWidget {
  final List<User> customers;
  final Function(String) onCustomerDeleted;
  final String token;

  ManagerCustomerView({
    @required this.customers,
    @required this.onCustomerDeleted,
    @required this.token,
  });

  @override
  Widget build(BuildContext context) {
    if (customers == null) {
      return Center(
        child: GreenLeanProgressIndicator(),
      );
    }

    if (customers.length == 0) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.people, size: 30),
            Container(
              width: 0,
              height: 15,
            ),
            Text('No prosumers exist yet in the system',
                style: TextStyle(fontSize: 20))
          ],
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScreenTypeLayout(
        mobile: ListView.builder(
          itemCount: customers.length,
          itemBuilder: (context, index) => CustomerTile(
            customer: customers[index],
            onCustomerDelete: onCustomerDeleted,
          ),
        ),
        tablet: ListView.builder(
          itemCount: customers.length,
          itemBuilder: (context, index) => CustomerTile(
            onCustomerDelete: onCustomerDeleted,
            customer: customers[index],
          ),
        ),
        desktop: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 5.5,
          children: List.generate(
            customers.length,
            (index) => CustomerTile(
              onCustomerDelete: onCustomerDeleted,
              customer: customers[index],
            ),
          ),
        ),
      ),
    );
  }
}
