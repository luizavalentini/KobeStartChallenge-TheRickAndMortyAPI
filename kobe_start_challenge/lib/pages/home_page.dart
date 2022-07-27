import 'package:flutter/material.dart';
import 'package:kobe_start_challenge/components/app_bar_component.dart';
import 'package:kobe_start_challenge/data/repository.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<PaginatedCharacter>? character;

  @override
  void initState() {
    character = Repository.getPage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(context),
        backgroundColor: AppColors.backgroundColor,
        body: FutureBuilder(builder: (_, snapshot) {
          return Container();
        }));
  }
}
