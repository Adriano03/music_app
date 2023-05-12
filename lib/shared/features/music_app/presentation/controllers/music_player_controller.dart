import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:music_app/core/errors/exceptions.dart';
import 'package:music_app/core/mixins/snack_bar_mixin.dart';
import 'package:music_app/core/services/audio_service/audio_player_service.dart';
import 'package:music_app/shared/models/music_model.dart';

class MusicPlayerController with SnackBarMixin {
  final AudioPlayerService _audioPlayer;

  MusicPlayerController(AudioPlayerService audioPlayer) : _audioPlayer = audioPlayer {
    // Ouve quando a música acabar para então pular p/ a próxima música;
    _audioCompleteStreamSubscription = _audioPlayer.onAudioComplete().listen((event) {
      skipTrack();
    });
  }

  StreamSubscription? _audioCompleteStreamSubscription;

  // Música está tocando ou não;
  final RxBool isPlaying = false.obs;

  // Controla duração atual da música;
  final RxInt currentMusicDuration = 0.obs;

  // Índice da música atual;
  final RxnInt currentMusicIndexPlaying = RxnInt();

  // Getter para obter o índice atual;
  int? get getCurrentMusicIndexPlaying => currentMusicIndexPlaying.value;

  // Lista de músicas da playlist atual;
  final RxList<MusicModel> _playlistPlayin = <MusicModel>[].obs;

  // Getter para obter a lista de músicas atual;
  List<MusicModel> get getPlaylistPlaying => _playlistPlayin;

  // Lista de música selecionada;
  final List<MusicModel> selectedPlayList = [];

  // Stream para obter a posição atual da música;
  Stream<Duration> get getCurrentPositionStream => _audioPlayer.getPositionStream();

  // Função para buscar a posição especifica da música. (Quando arrasta a música para determinada duração);
  Future<void> seek(int seekToDuratuinInSeconds) => _audioPlayer.seek(seekToDuratuinInSeconds);

  // Função para carregar nova playlist;
  void loadPlaylist(List<MusicModel> newPlayist, List<MusicModel> playlistToChange) {
    playlistToChange
      ..clear()
      ..addAll(newPlayist);
  }

  Future<void> onCallMusicPlayerTryAndCatchFunction(
      Future<void> Function() tryFunction) async {
    try {
      await tryFunction();
    } on AudioPlayersException catch (error) {
      showErrorSnackBar(error.message);
    }
  }

  Future<void> playMusic(String url) async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = true;
      await _audioPlayer.playMusic(url);
    });
  }

  Future<void> stopMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;
      await _audioPlayer.stopMusic();
    });
  }

  Future<void> loadMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      // Carrega a lista (carrega nova lista de música quando usuário troca o gênero);
      loadPlaylist(selectedPlayList, _playlistPlayin);

      // Para música se tiver alguma tocando;
      await stopMusic();

      // Da o play na música;
      await playMusic(_playlistPlayin[getCurrentMusicIndexPlaying ?? 0].url);
    });
  }

  Future<void> pauseMusic() async {
    return onCallMusicPlayerTryAndCatchFunction(() async {
      isPlaying.value = false;

      await _audioPlayer.pauseMusic();
    });
  }

  // Próxima música;
  Future<void> skipTrack() async {
    if (getCurrentMusicIndexPlaying != null) {
      if (getCurrentMusicIndexPlaying! < _playlistPlayin.length - 1) {
        currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! + 1;
      } else {
        // Voltar para a primeira música se estiver na última;
        currentMusicIndexPlaying.value = 0;
      }
      await loadMusic();
    }
  }

  MusicModel? get getCurrentPlayingMusic {
    if (getCurrentMusicIndexPlaying != null) {
      return _playlistPlayin[getCurrentMusicIndexPlaying!];
    }
    return null;
  }

  // Voltar música;
  Future<void> backTrack() async {
    if (getCurrentMusicIndexPlaying != null && getCurrentMusicIndexPlaying! > 0) {
      currentMusicIndexPlaying.value = currentMusicIndexPlaying.value! - 1;
    } else {
      // Se estiver na primeira música, quando aperta o botão back, vai até a ultima música;
      currentMusicIndexPlaying.value = _playlistPlayin.length - 1;
    }
    await loadMusic();
  }

  void dispose() {
    _audioCompleteStreamSubscription?.cancel();
  }

  // Quando abrir o Player quando a música estiver pausada, deve mostrar onde ela pausou;
  Future<void> loadCurrentDuration() async {
    if (!isPlaying.value) {
      currentMusicDuration.value = await _audioPlayer.getCurrentPosition;
    }
  }

  Future<void> showMusicPlayer(BuildContext context) async {}

  // Função para tocar a música selecionada pelo usuário;
  void playSelectedMusic(BuildContext context, int musicIndex) {
    // Atualiza qual o index da música que será ouvida na playlist;
    currentMusicIndexPlaying.value = musicIndex;

    // Carregar e tocar a música;
    loadMusic();

    showMusicPlayer(context);
  }
}
