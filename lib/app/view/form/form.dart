import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StatePage extends StatelessWidget {
  const StatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EmailProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _EmailTextField(),
              SizedBox(height: 20),
              _SendButton(),
              SizedBox(height: 20),
              _EmailText(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailText extends StatelessWidget {
  const _EmailText();

  @override
  Widget build(BuildContext context) {
    final email = context.watch<EmailProvider>().email;
    return Consumer<EmailProvider>(builder: (_, emailProvider, child) {
      return Text('El email introducido es: ${emailProvider.email}');
    });
  }
}

class _SendButton extends StatelessWidget {
  const _SendButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      child: Text('Enviar'),
    );
  }
}

class _EmailTextField extends StatelessWidget {
  const _EmailTextField();

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) => context.read<EmailProvider>().email = value,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        hintText: 'Email',
      ),
    );
  }
}

class EmailProvider extends ChangeNotifier {
  String _email = '';

  String get email => _email;

  set email(String email) {
    _email = email;
    notifyListeners();
  }
}
