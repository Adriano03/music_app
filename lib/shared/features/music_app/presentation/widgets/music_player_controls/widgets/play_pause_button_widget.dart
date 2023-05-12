import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:music_app/core/app/music_app_colors.dart';
import 'package:music_app/shared/features/music_app/presentation/controllers/music_player_controller.dart';

enum PlayPauseButtonSize { small, normal }

class PlayPauseButtonWidget extends StatelessWidget {
  final String? musicUrl;
  final PlayPauseButtonSize? playPauseButtonSize;

  const PlayPauseButtonWidget({
    super.key,
    this.musicUrl,
    this.playPauseButtonSize = PlayPauseButtonSize.normal,
  });

  @override
  Widget build(BuildContext context) {
    final musicPlayerCtrl = Get.find<MusicPlayerController>();

    return Obx(
      () => IconButton(
        onPressed: () {
          if (musicUrl != null) {
            if (musicPlayerCtrl.isPlaying.value) {
              musicPlayerCtrl.pauseMusic();
            } else {
              musicPlayerCtrl.playMusic(musicUrl!);
            }
          }
        },
        iconSize: playPauseButtonSize == PlayPauseButtonSize.normal ? 70 : 50,
        icon: Icon(
          musicPlayerCtrl.isPlaying.value ? Icons.pause_circle : Icons.play_circle,
          color: MusicAppColors.secondaryColor,
        ),
        padding: const EdgeInsets.all(0),
      ),
    );
  }
}
