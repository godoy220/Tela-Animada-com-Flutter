import 'package:flutter/material.dart';

// Requisito 5: Widget Customizado Reutilizável com parâmetros e const constructor
class EtiquetaEstilizada extends StatelessWidget {
  final String texto;
  final Color corFundo;
  final IconData? icone;

  const EtiquetaEstilizada({
    super.key,
    required this.texto,
    required this.corFundo,
    this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: corFundo.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: corFundo.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icone != null) ...[
            Icon(icone, size: 16, color: corFundo),
            const SizedBox(width: 4),
          ],
          Text(
            texto,
            style: TextStyle(
              color: corFundo,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}