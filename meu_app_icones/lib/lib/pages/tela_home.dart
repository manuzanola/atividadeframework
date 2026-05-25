import 'package:flutter/material.dart';
import '../widgets/card_icone.dart';
import 'tela_filmes.dart';
import 'tela_jogos.dart';
import 'tela_musicas.dart';
import 'tela_livros.dart';
import 'tela_podcast.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  String mensagem = '';

  void _abrirModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          height: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                ' Sobre Músicas',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Atualizações de podcast em breve!',
                style: TextStyle(fontSize: 15, color: Colors.black54),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Fechar'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meu App de Ícones',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (mensagem.isNotEmpty)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.indigo.withOpacity(0.3)),
                ),
                child: Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.indigo,
                  ),
                ),
              ),
            const SizedBox(height: 8),
            CardIcone(
              icone: Icons.movie,
              titulo: 'Filmes',
              descricao: 'Descubra os melhores filmes do momento.',
              textoBotao: 'Ver Filmes',
              cor: Colors.deepOrange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaFilmes()),
                );
              },
            ),
            CardIcone(
              icone: Icons.sports_esports,
              titulo: 'Jogos',
              descricao: 'Os jogos mais populares para jogar agora.',
              textoBotao: 'Ver Jogos',
              cor: Colors.purple,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaJogos()),
                );
              },
            ),
            CardIcone(
              icone: Icons.music_note,
              titulo: 'Músicas',
              descricao: 'Explore playlists e artistas incríveis.',
              textoBotao: 'Saiba Mais',
              cor: Colors.pink,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaMusicas()),
                );
              },
            ),
            CardIcone(
              icone: Icons.menu_book,
              titulo: 'Livros',
              descricao: 'Leituras que vão transformar sua visão de mundo.',
              textoBotao: 'Ver Livros',
              cor: Colors.green,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TelaLivros()),
                );
              },
            ),
            CardIcone(
              icone: Icons.headphones,
              titulo: 'Podcasts',
              descricao: 'Ouça conteúdo de qualidade em qualquer lugar.',
              textoBotao: 'Explorar',
              cor: Colors.blue,
              onPressed: _abrirModal,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
