import 'package:flutter/material.dart';
import 'TelaHome.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({super.key});

  @override
  State<TelaCadastro> createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _confirmarSenhaController =
      TextEditingController();

  String _mensagem = '';
  bool _sucesso = false;

  void _cadastrar() {
    final nome = _nomeController.text.trim();
    final email = _emailController.text.trim();
    final senha = _senhaController.text;
    final confirmarSenha = _confirmarSenhaController.text;

    if (nome.isEmpty) {
      setState(() {
        _mensagem = 'Digite seu nome';
        _sucesso = false;
      });
      return;
    }
    if (email.isEmpty) {
      setState(() {
        _mensagem = 'Digite seu email';
        _sucesso = false;
      });
      return;
    }
    if (!email.contains('@')) {
      setState(() {
        _mensagem = 'Digite um email válido';
        _sucesso = false;
      });
      return;
    }
    if (senha.isEmpty) {
      setState(() {
        _mensagem = 'Digite sua senha';
        _sucesso = false;
      });
      return;
    }
    if (senha.length < 6) {
      setState(() {
        _mensagem = 'A senha precisa ter pelo menos 6 caracteres';
        _sucesso = false;
      });
      return;
    }
    if (confirmarSenha != senha) {
      setState(() {
        _mensagem = 'As senhas não são iguais';
        _sucesso = false;
      });
      return;
    }

    setState(() {
      _mensagem = 'Cadastro realizado com sucesso!';
      _sucesso = true;
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const TelaHome()),
        );
      }
    });
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    _confirmarSenhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: AppBar(
        title: const Text(
          'Cadastro',
          style: TextStyle(
            color: Color(0xFF1A1F36),
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        backgroundColor: const Color(0xFFF5F7FA),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF4F6BF4)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: const Color(0xFF22C55E),
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF22C55E).withOpacity(0.3),
                        blurRadius: 18,
                        offset: const Offset(0, 7),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.person_add_alt_1_rounded,
                      color: Colors.white, size: 36),
                ),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  'Criar Conta',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A1F36),
                    letterSpacing: -0.5,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              _buildTextField(
                controller: _nomeController,
                label: 'Nome',
                hint: 'Seu nome completo',
                icon: Icons.person_outline_rounded,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                hint: 'seu@email.com',
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _senhaController,
                label: 'Senha',
                hint: 'Mínimo 6 caracteres',
                icon: Icons.lock_outline_rounded,
                obscureText: true,
              ),
              const SizedBox(height: 16),
              _buildTextField(
                controller: _confirmarSenhaController,
                label: 'Confirmar Senha',
                hint: 'Repita sua senha',
                icon: Icons.lock_reset_rounded,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              if (_mensagem.isNotEmpty)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: _sucesso
                        ? const Color(0xFFF0FFF4)
                        : const Color(0xFFFFF0F0),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: _sucesso
                          ? const Color(0xFFA7F3D0)
                          : const Color(0xFFFFCDD2),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _sucesso
                            ? Icons.check_circle_outline
                            : Icons.error_outline,
                        color: _sucesso
                            ? const Color(0xFF16A34A)
                            : const Color(0xFFE53935),
                        size: 18,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _mensagem,
                          style: TextStyle(
                            color: _sucesso
                                ? const Color(0xFF16A34A)
                                : const Color(0xFFE53935),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _cadastrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF22C55E),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF8A94A6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Voltar para Login',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF1A1F36),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          style: const TextStyle(color: Color(0xFF1A1F36), fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Color(0xFFB0B8C9)),
            prefixIcon: Icon(icon, color: const Color(0xFF8A94A6), size: 20),
            filled: true,
            fillColor: Colors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFF22C55E), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
