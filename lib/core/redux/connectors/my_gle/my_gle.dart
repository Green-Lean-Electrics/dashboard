import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/models/my_gle_data.dart';
import 'package:dashboard/core/redux/actions/my_gle_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/views/prosumer_my_gle/prosumer_my_gle.dart';
import 'package:flutter/material.dart';

class ProsumerMyGLEViewConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, MyGLEData>(
      onInit: (store) {
        if (store.state.myGLEData == null) {
          store.dispatch(FetchMyGLEDataAction());
        }
      },
      converter: (store) => store.state.myGLEData,
      builder: (context, myGLEData) => ProsumerMyGLEView(
        myGLEData: myGLEData,
      ),
    );
  }
}
