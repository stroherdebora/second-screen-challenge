// import 'package:flutter/material.dart';

// class FormWidget extends StatelessWidget {
//   const FormWidget({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         TextFormField(
//           decoration: InputDecoration(hintText: 'Nome Completo'),
//           maxLength: 40,
//           validator: _validarNome,
//           onSaved: (String val) {
//             nome = val;
//           },
//         ),
//         TextFormField(
//             decoration: InputDecoration(hintText: 'Password'),
//             keyboardType: TextInputType.phone,
//             maxLength: 10,
//             validator: _validarCelular,
//             onSaved: (String val) {
//               password = val;
//             }),
//         TextFormField(
//             decoration: InputDecoration(hintText: 'Email'),
//             keyboardType: TextInputType.emailAddress,
//             maxLength: 40,
//             validator: _validarEmail,
//             onSaved: (String val) {
//               email = val;
//             }),
//         SizedBox(height: 15.0),
//         RaisedButton(
//           onPressed: _sendForm,
//           child: Text('Enviar'),
//         )
//       ],
//     );
//   }
// }
