import 'package:flutter/material.dart';
import 'package:kobe_start_challenge/components/app_bar_component.dart';
import 'package:kobe_start_challenge/components/character_card_component.dart';
import 'package:kobe_start_challenge/controller/home_controller.dart';
import 'package:kobe_start_challenge/models/paginated_character.dart';
import 'package:kobe_start_challenge/pages/details_page.dart';
import 'package:kobe_start_challenge/theme/app_colors.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  static const routeId = '/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = HomeController();
  final refreshController = RefreshController(initialRefresh: false);
  String initialUrl = 'https://rickandmortyapi.com/api/character';
  late PaginatedCharacter responsePage;
  List<Character> contentPage = [];

  @override
  void initState() {
    initialLoading();
    super.initState();
  }

  Future<void> initialLoading() async {
    responsePage = await homeController.paginatedCharacter(initialUrl);
    contentPage.addAll(responsePage.results);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarComponent(context),
        backgroundColor: AppColors.backgroundColor,
        body: FutureBuilder(
            future: homeController.paginatedCharacter(initialUrl),
            builder: (_, AsyncSnapshot<PaginatedCharacter> snapshot) {
              if (snapshot.hasData) {
                responsePage = snapshot.data!;

                return SmartRefresher(
                  footer: const ClassicFooter(),
                  header: const MaterialClassicHeader(color: Colors.black),
                  enablePullUp: true,
                  enablePullDown: true,
                  controller: refreshController,
                  onRefresh: () => onRefresh(),
                  onLoading: () => onLoading(),
                  child: ListView.separated(
                    itemBuilder: (_, index) {
                      final character = contentPage[index];

                      return CharacterCard(
                        character: character,
                        onTap: () => Navigator.of(context).pushNamed(
                          DetailsPage.routeId,
                          arguments: character.id,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: contentPage.length,
                  ),
                );
              } else if (snapshot.hasError) {
                const Center(
                  child: Text('Ocorreu um error'),
                );
              }
              return const CircularProgressIndicator();
            }));
  }

  void onLoading() async {
    if (mounted) {
      initialUrl = responsePage.info.next;
      final result =
          await homeController.paginatedCharacter(responsePage.info.next);
      setState(() {
        contentPage.addAll(result.results);
      });
    }
    refreshController.loadComplete();
  }

  void onRefresh() async {
    initialUrl = responsePage.info.next;
    final result =
        await homeController.paginatedCharacter(responsePage.info.next);
    setState(() {
      contentPage.addAll(result.results);
      refreshController.refreshCompleted();
    });
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }
}
