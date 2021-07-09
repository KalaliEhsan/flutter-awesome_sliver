import 'package:awesome_sliver/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            boxShadow: [
              // BoxShadow(color: AppColors.shadow, blurRadius: 10),
              BoxShadow(
                offset: const Offset(1.0, 5.0),
                color: AppColors.shadow,
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
            borderRadius: BorderRadius.circular(8.0),
            border:
            Border.all(color: Colors.grey.withOpacity(0.5), width: 0.5),
            color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                print("your menu action here");
              },
            ),
          ],
        ),
      ),
    );
  }
}
