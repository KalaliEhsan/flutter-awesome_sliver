import 'package:awesome_sliver/constants/app_colors.dart';
import 'package:awesome_sliver/constants/assets_path.dart';
import 'package:awesome_sliver/models/book_model.dart';
import 'package:flutter/cupertino.dart';

class BookItem extends StatelessWidget {
  BookModel _bookModel;

  BookItem(this._bookModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 170.0, //130.0
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(color: AppColors.shadow, blurRadius: 10.0)
                ],
                borderRadius: BorderRadius.all(Radius.circular(15.0)),
                image: DecorationImage(
                    // image: NetworkImage(_bookModel.image!),
                      image: AssetImage(AssetsPath.nature),
                    fit: BoxFit.cover)),
            margin: EdgeInsets.all(5.0)),
        Text(_bookModel.title!)
      ],
    );
  }
}
