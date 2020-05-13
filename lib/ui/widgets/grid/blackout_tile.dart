import 'package:dashboard/core/models/user.dart';
import 'package:flutter/material.dart';

class BlackoutTile extends StatelessWidget {
  final User user;

  BlackoutTile({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(
                    'https://pure-badlands-64215.herokuapp.com' +
                        user.profilePictureURL),
                backgroundColor: Colors.transparent,
              ),
              title: Text(user.name),
              subtitle: Text(user.email),
            ),
          ),
        )
      ],
    );
  }
}
