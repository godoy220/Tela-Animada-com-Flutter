Galeria de Animações — Flutter

Instituição: Faculdade Senac Joinville
Curso: Análise e Desenvolvimento de Sistemas — 5ª Fase
Unidade Curricular: Desenvolvimento para Dispositivos Móveis
Atividade: Prática Aula 9 — Tela Animada
Equipe: Gabriel G. Motta e João V. Prestes Garcia

Aplicativo desenvolvido em Flutter utilizando Material Design 3, com foco na implementação de animações implícitas e explícitas, navegação com Hero Animation, componentes reutilizáveis e elementos gráficos personalizados com CustomPainter.

O projeto apresenta uma galeria interativa de veículos da marca Volvo, com transições suaves entre telas e interface responsiva inspirada no design escandinavo, utilizando a paleta de cores da Suécia.

Recursos Implementados
AnimatedContainer aplicado no botão de favorito (animação implícita)
AnimationController com Tween e CurvedAnimation (animação explícita)
AnimatedBuilder para controle eficiente da renderização
Hero Animation entre tela de galeria e tela de detalhes
Material Design 3 ativado com useMaterial3: true
Widget reutilizável personalizado (EtiquetaEstilizada)
CustomPainter com elementos geométricos decorativos no fundo da tela
Layout responsivo utilizando ListView e GridView adaptativo
Identidade Visual

Paleta de cores baseada na bandeira da Suécia:

Azul: #006AA7
Amarelo: #FECC02

Interface inspirada em catálogos automotivos premium.

Funcionalidades

O aplicativo permite:

visualização de veículos em cards modernos
marcação de favoritos com animação
navegação entre telas com Hero Animation
apresentação de descrição com animação Fade e Slide
utilização de botões com Material Design 3
adaptação automática do layout conforme o tamanho da tela
Estrutura do Projeto
lib/
 ├── main.dart
 ├── models/
 │    └── veiculo.dart
 ├── screens/
 │    ├── galeria_screen.dart
 │    └── detalhes_screen.dart
 └── Widgets/
      ├── etiqueta_estilizada.dart
      └── forma_geometrica_painter.dart
Execução do Projeto

No terminal, dentro da pasta do projeto:

flutter pub get
flutter run