import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:second_screen_challenge/widgets/template_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TemplateWidget(
      mainText: 'Welcome back',
      nome: '',
      email: '',
      password: '',
    );
  }
}
