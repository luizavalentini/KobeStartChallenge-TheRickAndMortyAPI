import 'package:kobe_start_challenge/data/repository.dart';
import 'package:kobe_start_challenge/models/complete_character.dart';
import 'package:kobe_start_challenge/models/detailed_episode.dart';

class Controller {
  Future<CompleteCharacter> loadingInfo(int characterId) async {
    final detailedCharacter = await Repository.getCharacter(characterId);
    final detailedEpisode =
        await Repository.getEpisode(detailedCharacter.episode.first);
    return CompleteCharacter(
        detailedCharacter: detailedCharacter, detailedEpisode: detailedEpisode);
  }
}
