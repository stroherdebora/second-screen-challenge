import 'package:flutter/material.dart';

import 'package:second_screen_challenge/widgets/form_widget.dart';

class TemplateWidget extends StatefulWidget {
  final String mainText;

  String nome;
  String email;
  String password;

  TemplateWidget({
    Key? key,
    required this.mainText,
    required this.nome,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  State<TemplateWidget> createState() => _TemplateWidgetState();
}

class _TemplateWidgetState extends State<TemplateWidget> {
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<FormState> _key = GlobalKey();
  bool validate = false;

  _sendForm() {
    print('clicou');
    if (_key.currentState!.validate()) {
      // Sem erros na validação
      _key.currentState?.save();
      print("Nome $widget.nome");
      print("Password $widget.password");
      print("Email $widget.email");
    } else {
      // erro de validação
      setState(() {
        validate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .40,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/fundo.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * .33,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 52, top: 72, right: 52),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.mainText,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Column(
                      children: <Widget>[
                        Form(
                          key: _key,
                          // autovalidateMode: validate,
                          child: TextFormField(
                            decoration: const InputDecoration(hintText: 'Name'),
                            validator: _validarNome,
                            onSaved: (String? val) {
                              widget.nome = val!;
                            },
                          ),
                        ),
                        TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Email'),
                            keyboardType: TextInputType.emailAddress,
                            validator: _validarEmail,
                            onSaved: (String? val) {
                              widget.email = val!;
                            }),
                        TextFormField(
                            decoration:
                                const InputDecoration(hintText: 'Password'),
                            keyboardType: TextInputType.phone,
                            validator: _validarPassword,
                            onSaved: (String? val) {
                              widget.password = val!;
                            }),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height * .10,
          left: MediaQuery.of(context).size.height * .38,
          child: FloatingActionButton(
            backgroundColor: const Color.fromARGB(255, 52, 6, 255),
            child: const Icon(Icons.arrow_forward),
            onPressed: () {
              _sendForm;
              // Validate vai retornar true se o formulário for válido
              // e false se não for.
              // if (_formKey.currentState!.validate()) {
              //   // Se o form for válido exibe um a snackbar
              // }
            },
          ),
        ),
      ],
    );
  }
}

String _validarNome(String? value) {
  String patttern = r'(^[a-zA-Z ]*$)';
  RegExp regExp = RegExp(patttern);
  if (value?.length == 0) {
    return "Informe o nome";
  } else if (!regExp.hasMatch(value!)) {
    return "O nome deve conter caracteres de a-z ou A-Z";
  }
  return value;
}

String _validarPassword(String? value) {
  String patttern = r'(^[0-9]*$)';
  RegExp regExp = RegExp(patttern);
  if (value?.length == 0) {
    return "Informe a senha";
  } else if (value?.length != 10) {
    return "A senha deve ter 10 dígitos";
  } else if (!regExp.hasMatch(value!)) {
    return "A senha deve conter dígitos";
  }
  return '';
}

String _validarEmail(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern);
  if (value!.length == 0) {
    return "Informe o Email";
  } else if (!regExp.hasMatch(value)) {
    return "Email inválido";
  } else {
    return '';
  }
}
