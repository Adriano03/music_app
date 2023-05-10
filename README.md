# music_app

Projeto Flutter - music_app

Projeto desenvolvido pelo canal Flutter Dicas, o app é um player de música.

## Getting Started

Aula 1

- Adicionar assets no projeto, como fontes, imagens e músicas e registrar no pubspec;
- Instalação de dependências;
- Criação e configurações do MusicAppColors com as cores do app;
- Criação e configurações do MusicAppTextStyle com estilos de texto do app;


Aula 2

- Construir initial binding para ApiService, AudioPlayerServiceImpl e MusicPlayerController;
- Criar a tela GenreListScreen com GenreListController onde vai ser listando a lista de gêneros;
- Criar a tela GenreDetailsScreen com GenreListController, essa tela é aberta quando clica em qualquer música;
- Criar MusicAppMaterial com getTitle, getPages, e getTheme, que são respectivamente o título da aplicação, o sistema de rotas passando os bindings e a configuração do tema da aplicação;
- Criação do MusicApp que retorna GetMaterialApp com as configurações do app;
- Criar o .env service e configurar;
- Trocar o MaterialApp do main.dart pelo MusicApp;


Aula 3

- Criar GenreModel contendo img, title e searchString e o método fromJson;
- Criar MusicModel contendo img, title, url e duration e o método fromJson;
- Criar GenreDetailsModel contendo a extensão de GenreModel e mais a lista de musicas;
- Criar a API Service para recuperar os gêneros, detalhes da música e músicas por gênero;
- Implementação do Audio Player Service;
- Implementação da tela genreListScreen com widgets personalizados;



