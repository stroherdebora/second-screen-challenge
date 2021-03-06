import 'package:flutter/material.dart';
import 'package:second_screen_challenge/widgets/template_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TemplateWidget(
        mainText: 'Get Started',
        nome: '',
        email: '',
        password: '',
      ),
    );
  }
}
