import 'package:flutter/material.dart';
import '../models/veiculo.dart';
import '../widgets/etiqueta_estilizada.dart';
import 'detalhes_screen.dart';

class GaleriaScreen extends StatefulWidget {
  const GaleriaScreen({super.key});

  @override
  State<GaleriaScreen> createState() => _GaleriaScreenState();
}

class _GaleriaScreenState extends State<GaleriaScreen> {
  // Dados com os nomes novos e as fotos originais conforme solicitado
  final List<Veiculo> veiculos = const [
    Veiculo(
      id: '1',
      nome: 'Juke',
      marca: 'Nissan',
      imagemUrl: 'https://images.unsplash.com/photo-1609521263047-f8f205293f24?auto=format&fit=crop&w=800&q=80',
      descricao: 'Crossover compacto com design audacioso e único, combinando agilidade urbana com um estilo marcante e tecnológico.',
    ),
    Veiculo(
      id: '2',
      nome: 'LaFerrari',
      marca: 'Ferrari',
      imagemUrl: 'https://images.unsplash.com/photo-1583121274602-3e2820c69888?auto=format&fit=crop&w=800&q=80',
      descricao: 'O ápice da engenharia da Ferrari, um hipercarro híbrido que combina um motor V12 com tecnologia KERS para performance extrema.',
    ),
   Veiculo(
      id: '3',
      nome: 'RS 7',
      marca: 'Audi',
      imagemUrl: 'https://images.unsplash.com/photo-1606152421802-db97b9c7a11b?auto=format&fit=crop&w=800&q=80',
      descricao: 'Cupê esportivo sofisticado que une a elegância da Audi com o desempenho dinâmico da linha RS, equipado com tração Quattro.',
    ),
  ];

  final Map<String, bool> _favoritos = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria Motors', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: LayoutBuilder(
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
            int numeroDeColunas = constraints.maxWidth >= 900 ? 3 : 2;
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: numeroDeColunas,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.9,
              ),
              itemCount: veiculos.length,
              itemBuilder: (context, index) {
                return _buildCardVeiculo(veiculos[index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget _buildCardVeiculo(Veiculo veiculo) {
    final isFavorito = _favoritos[veiculo.id] ?? false;

    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 12),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetalhesScreen(veiculo: veiculo),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Hero(
                  tag: 'veiculo_img_${veiculo.id}',
                  child: Image.network(
                    veiculo.imagemUrl,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 180,
                      color: Colors.grey[200],
                      child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                    ),
                  ),
                ),
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
                      padding: EdgeInsets.all(isFavorito ? 12 : 8),
                      decoration: BoxDecoration(
                        color: isFavorito ? Colors.redAccent : Colors.white.withValues(alpha: 0.8),
                        shape: BoxShape.circle,
                        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4)],
                      ),
                      child: Icon(
                        isFavorito ? Icons.favorite : Icons.favorite_border,
                        color: isFavorito ? Colors.white : Colors.redAccent,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    veiculo.nome,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      EtiquetaEstilizada(
                        texto: veiculo.marca,
                        corFundo: Theme.of(context).colorScheme.primary,
                        icone: Icons.directions_car,
                      ),
                      const EtiquetaEstilizada(
                        texto: 'Pronta Entrega',
                        corFundo: Colors.green,
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