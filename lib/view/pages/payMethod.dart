// ignore_for_file: file_names, deprecated_member_use, library_private_types_in_public_api

import 'package:alamal/controller/alamal_icons.dart';
import 'package:alamal/controller/custom_button.dart';
import 'package:alamal/controller/custom_snackbar.dart';
import 'package:alamal/localization/localization.dart';
import 'package:alamal/model/cacheHelper.dart';
import 'package:alamal/model/theme_bloc.dart';
import 'package:alamal/view/pages/payDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slidable_button/slidable_button.dart';
import 'package:alamal/controller/constant.dart';

enum PaymentMethod {
  credit,
  stc,
  apple,
  nothing,
}

class PayMethod extends StatefulWidget {
  const PayMethod({Key? key}) : super(key: key);

  @override
  _PayMethodState createState() => _PayMethodState();
}

class _PayMethodState extends State<PayMethod> {
  PaymentMethod paymentMethod = PaymentMethod.nothing;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
      return SafeArea(
          child: Scaffold(
        backgroundColor: Colors.white,
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
            "${DemoLocalization.of(context)!.getTranslatedValue('payMethod')}",
            overflow: TextOverflow.visible,
            softWrap: true,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "${DemoLocalization.of(context)!.getTranslatedValue('choosePayMethod')}",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontFamily:
                            CacheHelper.getData(key: 'languageCode') == 'en'
                                ? poppinsMedium
                                : tajawalMedium),
                  ),
                ),
                const SizedBox(
                  height: 26.0,
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: paymentMethod == PaymentMethod.credit
                            ? fullWidth(context)
                            : fullWidth(context) - 50.0,
                        alignment: Alignment.center,
                        child: CustomButton(
                          primaryColor: state.color,
                          height: 75.0,
                          radius: 20.0,
                          borderWidth: 1.5,
                          elevation: 0.0,
                          highlightElevation: 0.0,
                          bgColor: paymentMethod == PaymentMethod.credit
                              ? state.color
                              : Colors.white,
                          context: context,
                          onPressed: () {
                            setState(() {
                              paymentMethod = PaymentMethod.credit;
                            });
                          },
                          hasChild: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 10.0,
                                ),
                                child: SvgPicture.asset(
                                  visaPay,
                                  color: paymentMethod == PaymentMethod.credit
                                      ? Colors.white
                                      : state.color,
                                  width: 50.0,
                                ),
                              ),
                              Text(
                                "Credit/Debit Card",
                                style: TextStyle(
                                  color: paymentMethod == PaymentMethod.credit
                                      ? Colors.white
                                      : state.color,
                                  fontSize: 20.0,
                                  fontFamily:
                                      paymentMethod == PaymentMethod.credit
                                          ? poppinsBold
                                          : poppinsRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: paymentMethod == PaymentMethod.stc
                            ? fullWidth(context)
                            : fullWidth(context) - 50.0,
                        alignment: Alignment.center,
                        child: CustomButton(
                          primaryColor: state.color,
                          height: 75.0,
                          radius: 20.0,
                          borderWidth: 1.5,
                          elevation: 0.0,
                          highlightElevation: 0.0,
                          bgColor: paymentMethod == PaymentMethod.stc
                              ? state.color
                              : Colors.white,
                          context: context,
                          onPressed: () {
                            setState(() {
                              paymentMethod = PaymentMethod.stc;
                            });
                          },
                          hasChild: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                stcPay,
                                color: paymentMethod == PaymentMethod.stc
                                    ? Colors.white
                                    : state.color,
                                width: 65.0,
                              ),
                              Text(
                                "STC Pay",
                                style: TextStyle(
                                  color: paymentMethod == PaymentMethod.stc
                                      ? Colors.white
                                      : state.color,
                                  fontSize: 20.0,
                                  fontFamily: paymentMethod == PaymentMethod.stc
                                      ? poppinsBold
                                      : poppinsRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14.0,
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: paymentMethod == PaymentMethod.apple
                            ? fullWidth(context)
                            : fullWidth(context) - 50.0,
                        alignment: Alignment.center,
                        child: CustomButton(
                          primaryColor: state.color,
                          height: 75.0,
                          radius: 20.0,
                          borderWidth: 1.5,
                          elevation: 0.0,
                          highlightElevation: 0.0,
                          bgColor: paymentMethod == PaymentMethod.apple
                              ? state.color
                              : Colors.white,
                          context: context,
                          onPressed: () {
                            setState(() {
                              paymentMethod = PaymentMethod.apple;
                            });
                          },
                          hasChild: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 6.0,
                                ),
                                child: SvgPicture.asset(
                                  applePay,
                                  color: paymentMethod == PaymentMethod.apple
                                      ? Colors.white
                                      : state.color,
                                  width: 55.0,
                                ),
                              ),
                              Text(
                                "Apple Pay",
                                style: TextStyle(
                                  color: paymentMethod == PaymentMethod.apple
                                      ? Colors.white
                                      : state.color,
                                  fontSize: 20.0,
                                  fontFamily:
                                      paymentMethod == PaymentMethod.apple
                                          ? poppinsBold
                                          : poppinsRegular,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SlidableButton(
                  isRestart: true,
                  onChanged: (slide) {
                    if (paymentMethod != PaymentMethod.nothing) {
                      push(
                        context: context,
                        page: const PayDetails(),
                      );
                    } else {
                      CustomSnackBar(
                        context: context,
                        translateKey: 'toastChoosePayMeth',
                      );
                    }
                  },
                  borderRadius: BorderRadius.circular(20.0),
                  color: state.color.withOpacity(0.2),
                  buttonColor: state.color,
                  width: fullWidth(context) - 50.0,
                  height: 65.0,
                  buttonWidth: fullWidth(context) * 0.5,
                  label: Container(
                    alignment: Alignment.center,
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${DemoLocalization.of(context)!.getTranslatedValue('pay')}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily:
                                    CacheHelper.getData(key: 'languageCode') ==
                                            'en'
                                        ? poppinsMedium
                                        : tajawalMedium),
                          ),
                          const SizedBox(
                            width: 14.0,
                          ),
                          const Icon(
                            AmalIcons.send2,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "10\$",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: state.color,
                          fontFamily: poppinsMedium,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ));
    });
  }
}
