import 'package:flutter/material.dart';
import 'telaCadastro.dart';
import 'telaHome.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  String mensagemErro = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 80),
            const SizedBox(height: 20),
            const Text(
              'Login',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Digite seus dados para acessar o aplicativo.'),
            const SizedBox(height: 20),

            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            Text(
              mensagemErro,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                if (emailController.text.isEmpty) {
                  setState(() {
                    mensagemErro = 'Digite seu email';
                  });
                } else if (!emailController.text.contains('@')) {
                  setState(() {
                    mensagemErro = 'Digite um email válido';
                  });
                } else if (senhaController.text.isEmpty) {
                  setState(() {
                    mensagemErro = 'Digite sua senha';
                  });
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TelaHome(),
                    ),
                  );
                }
              },
              child: const Text('Entrar'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TelaCadastro(),
                  ),
                );
              },
              child: const Text('Criar conta'),
            ),
          ],
        ),
      ),
    );
  }
}