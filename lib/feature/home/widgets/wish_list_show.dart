import 'package:flutter/material.dart';

import '../../../core/db/hive/hive_service.dart';
import '../../../data/models/responses/Recommended.dart';
import '../../../widgets/recommended_widget.dart';

class ShowFood extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final List<Recommended> recList;
  const ShowFood({super.key,required this.recList , this.title,this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: RecommendedWidget(
          recList:recList,
          title:title?? "whish list",
          subtitle: subtitle??"you can buy",
        ),
      ),
    );
  }
}
