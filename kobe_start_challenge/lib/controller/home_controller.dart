import 'package:kobe_start_challenge/data/repository.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';

class HomeController {
  Future<PaginatedCharacter> paginatedCharacter(String url) async {
    try {
      return await Repository.getPage(url);
    } catch (erro) {
      throw erro.toString();
    }
  }
}
