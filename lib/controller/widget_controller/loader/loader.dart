
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'loader_widget.dart';

class LoadScreen extends  StatefulWidget{
  LoadScreen({Key? key,required this.widget, required this.isLoading}) : super(key: key);
  Widget? widget;
  bool? isLoading;

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: LoadingOverlay(
          isLoading: widget.isLoading ?? false,
          opacity: 1.0,
          color: Colors.transparent,
          progressIndicator:  LoadingWidget(),
          child: widget.widget!
      )
    );
  }
}

// class LoadingWidget extends StatelessWidget {
//   double height = 60.00;
//   double width = 60.00;
//
//   LoadingWidget({Key? key,}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return SizedBox(
//       height: height,
//       width: width,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//               height: 120.00,
//               width: 120.00,
//               padding: const EdgeInsets.all(10),
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   color: Colors.white
//               ),
//               child: Center(
//                   child: Image.asset(strGIF_LOADING)
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }

