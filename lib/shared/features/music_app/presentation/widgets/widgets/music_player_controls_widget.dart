import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';
import 'package:music_app/shared/features/music_app/presentation/widgets/widgets/music_player_controls/widgets/play_pause_button_widget.dart';

class MusicPlayerControlsWidget extends StatelessWidget {
  final String musicPath;

  const MusicPlayerControlsWidget({
    Key? key,
    required this.musicPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final musicPlayerController = Get.find<MusicPlayerController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => musicPlayerController.backTrack(),
          iconSize: 70,
          icon: Icon(
            Icons.skip_previous,
            color: MusicAppColors.secondaryColor,
          ),
            padding: const EdgeInsets.all(0),
        ),
        const SizedBox(width: 30),
        PlayPauseButtonWidget(musicUrl: musicPath),
        const SizedBox(width: 30),
        IconButton(
          onPressed: () => musicPlayerController.skipTrack(),
          iconSize: 70,
          icon: Icon(
            Icons.skip_next,
            color: MusicAppColors.secondaryColor,
          ),
            padding: const EdgeInsets.all(0),
        ),
      ],
    );
  }
}
