import 'dart:convert';

import 'package:awesome_sliver/constants/app_colors.dart';
import 'package:awesome_sliver/constants/assets_path.dart';
import 'package:awesome_sliver/models/book_model.dart';
import 'package:awesome_sliver/models/radio_model.dart';
import 'package:awesome_sliver/widgets/home/book_item.dart';
import 'package:awesome_sliver/widgets/home/custom_radio_category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> {
  late ScrollController _scrollController;
  List<RadioModel> _categories = [];
  List<BookModel> _books = [];

  bool lastStatus = true;

  _scrollListener() {
    // print(_isShrink);
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    // print('_scrollController!.hasClients => ${_scrollController!.hasClients}');
    // print('_scrollController!.offset => ${_scrollController!.offset}');
    // print('330 - kToolbarHeight => ${330 - 180}');
    return _scrollController.hasClients &&
        // _scrollController!.offset > (330 - kToolbarHeight);
        _scrollController.offset >= (330 - 180);
  }

  init() async {
    String cats = await rootBundle.loadString(AssetsPath.categories);
    String book = await rootBundle.loadString(AssetsPath.books);
    setState(() {
      _categories = radioModelFromJson(cats);
      _books = bookModelFromJson(book);
    });
    print('categories => $_categories');
  }

  List<RadioModel> radioModelFromJson(String str) => List<RadioModel>.from(
      json.decode(str).map((x) => RadioModel.fromJson(x)));

  List<BookModel> bookModelFromJson(String str) =>
      List<BookModel>.from(json.decode(str).map((x) => BookModel.fromJson(x)));

  // @override
  void initState() {
    init();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Awesome Sliver'),),
      body: _categories.length > 0
          ? Stack(children: [
              Column(
                children: [
                  Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.green,
                  )
                ],
              ),
              NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return _headerSliver(
                        context, innerBoxIsScrolled, _categories, _isShrink);
                  },
                  body: Builder(builder: (BuildContext context) {
                    return _bodySliver(context, _books);
                  }))
            ])
          : Container(),
    );
  }
}

List<Widget> _headerSliver(BuildContext context, bool innerBoxIsScrolled,
    List<RadioModel> categories, bool isShrink) {
  return <Widget>[
    SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      sliver: SliverAppBar(
        pinned: true,
        backgroundColor: isShrink ? Colors.white : Colors.transparent,
        collapsedHeight: 180.0,
        shadowColor: Colors.white,
        expandedHeight: 300.0,
        forceElevated: innerBoxIsScrolled,
        flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    stops: [
              0.1,
              0.4,
              0.6,
              0.9
            ],
                    colors: [
              Colors.white,
              Colors.white.withOpacity(.3),
              Colors.white.withOpacity(.1),
              Colors.transparent
            ]))),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0.0),
          child: Transform.translate(
            offset: Offset(0, .2),
            child: Container(
              width: double.infinity,
              color: AppColors.bg,
              child: Column(
                children: [
                  Row(children: [
                    Expanded(
                        child: Text(
                      'test',
                      style: TextStyle(fontSize: 18.0),
                    ))
                  ]),
                  Row(children: [Expanded(child: Text('test'))]),
                  Container(
                      width: double.infinity,
                      height: 50.0,
                      child: CustomRadioCategory(categories))
                ],
              ),
            ),
          ),
        ),
      ),
    )
  ];
}

Widget _bodySliver(BuildContext context, List<BookModel> books) => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [
          0.1,
          0.7,
          0.4,
          0.1
        ],
            colors: [
          AppColors.bg,
          AppColors.bg,
          AppColors.bg.withOpacity(0),
          Colors.transparent
        ])),
    child: CustomScrollView(
      // The "controller" and "primary" members should be left
      // unset, so that the NestedScrollView can control this
      // inner scroll view.
      // If the "controller" property is set, then this scroll
      // view will not be associated with the NestedScrollView.
      slivers: <Widget>[
        SliverOverlapInjector(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, childAspectRatio: .6),
          delegate: SliverChildListDelegate(
              books.map((book) => BookItem(book)).toList()),
        ),
      ],
    ));
