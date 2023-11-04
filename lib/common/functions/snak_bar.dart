// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:services_app/common/constants/colors.dart';
import 'package:services_app/common/constants/fonts.dart';


snackBar(
  BuildContext context, {
  required String message,
}) =>
    Flushbar(
      icon: const Icon(Icons.info_outline, color: Colors.white),
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      borderRadius: BorderRadius.circular(8),
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: AppColors.mainColor,
      isDismissible: false,
      duration: const Duration(seconds: 5),
      messageText: Text(message,
          style: Fonts.defaultFont.copyWith(
            color: Colors.white,
          )),
    ).show(context);
