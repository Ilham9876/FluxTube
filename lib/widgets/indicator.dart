import 'package:flutter/material.dart';

Widget cIndicator(BuildContext context) {
  return Center(
    child: CircularProgressIndicator(
      color: Theme.of(context).colorScheme.primary,
      strokeWidth: 2.5,
    ),
  );
}
