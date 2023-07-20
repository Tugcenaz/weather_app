import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/text_styles.dart';

class MyCustomButton extends StatelessWidget {
  String title;
  VoidCallback onTap;

  MyCustomButton({super.key, required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: (){
        onTap();
      },
      child: Container(
        width: 220.sp,
        height: 64.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.sp),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 30.sp,
                  offset: Offset(-4.sp, 0.sp),
                  color: Colors.black.withOpacity(0.2))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyles.generalWhiteTextStyle3(
                fontSize: 16.sp,
                color: const Color(0xff444E72),
              ),
            ),
            SizedBox(width: 10.w,),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 14.sp,
              color: const Color(0xff444E72),
            ),
          ],
        ),
      ),
    );
  }
}
