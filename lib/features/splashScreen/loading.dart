import 'package:eco_bite/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 200.0, // Set a maximum height
        ),
        child: SpinKitCubeGrid(
          color: AppColor.primary,
          size: 70.0,
        ),
      ),
    );
  }
}
