import 'package:flutter/material.dart';

class TelaLivros extends StatelessWidget {
  const TelaLivros({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Livros',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Icon(Icons.menu_book, size: 80, color: Colors.green),
            ),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'Leituras Recomendadas',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            _itemLivro('📖 O Senhor dos Anéis', 'J.R.R. Tolkien — Fantasia épica e atemporal.'),
            _itemLivro('📖 1984', 'George Orwell — Distopia política impactante.'),
            _itemLivro('📖 Sapiens', 'Yuval Noah Harari — História da humanidade.'),
            _itemLivro('📖 O Pequeno Príncipe', 'Antoine de Saint-Exupéry — Clássico universal.'),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Feito com 💚 por Manu',
                style: TextStyle(fontSize: 13, color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemLivro(String titulo, String descricao) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titulo,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(descricao,
              style: const TextStyle(fontSize: 13, color: Colors.black54)),
        ],
      ),
    );
  }
}
