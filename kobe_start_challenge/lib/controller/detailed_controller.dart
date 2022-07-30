import 'package:kobe_start_challenge/data/repository.dart';
import 'package:kobe_start_challenge/models/complete_character.dart';
import 'package:kobe_start_challenge/models/detailed_episode.dart';

class DetailedController {
  Future<CompleteCharacter> loadingInfo(int characterId) async {
    try {
      final detailedCharacter = await Repository.getCharacter(characterId);
      final detailedEpisode =
          await Repository.getEpisode(detailedCharacter.episode.first);
      return CompleteCharacter(
          detailedCharacter: detailedCharacter,
          detailedEpisode: detailedEpisode);
    } catch (erro) {
      throw erro.toString();
    }
  }
}
