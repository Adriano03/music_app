import 'dart:developer';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:music_app/core/erros/exceptions.dart';

import './audio_player_service.dart';

class AudioPlayerServiceImpl extends GetxService implements AudioPlayerService {
  final AudioPlayer audioPlayer;

  AudioPlayerServiceImpl(this.audioPlayer);

  Future<void> callAudioPlayerServiceTryAndCatchFunciton(
      Future<void> Function() tryFunciton, String audioPlayerExceptionMessage) async {
    try {
      await tryFunciton();
    } catch (e, s) {
      final errorMessage = audioPlayerExceptionMessage;
      log(errorMessage, error: e, stackTrace: s);
      throw AudioPlayersException(message: errorMessage);
    }
  }

  @override
  Future<int> get getCurrentPosition async {
    try {
      final position = await audioPlayer.getCurrentPosition();

      return position?.inSeconds ?? 0;
    } catch (e, s) {
      const errorMessage = 'Erro ao pegar posição da música';
      log(errorMessage, error: e, stackTrace: s);
      throw AudioPlayersException(message: errorMessage);
    }
  }

  @override
  Stream<Duration> getPositionStream() {
    return audioPlayer.onPositionChanged;
  }

  @override
  Stream<void> onAudioComplete() {
    return audioPlayer.onPlayerComplete;
  }

  @override
  Future<void> pauseMusica() {
    return callAudioPlayerServiceTryAndCatchFunciton(
      () => audioPlayer.pause(),
      'Erro ao pausar a música',
    );
  }

  @override
  Future<void> playMusic(String audioAsset) {
    return callAudioPlayerServiceTryAndCatchFunciton(
      () => audioPlayer.play(AssetSource(audioAsset)),
      'Erro ao carregar a música',
    );
  }

  @override
  Future<void> resumeMusic() {
    return callAudioPlayerServiceTryAndCatchFunciton(
      () => audioPlayer.resume(),
      'Erro ao continuar a música',
    );
  }

  @override
  Future<void> seek(int seconds) {
    return callAudioPlayerServiceTryAndCatchFunciton(
      () {
        final seekTo = Duration(seconds: seconds);
        return audioPlayer.seek(seekTo);
      },
      'Erro ao trocar duração da música;',
    );
  }

  @override
  Future<void> stopMusic() {
    return callAudioPlayerServiceTryAndCatchFunciton(
      () => audioPlayer.stop(),
      'Erro ao parar a música',
    );
  }

  @override
  void onClose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.onClose();
  }
}
