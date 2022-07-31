import 'package:kobe_start_challenge/models/detailed_character.dart';
import 'package:kobe_start_challenge/models/detailed_episode.dart';

class CompleteCharacter {
  final DetailedCharacter detailedCharacter;
  final DetailedEpisode detailedEpisode;

  CompleteCharacter({
    required this.detailedCharacter,
    required this.detailedEpisode,
  });
}
