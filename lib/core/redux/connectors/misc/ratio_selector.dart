import 'package:async_redux/async_redux.dart';
import 'package:dashboard/core/redux/actions/ratio_actions.dart';
import 'package:dashboard/core/redux/app_state.dart';
import 'package:dashboard/ui/widgets/prosumer_home/ratio_selector.dart';
import 'package:flutter/material.dart';

class RatioSelectorConnector extends StatelessWidget {
  final bool isProsuming;
  final double currentRatio;

  RatioSelectorConnector({
    @required this.isProsuming,
    @required this.currentRatio,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Function(double)>(
      converter: (store) => (newRatio) =>
          store.dispatch(RatioSelectionAction(newRatio: newRatio)),
      builder: (context, onRationSelected) => RatioSelector(
        currentRatio: currentRatio,
        isProsuming: isProsuming,
        onRatioSelected: onRationSelected,
      ),
    );
  }
}
