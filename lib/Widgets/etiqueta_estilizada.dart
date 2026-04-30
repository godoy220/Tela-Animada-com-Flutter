import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 7,
      ),
      decoration: BoxDecoration(
        color: corFundo.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: corFundo.withValues(alpha: 0.55),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icone != null) ...[
            Icon(
              icone,
              size: 16,
              color: corFundo,
            ),
            const SizedBox(width: 5),
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