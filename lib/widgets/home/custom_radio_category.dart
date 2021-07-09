import 'package:awesome_sliver/models/radio_model.dart';
import 'package:awesome_sliver/widgets/home/category_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioCategory extends StatefulWidget {
  List<RadioModel> list = [];
  Axis axis;

  CustomRadioCategory(
    this.list, {
    this.axis: Axis.horizontal,
  });

  @override
  createState() {
    return CustomRadioCategoryState(list);
  }
}

class CustomRadioCategoryState extends State<CustomRadioCategory> {
  List<RadioModel> sampleData = [];

  CustomRadioCategoryState(this.sampleData);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: widget.axis,
      itemCount: sampleData.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              sampleData.forEach((element) => element.isSelected = false);
              sampleData[index].isSelected = true;
            });
          },
          child: CategoryItem(sampleData[index]),
        );
      },
    );
  }
}
