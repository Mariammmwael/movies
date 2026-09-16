import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movies/core/app_colors.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(endIndent: 10, color: AppColors.primaryColor)),
        Text(
          "OR",
          style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
        ),
        Expanded(child: Divider(indent: 10, color: AppColors.primaryColor)),
      ],
    );
  }
}
