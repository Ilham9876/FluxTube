import 'package:flutter/material.dart';

const Color kWhiteColor = Colors.white;
const Color kRedColor = Colors.red;
const kBlackColor = Colors.black;
const kBlueColor = Colors.lightBlue;
const Color kTransparentColor = Colors.transparent;
Color kDarkColor = Colors.black.withValues(alpha: 0.5);
Color? kGreyColor = Colors.grey[700];
Color? kGreyOpacityColor = Colors.grey.withValues(alpha: 0.2);
Color? kBlueOpacityColor = Colors.lightBlue.withValues(alpha: 0.2);

final LinearGradient shimmerGradient = LinearGradient(colors: [
  Colors.grey.shade500,
  Colors.grey.shade600,
  Colors.grey,
  Colors.grey.shade700,
]);
