import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todoapp/controller/widget_controller/color.dart';

class LoadingWidget extends StatelessWidget {
  double height = 60.00;
  double width = 60.00;

  LoadingWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.whiteColor,
            ),
            child: SpinKitRing(
              lineWidth: 4.0,
              color: AppColors.primaryColor,
              size: 40.0,
            ),
          )
        ],
      ),
    );
  }
}