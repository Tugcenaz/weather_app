import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget weatherIconWidget({required String imageUrl}) {
  return CachedNetworkImage(
    imageUrl: imageUrl,width: 200.w,height: 200.h,fit: BoxFit.fill,
    placeholder: (context, url) => Center(child: const CircularProgressIndicator()),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}
