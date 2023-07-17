import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/page_background_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 70.0.sp, horizontal: 30.sp),
      child: Container(
        decoration: BoxDecoration(
            //  color: Colors.white,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.sp),
                bottomLeft: Radius.circular(30.sp))),
        child: TextFormField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.sp),
                  borderSide: BorderSide.none)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageBackGroundWidget(),
          _buildBody(),
        ],
      ),
    );
  }
}
