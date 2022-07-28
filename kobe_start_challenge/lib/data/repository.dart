import 'package:dio/dio.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';

abstract class Repository {
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://rickandmortyapi.com/api',
    ),
  );

  static Future<PaginatedCharacter> getCharacter(int page) async {
    final response = await _dio.get('/character/?page=$page');
    print(response.data);
    final data = PaginatedCharacter.fromJson(response.data);

    return data;
  }
}
