import 'package:alamal/controller/constant.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/model/colors_model.dart';
import 'package:alamal/model/language.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorsDialog extends StatefulWidget {
  const ColorsDialog({super.key});

  @override
  State<ColorsDialog> createState() => _ColorsDialogState();
}

class _ColorsDialogState extends State<ColorsDialog> {
  Language? language;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: colorsData.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (BuildContext context, int i) {
                      return CustomButton(
                        primaryColor: state.color,
                        context: context,
                        onPressed: () {
                          context
                              .read<ThemeBloc>()
                              .add(ChangeTheme(colorsData[i].color));
                          SystemChrome.setSystemUIOverlayStyle(
                            SystemUiOverlayStyle(
                              statusBarColor: Color(colorsData[i].color),
                            ),
                          );
                          pop(context: context);
                        },
                        height: 45.0,
                        width: double.infinity,
                        titleColor: Colors.black,
                        bgColor: Color(colorsData[i].color),
                        elevation: 0.0,
                        highlightElevation: 0.0,
                        radius: 4.0,
                        hasBorder: false,
                        hasChild: true,
                        child: Row(
                          children: [
                            if (state.color == Color(colorsData[i].color))
                              const Icon(
                                Icons.check,
                                color: Colors.white,
                              )
                            else
                              const Icon(
                                Icons.palette_outlined,
                                color: Colors.white,
                              ),
                            const SizedBox(
                              width: 20.0,
                            ),
                            Flexible(
                              child: Text(
                                colorsData[i].title,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontFamily: poppinsMedium,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  // for (int i = 0; i < colorsData.length; i++)
                  //   Column(
                  //     children: [
                  //       CustomButton(
                  //         primaryColor: Colors.green,
                  //         context: context,
                  //         onPressed: () {
                  //           context
                  //               .read<ThemeBloc>()
                  //               .add(ChangeTheme(colorsData[i].color));
                  //           pop(context: context);
                  //         },
                  //         height: 45.0,
                  //         width: double.infinity,
                  //         titleColor: Colors.black,
                  //         bgColor: Color(colorsData[i].color),
                  //         elevation: 0.0,
                  //         highlightElevation: 0.0,
                  //         radius: 4.0,
                  //         hasBorder: false,
                  //         hasChild: true,
                  //         child: Row(
                  //           children: [
                  //             const Icon(
                  //               Icons.palette_outlined,
                  //               color: Colors.white,
                  //             ),
                  //             const SizedBox(
                  //               width: 20.0,
                  //             ),
                  //             Text(
                  //               colorsData[i].title,
                  //               textAlign: TextAlign.center,
                  //               style: TextStyle(
                  //                 fontFamily: poppinsMedium,
                  //                 color: Colors.white,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       if (i < (colorsData.length - 1))
                  //         const Divider(
                  //           color: Colors.black45,
                  //           indent: 12.0,
                  //           endIndent: 12.0,
                  //           height: 14.0,
                  //         ),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
