import 'package:flutter/material.dart';
import 'package:restaurant_app/values/theme/app_border_radius.dart';
import 'package:restaurant_app/values/theme/app_colors.dart';

Widget quantityCountContainer(
  BuildContext context, {
  required int quantity,
  required VoidCallback onIncreement,
  required VoidCallback onDcrement,
  required int productCout,
  Axis direction = .vertical,
}) {
  List<Widget> widgetList = [
    GestureDetector(
      onTap:onIncreement,
      child: const Icon(Icons.add, size: 20),
    ),
    const SizedBox(height: 8),
    Text(
      quantity.toString(),
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
    const SizedBox(height: 8),
    GestureDetector(
      onTap: onDcrement,
      child: Icon(
        quantity <= 1 ? Icons.delete : Icons.remove,
        color: quantity <= 1 ? Colors.red : Colors.black,
        size: 20,
      ),
    ),
  ];

  return Container(
    // height: (direction== Axis.horizontal)?45:null,
    width: (direction == Axis.vertical) ? 45 : 90,
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
    decoration: BoxDecoration(
      color: AppColors.fededWhite,
      borderRadius: AppBorderRadius.m,
    ),
    child: (direction == Axis.vertical)
        ? Column(mainAxisSize: MainAxisSize.min, children: widgetList)
        : Row(
            mainAxisSize: .max,
            mainAxisAlignment: .spaceAround,
            children: widgetList.reversed.toList(),
          ),
  );
}
