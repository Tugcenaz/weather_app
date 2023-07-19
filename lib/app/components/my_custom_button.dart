import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/styles/text_styles.dart';

class MyCustomButton extends StatelessWidget {
  String title;

  MyCustomButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: () {
        debugPrint('Tahmin sayfası açılacak...');
      },
      child: Container(
        width: 220.sp,
        height: 64.sp,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.sp),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 20.sp,
                  offset: Offset(-4.sp, 0.sp),
                  color: Colors.black.withOpacity(0.5))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyles.generalWhiteTextStyle3(
                fontSize: 13.sp,
                color: const Color(0xff444E72),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 12.sp,
              color: const Color(0xff444E72),
            ),
          ],
        ),
      ),
    );
  }
}
