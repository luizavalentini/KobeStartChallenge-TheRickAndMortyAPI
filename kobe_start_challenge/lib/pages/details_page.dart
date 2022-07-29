import 'package:flutter/material.dart';
import 'package:kobe_start_challenge/components/app_bar_component.dart';
import 'package:kobe_start_challenge/data/repository.dart';
import 'package:kobe_start_challenge/models/detailed_character.dart';
import 'package:kobe_start_challenge/theme/app_colors.dart';
import 'package:kobe_start_challenge/pages/home_page.dart';

class DetailsPage extends StatefulWidget {
  static const routeId = '/details';

  final int characterId;

  const DetailsPage({
    Key? key,
    required this.characterId,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<DetailedCharacter>? characters;

  @override
  void initState() {
    characters = Repository.getCharacter(widget.characterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarComponent(context, isSecondPage: true),
      backgroundColor: AppColors.backgroundColor,
      body: FutureBuilder<DetailedCharacter>(
        future: characters,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return DetailedCharacterCard(
              detailedCharacter: data,
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Ocorreu um erro',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5,
                    color: AppColors.white),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class DetailedCharacterCard extends StatelessWidget {
  const DetailedCharacterCard({
    Key? key,
    required this.detailedCharacter,
  }) : super(key: key);

  final DetailedCharacter detailedCharacter;

  @override
  Widget build(BuildContext context) {
    final name = detailedCharacter.name;
    final status = detailedCharacter.status;
    final specie = detailedCharacter.status;
    final location = detailedCharacter.location;
    final last_seen = detailedCharacter.episode;

    return ListView(children: [
      Card(
        color: AppColors.primaryColorLight,
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 7.5),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                fit: BoxFit.fitWidth,
                height: 240,
                width: 340,
                'https://rickandmortyapi.com/api/character/avatar/${detailedCharacter.id}.jpeg'),
            Padding(
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                right: 15,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 14.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    '${status} - ${specie}',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Last seen Location:',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${location}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'First seen in:',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12.5,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${last_seen}',
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
