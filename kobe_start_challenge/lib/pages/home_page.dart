import 'package:flutter/material.dart';
import 'package:kobe_start_challenge/components/app_bar_component.dart';
import 'package:kobe_start_challenge/components/character_card_component.dart';
import 'package:kobe_start_challenge/controller/home_controller.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/pages/details_page.dart';
import 'package:kobe_start_challenge/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    homeController.paginatedCharacter(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder(
          future: homeController.paginatedCharacter(0),
          builder: (_, AsyncSnapshot<PaginatedCharacter> snapshot) {
            if (snapshot.hasData) {
              final dataResults = snapshot.data!.results;

              return ListView.separated(
                itemBuilder: (_, index) {
                  final character = dataResults[index];

                  return CharacterCard(
                    character: character,
                    onTap: () => Navigator.of(context).pushNamed(
                      DetailsPage.routeId,
                      arguments: character.id,
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: dataResults.length,
              );
            } else if (snapshot.hasError) {
              const Center(
                child: Text('Ocorreu um error'),
              );
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
