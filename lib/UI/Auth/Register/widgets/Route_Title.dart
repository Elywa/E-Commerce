import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RouteTitle extends StatelessWidget {
  const RouteTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 40.h, right: 96.w, left: 94.w, bottom: 56.9.h),
      child: Container(
        width: MediaQuery.of(context).size.width * .5,
        height: MediaQuery.of(context).size.height * .1,
        decoration: const BoxDecoration(
          // color: Colors.transparent,
          image: DecorationImage(
              image: AssetImage(
                'assets/images/Route title.png',
              ),
              fit: BoxFit.fill),
        ),
      ),
    );
  }
}
