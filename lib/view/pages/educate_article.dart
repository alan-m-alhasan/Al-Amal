// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alamal/controller/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';

class EducateArticle extends StatefulWidget {
  final String title;
  final String article;

  const EducateArticle({
    Key? key,
    required this.title,
    required this.article,
  }) : super(key: key);

  @override
  State<EducateArticle> createState() => _EducateArticleState();
}

class _EducateArticleState extends State<EducateArticle> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  bool isLoading = true;
  // bool isEmpty = false;
  // bool isLongPressed = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: state.color,
            elevation: 0.0,
            leading: Directionality(
              textDirection: CacheHelper.getData(key: 'languageCode') == 'ar'
                  ? TextDirection.ltr
                  : TextDirection.rtl,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Colors.white,
                iconSize: 22.0,
                icon: CacheHelper.getData(key: 'languageCode') == 'ar'
                    ? const Icon(
                        Icons.arrow_forward_ios_rounded,
                      )
                    : const Icon(
                        Icons.arrow_back_ios_new_rounded,
                      ),
              ),
            ),
            toolbarHeight: 75.0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            titleSpacing: 0.0,
            leadingWidth: 65.0,
            title: Text(
              widget.title,
              overflow: TextOverflow.visible,
              softWrap: true,
              maxLines: 2,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ),
          body: isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: state.color,
                  ),
                )
              : NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return true;
                  },
                  child: ListView(
                    clipBehavior: Clip.none,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          widget.article,
                          style: TextStyle(
                            fontSize:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? 18.0
                                    : 20.0,
                            fontFamily:
                                CacheHelper.getData(key: 'languageCode') == 'en'
                                    ? poppinsMedium
                                    : tajawalMedium,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      );
    });
  }
}
