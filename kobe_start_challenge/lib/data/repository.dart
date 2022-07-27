import 'package:dio/dio.dart';
import 'package:kobe_start_challenge/models/detailed_character.dart';
import 'package:kobe_start_challenge/models/detailed_episode.dart';
import 'package:kobe_start_challenge/models/detailed_location.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(
        baseUrl: 'https://rickandmortyapi.com/api',
       ),
       );

  static Future<PaginatedCharacter> getPage() async {
    final response = await _dio.get('/character/?page');

    final data = PaginatedCharacter.fromJson(response.data);

    return data;
  }

  static Future<DetailedCharacter> getCharacters(int characterId) async {
    final response = await _dio.get('/character/$characterId');

    final data = DetailedCharacter.fromJson(response.data);

    return data;
  }

  static Future<DetailedLocation> getLocation(int locationId) async {
    final response = await _dio.get('/location/$locationId');

    final data = DetailedLocation.fromJson(response.data);

    return data;
  }

  static Future<DetailedEpisode> getEpisode(int episodeId) async {
    final response = await _dio.get('/episode/$episodeId');

    final data = DetailedEpisode.fromJson(response.data);

    return data;
  }
}