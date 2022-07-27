import 'package:flutter/material.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/theme/app_colors.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primaryColorLight,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 7.5,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              'https://rickandmortyapi.com/api/character/avatar/${character.id}.jpeg',
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              child: Text(
                // ignore: unnecessary_string_interpolations
                '${character.name.toUpperCase()}',
                style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 14.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
