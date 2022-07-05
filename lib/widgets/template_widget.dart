import 'package:flutter/material.dart';

class TemplateWidget extends StatelessWidget {
  final String mainText;
  const TemplateWidget({Key? key, required this.mainText}) : super(key: key);

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
                        mainText,
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
