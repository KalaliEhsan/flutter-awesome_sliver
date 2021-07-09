import 'dart:convert';

import 'package:awesome_sliver/constants/app_colors.dart';
import 'package:awesome_sliver/constants/assets_path.dart';
import 'package:awesome_sliver/models/bottom_nav_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomBottomNav extends StatefulWidget {
  final Function(int) onPageChanged;
  CustomBottomNav({required this.onPageChanged});

  @override
  State<StatefulWidget> createState() => CustomBottomNavState();
}

class CustomBottomNavState extends State<CustomBottomNav> {
  List<BottomNavModel> bottomNavList = [];

  @override
  void initState() {
    initList();
    super.initState();
  }

  initList() async {
    String list = await rootBundle.loadString(AssetsPath.bottomNavList);
    setState(() {
      bottomNavList = bottomNavFromJson(list);
    });
  }

  List<BottomNavModel> bottomNavFromJson(String str) =>
      List<BottomNavModel>.from(
          json.decode(str).map((x) => BottomNavModel.fromJson(x)));

  // getItem(list) {
  //   list.asMap().forEach((key, value) => Flexible(
  //       flex: 1,
  //       child: IconButton(
  //         icon: Icon(
  //           Icons.search,
  //           color: value.isSelected! ? AppColors.accent : Colors.grey,
  //         ),
  //         onPressed: () {
  //           itemSelect(key);
  //         },
  //       )));
  // }

  itemSelect(var index) {
    setState(() {
      bottomNavList.forEach((element) => element.isSelected = false);
      bottomNavList[index].isSelected = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return bottomNavList.length > 0
        ? Container(
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
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.5), width: 0.5),
                  color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          color: bottomNavList[0].isSelected!
                              ? AppColors.accent
                              : Colors.grey,
                        ),
                        onPressed: () {
                          itemSelect(0);
                          widget.onPageChanged(0);
                        },
                      )),
                  Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.home_filled,
                          color: bottomNavList[1].isSelected!
                              ? AppColors.accent
                              : Colors.grey,
                        ),
                        onPressed: () {
                          itemSelect(1);
                          widget.onPageChanged(1);
                        },
                      )),
                  Flexible(
                      flex: 1,
                      child: IconButton(
                        icon: Icon(
                          Icons.video_library_sharp,
                          color: bottomNavList[2].isSelected!
                              ? AppColors.accent
                              : Colors.grey,
                        ),
                        onPressed: () {
                          itemSelect(2);
                          widget.onPageChanged(2);
                        },
                      )),
                ],
              ),
            ),
          )
        : Container();
  }
}
