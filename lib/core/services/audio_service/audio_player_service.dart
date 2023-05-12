abstract class AudioPlayerService {
  // Referente a barra de progresso da música;
  Future<void> seek(int seconds);

  // A tela precisa ser reativa, ou seja quando a música estiver tocando é necessário atualizar os interessados;
  Stream<Duration> getPositionStream();

  // Quando pausar a música pega exatamente o momento da contagem da música;
  Future<int> get getCurrentPosition;

  // Quando clica no botão de play;
  Future<void> playMusic(String audioAsset);

  // Quando pausa a música;
  Future<void> pauseMusic();

  // Quando a música for pausada pode ser iniciada de onde parou;
  Future<void> resumeMusic();

  // Parar completamente a música;
  Future<void> stopMusic();

  // Quando a música chegar ao fim, é chamado a próxima música;
  Stream<void> onAudioComplete();
}
