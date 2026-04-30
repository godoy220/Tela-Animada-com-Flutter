import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../Widgets/etiqueta_estilizada.dart';
import 'detalhes_screen.dart';

class GaleriaScreen extends StatefulWidget {
  const GaleriaScreen({super.key});

  @override
  State<GaleriaScreen> createState() => _GaleriaScreenState();
}

class _GaleriaScreenState extends State<GaleriaScreen> {
  static const Color azulSuecia = Color(0xFF006AA7);
  static const Color amareloSuecia = Color(0xFFFECC02);

  final List<Veiculo> veiculos = const [
    Veiculo(
      id: '1',
      nome: 'Volvo V40 T5 R-Design',
      marca: 'Volvo',
      imagemUrl:
          'https://images.unsplash.com/photo-1619767886558-efdc259cde1a?auto=format&fit=crop&w=900&q=80',
      descricao:
          'Hatch premium com visual esportivo, ótimo acabamento interno e desempenho forte para uso urbano e rodoviário.',
    ),
    Veiculo(
      id: '2',
      nome: 'Volvo XC60',
      marca: 'Volvo',
      imagemUrl:
          'https://images.unsplash.com/photo-1617814076367-b759c7d7e738?auto=format&fit=crop&w=900&q=80',
      descricao:
          'SUV premium da Volvo, conhecido pelo conforto, segurança avançada e design escandinavo sofisticado.',
    ),
    Veiculo(
      id: '3',
      nome: 'Volvo XC90',
      marca: 'Volvo',
      imagemUrl:
          'https://images.unsplash.com/photo-1606016159991-dfe4f2746ad5?auto=format&fit=crop&w=900&q=80',
      descricao:
          'SUV grande de luxo, espaçoso e tecnológico, com foco em segurança, elegância e conforto familiar.',
    ),
  ];

  final Map<String, bool> _favoritos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria Motors'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  azulSuecia,
                  Color(0xFF004F7C),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Galeria Premium Volvo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Explore veículos com animações suaves e design escandinavo moderno.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth < 600) {
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: veiculos.length,
                    itemBuilder: (context, index) {
                      return _buildCardVeiculo(veiculos[index]);
                    },
                  );
                } else {
                  int colunas = constraints.maxWidth >= 900 ? 3 : 2;

                  return GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: colunas,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.88,
                    ),
                    itemCount: veiculos.length,
                    itemBuilder: (context, index) {
                      return _buildCardVeiculo(veiculos[index]);
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCardVeiculo(Veiculo veiculo) {
    final isFavorito = _favoritos[veiculo.id] ?? false;

    return Card(
      margin: const EdgeInsets.only(bottom: 18),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(24),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetalhesScreen(veiculo: veiculo),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  height: 230,
                  width: double.infinity,
                  color: const Color(0xFFEAF2F7),
                  child: Hero(
                    tag: 'veiculo_img_${veiculo.id}',
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Image.network(
                        veiculo.imagemUrl,
                        fit: BoxFit.contain,
                        alignment: Alignment.center,
                        errorBuilder: (_, __, ___) => const Center(
                          child: Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                /// Badge Premium
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 7,
                    ),
                    decoration: BoxDecoration(
                      color: azulSuecia.withValues(alpha: 0.92),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Text(
                      'Premium',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),

                /// Botão favorito animado
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _favoritos[veiculo.id] = !isFavorito;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      padding: EdgeInsets.all(isFavorito ? 13 : 9),
                      decoration: BoxDecoration(
                        color: isFavorito
                            ? amareloSuecia
                            : Colors.white.withValues(alpha: 0.95),
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorito
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: azulSuecia,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    veiculo.nome,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: azulSuecia,
                        ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    veiculo.descricao,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.4,
                      color: Colors.black54,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: 14),

                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      EtiquetaEstilizada(
                        texto: veiculo.marca,
                        corFundo: azulSuecia,
                        icone: Icons.directions_car,
                      ),
                      const EtiquetaEstilizada(
                        texto: 'Destaque',
                        corFundo: amareloSuecia,
                        icone: Icons.star,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}