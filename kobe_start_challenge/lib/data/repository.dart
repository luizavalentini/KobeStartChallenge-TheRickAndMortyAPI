import 'package:dio/dio.dart';
import 'package:kobe_start_challenge/models/detailed_episode.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/models/detailed_character.dart';

abstract class Repository {
  static final _dio = Dio(
      );
  static Future<PaginatedCharacter> getPage(String url) async {
    try { final response =
        await _dio.get(url);
    print(response.data);
    final data = PaginatedCharacter.fromJson(response.data);

    return data;} catch (_) {
      throw Exception;
    }
  }

  static Future<DetailedCharacter> getCharacter(int characterId) async {
     try { final response = await _dio
        .get('https://rickandmortyapi.com/api/character/$characterId');
    print(response.data);
    final data = DetailedCharacter.fromJson(response.data);

    return data;} catch (_) {
      throw Exception;
    }
  }
  static Future<DetailedEpisode> getEpisode(String url) async {
     try {final response = await _dio.get(url);
    print(response.data);
    final data = DetailedEpisode.fromJson(response.data);

    return data;} catch (_) {
      throw Exception;
    }
  }
}
