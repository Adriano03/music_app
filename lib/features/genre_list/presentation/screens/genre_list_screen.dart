import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_app/features/genre_details/presentation/screens/genre_details_screen.dart';
import 'package:music_app/features/genre_list/presentation/controllers/genre_list_controller.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/features/music_app/presentation/widgets/mini_music_player_widget.dart';
import 'package:music_app/shared/widgets/img_and_title_row_widget.dart';
import 'package:music_app/shared/widgets/screen_widget.dart';

class GenreListScreen extends StatelessWidget {
  static const routeName = '/genre-list';

  const GenreListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final genreListController = Get.find<GenreListController>();
    final musicPlayerCtrl = Get.find<MusicPlayerController>();

    return Obx(
      () => ScreenWidget(
        isLoading: false,
        title: 'Lista de Gêneros',
        error: genreListController.getError,
        onTryAgain: () => genreListController.getGenreList(),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.separated(
                  itemCount: genreListController.genres.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    final genre = genreListController.genres[index];

                    return InkWell(
                      onTap: () => Get.toNamed(
                        '${GenreListScreen.routeName}${GenreDetailsScreen.routeName}',
                        arguments: genre,
                      ),
                      child: ImgAndTitleRowWidget(
                        title: genre.title,
                        heroTag: genre.title,
                        img: genre.img,
                      ),
                    );
                  },
                ),
              ),
            ),
            if (musicPlayerCtrl.getPlaylistPlaying.isNotEmpty) const MiniMusicPlayerWidget(),
          ],
        ),
      ),
    );
  }
}
