import 'package:dashboard/core/models/user.dart';
import 'package:dashboard/ui/widgets/customers/blocking_dialog.dart';
import 'package:dashboard/ui/widgets/customers/delete_dialog.dart';
import 'package:flutter/material.dart';

class CustomerTile extends StatelessWidget {
  final User customer;
  final Function(String) onCustomerDelete;

  CustomerTile({
    @required this.customer,
    @required this.onCustomerDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                isThreeLine: true,
                leading: CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage(
                      'https://pure-badlands-64215.herokuapp.com' +
                          customer.profilePictureURL),
                  backgroundColor: Colors.transparent,
                ),
                title: Text(customer.name),
                subtitle: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(customer.email),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: false
                              ? Colors.pink.withOpacity(0.3)
                              : Color.fromRGBO(5, 247, 150, 0.2),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          child: Text(
                            false ? '3h ago' : 'ONLINE',
                            style: TextStyle(
                                color: false
                                    ? Colors.pink
                                    : Color.fromRGBO(5, 247, 150, 1),
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                hoverColor: Color.fromRGBO(5, 247, 150, 0.2),
                icon: Icon(Icons.power_settings_new, size: 30),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => BlockingDialog(
                          householdId: customer.householdId,
                        )),
                tooltip: 'Block production',
              ),
              IconButton(
                hoverColor: Color.fromRGBO(5, 247, 150, 0.2),
                icon: Icon(Icons.remove_red_eye, size: 30),
                onPressed: () {},
                tooltip: 'See prosumer\'s system system',
              ),
              IconButton(
                hoverColor: Color.fromRGBO(5, 247, 150, 0.2),
                icon: Icon(Icons.delete_forever, size: 30),
                onPressed: () => showDialog(
                    context: context,
                    builder: (context) => DeleteDialog(
                          onUserDelete: () => onCustomerDelete(customer.email),
                          username: customer.name,
                        )),
                tooltip: 'Delete account',
              ),
              Container(width: 20, height: 0)
            ],
          )
        ],
      ),
    );
  }
}