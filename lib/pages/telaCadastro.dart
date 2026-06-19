import 'package:flutter/material.dart';
import 'telaHome.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final confirmarController = TextEditingController();

  String mensagem = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person_add, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Criar Conta',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: confirmarController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmar senha',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              mensagem,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (nomeController.text.isEmpty) {
                  setState(() {
                    mensagem = 'Digite seu nome';
                  });
                } else if (emailController.text.isEmpty) {
                  setState(() {
                    mensagem = 'Digite seu email';
                  });
                } else if (!emailController.text.contains('@')) {
                  setState(() {
                    mensagem = 'Digite um email válido';
                  });
                } else if (senhaController.text.isEmpty) {
                  setState(() {
                    mensagem = 'Digite sua senha';
                  });
                } else if (senhaController.text.length < 6) {
                  setState(() {
                    mensagem =
                        'A senha precisa ter pelo menos 6 caracteres';
                  });
                } else if (senhaController.text != confirmarController.text) {
                  setState(() {
                    mensagem = 'As senhas não são iguais';
                  });
                } else {
                  setState(() {
                    mensagem = 'Cadastro realizado com sucesso!';
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaHome(),
                    ),
                  );
                }
              },
              child: const Text('Cadastrar'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Voltar para Login'),
            ),
          ],
        ),
      ),
    );
  }
}