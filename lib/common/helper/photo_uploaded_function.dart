import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PhotoUploadedFunction {
  void show(BuildContext context) {
    showDialog<Widget>(
      context: context,
      builder: (BuildContext dialogContext) {
        return GestureDetector(
          onTap: () {
            Navigator.of(dialogContext).pop();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/owl/photo_blue.json',
                width: 300,
                height: 300,
              ),
            ],
          ),
        );
      },
    );

    // Future.microtask(() {
    //   Future.delayed(const Duration(seconds: 4), () {
    //     if (Navigator.of(context).canPop()) {
    //       //   Navigator.of(context).pop();
    //     }
    //   });
    // });
  }
}
