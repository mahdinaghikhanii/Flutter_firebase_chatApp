import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/common/entities/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildListItem(UserData userData) {
  return SizedBox(
    child: InkWell(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 0.w ,left: 0.w , right: 15.w),
            height: 54.w,
            width: 54.w,
            child: CachedNetworkImage(imageUrl: "${userData.photoUrl}"),
          ),
          Container(
            width: 250.w,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 1, color: Colors.grey.shade700)
              )
            ),
            padding: EdgeInsets.only(top: 15.w , left: 0.w , right: 0.w ,bottom: 0.w),
            child: Row(
              children: [
                SizedBox(width: 200.w,
                height: 42.w, 
                child: Text(userData.name ?? '' ,style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black , fontSize: 16.sp
                ),),)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
