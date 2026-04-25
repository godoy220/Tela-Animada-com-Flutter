# Galeria de Animações - Flutter

**Instituição:** Faculdade Senac Joinville | 5ª Fase ADS
**Unidade Curricular:** Desenvolvimento para Dispositivos Móveis 
**Atividade:** Prática Aula 9 - Tela Animada 

---

## Objetivo
Aplicar os conceitos de animações implícitas, explícitas e componentes customizados do Flutter utilizando Material Design 3.

## Sobre o Projeto
O projeto consiste em um aplicativo de **Galeria de Produtos** que utiliza diferentes técnicas de animação para garantir uma fluidez natural e excelente experiência do usuário. 

### Requisitos Atendidos

1. **Animação Implícita:** Utilização de `AnimatedContainer` na `GaleriaScreen` para simular uma elevação suave (sombra e margem) quando o usuário pressiona o card do produto. Duração de 200ms com curva `easeInOut`.
2. **Animação Explícita:** Utilização de `AnimationController`, `Tween` e `AnimatedBuilder` na `DetalhesScreen` para executar transições de `FadeTransition` e `SlideTransition` do conteúdo informativo assim que a tela é aberta. `dispose()` devidamente invocado no encerramento.
3. **Hero Animation:** Transição contínua da imagem do produto entre a galeria (origem) e a tela de detalhes (destino) usando tags baseadas no ID único do produto (`img_1`, `img_2`, etc).
4. **Material Design 3:** App configurado com `useMaterial3: true` e `ColorScheme.fromSeed()` no `main.dart`. Utilização do `FilledButton` para a ação principal.
5. **Widget Customizado Reutilizável:** Criação do componente `CustomBadge` que utiliza construtor `const` e parâmetros. Foi aplicado tanto na galeria (para o preço) quanto nos detalhes (para exibir tag de novidade).

### Requisito Bônus Atendido
* **CustomPainter:** Implementação da classe `CirculoDecorativoPainter` para pintar uma forma geométrica (círculo estilizado) diretamente via Canvas na `DetalhesScreen`, integrando-se nativamente ao fundo da tela.

## Como Executar

1. Clone este repositório.
2. Certifique-se de estar com o ambiente Flutter configurado.
3. Baixe as dependências através do comando:
   ```bash
   flutter pub get
