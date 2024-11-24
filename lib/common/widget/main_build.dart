import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:findpro/common/widget/no_connection_widget.dart';
import 'package:flutter/material.dart';

class MainBuild {
  MainBuild._();

  static Widget build(BuildContext context, Widget? child) {
    return StreamBuilder<ConnectivityResult>(
      stream: Connectivity().onConnectivityChanged,
      builder: (context, snapshot) {
        final isConnected = snapshot.data != ConnectivityResult.none;
        return Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  child ?? const SizedBox(),
                  if (!isConnected) const NoConnectionWidget(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
