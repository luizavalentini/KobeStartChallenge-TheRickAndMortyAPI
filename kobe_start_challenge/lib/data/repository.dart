import 'package:dio/dio.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/models/detailed_character.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
    ),
  );

  static Future<PaginatedCharacter> getPage(int page) async {
    final response = await _dio.get('/character/?page=$page');
    print(response.data);
    final data = PaginatedCharacter.fromJson(response.data);

    return data;
  }

  static Future<DetailedCharacter> getCharacter(int characterId) async {
    final response = await _dio.get('/character/?page=$characterId');
    print(response.data);
    final data = DetailedCharacter.fromJson(response.data);

    return data;
  }
}
