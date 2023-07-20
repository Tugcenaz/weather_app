import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget weatherIconWidget({required String imageUrl,required double width,required double height}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,width: width.w,height: height.h,fit: BoxFit.fill,
    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
