import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../widgets/etiqueta_estilizada.dart';
import '../widgets/forma_geometrica_painter.dart';

class DetalhesScreen extends StatefulWidget {
  final Veiculo veiculo;

  const DetalhesScreen({super.key, required this.veiculo});

  @override
  State<DetalhesScreen> createState() => _DetalhesScreenState();
}

// Requisito 2: SingleTickerProviderStateMixin para a Animação Explícita
class _DetalhesScreenState extends State<DetalhesScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    // Configurando o AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    // Configurando as animações com CurvedAnimation
    final curve = CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart);

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(curve);
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.2), end: Offset.zero).animate(curve);

    // Iniciando a animação assim que a tela abre
    _controller.forward();
  }

  @override
  void dispose() {
    // Requisito 2: SEMPRE chamar dispose() do AnimationController
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        // Aplicando o CustomPainter de fundo
        painter: FormaGeometricaPainter(corBase: Theme.of(context).colorScheme.primary),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 300,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.veiculo.nome, style: const TextStyle(shadows: [Shadow(color: Colors.black54, blurRadius: 4)])),
                background: Hero(
                  // Requisito 3: Hero Animation (Destino)
                  tag: 'veiculo_img_${widget.veiculo.id}',
                  child: Image.network(
                    widget.veiculo.imagemUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                // Requisito 2: AnimatedBuilder para reconstrução eficiente
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: SlideTransition(
                        position: _slideAnimation,
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          EtiquetaEstilizada(
                            texto: widget.veiculo.marca,
                            corFundo: Theme.of(context).colorScheme.primary,
                            icone: Icons.directions_car,
                          ),
                          const Icon(Icons.share, color: Colors.grey),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Visão Geral',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        widget.veiculo.descricao,
                        style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                      ),
                      const SizedBox(height: 40),
                      // Requisito 4: Componente Material Design 3 (FilledButton)
                      SizedBox(
                        width: double.infinity,
                        height: 56,
                        child: FilledButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.calendar_month),
                          label: const Text('Agendar Test Drive', style: TextStyle(fontSize: 18)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}