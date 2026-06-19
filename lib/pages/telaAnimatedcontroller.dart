import 'package:flutter/material.dart';

class TelaAnimationController extends StatefulWidget {
  const TelaAnimationController({super.key});

  @override
  State<TelaAnimationController> createState() {
    return _TelaAnimationControllerState();
  }
}

class _TelaAnimationControllerState extends State<TelaAnimationController>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> tamanho;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    tamanho = Tween<double>(
      begin: 100,
      end: 250,
    ).animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void iniciarAnimacao() {
    controller.forward();
  }

  void voltarAnimacao() {
    controller.reverse();
  }

  void reiniciarAnimacao() {
    controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimationController'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedBuilder(
                animation: tamanho,
                builder: (context, child) {
                  return Container(
                    width: tamanho.value,
                    height: tamanho.value,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        'Animação',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: iniciarAnimacao,
                child: const Text('Iniciar animação'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: voltarAnimacao,
                child: const Text('Voltar animação'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: reiniciarAnimacao,
                child: const Text('Reiniciar animação'),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Voltar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
