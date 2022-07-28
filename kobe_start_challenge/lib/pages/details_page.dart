// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kobe_start_challenge/components/app_bar_component.dart';
import 'package:kobe_start_challenge/theme/app_colors.dart';
import 'package:kobe_start_challenge/pages/home_page.dart';

class DetailsPage extends StatelessWidget {
  static const routeId = '/details';

  final int characterId;

  const DetailsPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(
        context,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Container(),
    );
  }
}
