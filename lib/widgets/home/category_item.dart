import 'package:awesome_sliver/constants/app_colors.dart';
import 'package:awesome_sliver/models/radio_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final RadioModel _item;

  CategoryItem(this._item);

  @override
  Widget build(BuildContext context) {
    print(_item);
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      height: 35.0,
      child: Center(
        child: Text(_item.buttonText!,
            style: TextStyle(
                fontSize: 14.0,
                color: _item.isSelected!
                    ? AppColors.txtWhite
                    : AppColors.txtBlack)),
      ),
      decoration: BoxDecoration(
        color: _item.isSelected! ? AppColors.accent : AppColors.hint1,
        // border: Border.all(
        //     width: 1.0,
        //     color: _item.isSelected!
        //         ? AppColors.txtWhite
        //         : AppColors.txtBlack),
        borderRadius: const BorderRadius.all(const Radius.circular(8.0)),
      ),
    );
  }
}
