# music_app

Projeto Flutter - music_app

Projeto desenvolvido pelo canal Flutter Dicas, o app é um player de música que consume o banco de dados local JsonServer.
O app contém a tela inicial com a lista de gêneros onde se separam em várias músicas de cada gênero. Clicando no gênero abre a tela detalhes do gênero contendo as músicas. Clicando em alguma música vai abrir a modal da música que contém a imagem, nome, duração e os botões para controlar a música. Com a música em andamento o usuário pode interagir com o aplicativo sem que a música seja pausada ou finalizada sem que a intenção seja do usuário, voltando uma tela o player da música é exibido na parte debaixo da tela, onde o usuário pode pausar a música. 

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
- Criar GenreDetailsModel contendo a extensão de GenreModel e mais a lista de músicas;
- Criar a API Service para recuperar os gêneros, detalhes da música e músicas por gênero;
- Implementação do Audio Player Service;
- Implementação da tela genreListScreen com widgets personalizados;

Aula 4

- Implementação do MusicPlayerController;
- Implementação do widget Mini Music Player; 
- Implementação da tela de detalhes do gênero onde é exibido a lista de músicas: GenreDetailsScreen;
- Criação da modal para abrir os detalhes da música quando clicado onde pode passar, voltar, pausar e iniciar a música, além de poder arrastar o Slider para qualquer posição da música;
