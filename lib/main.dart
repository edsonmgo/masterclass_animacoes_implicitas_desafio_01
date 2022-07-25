import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BotaoFlutuante(),
    );
  }
}

class BotaoFlutuante extends StatefulWidget {
  const BotaoFlutuante({Key? key}) : super(key: key);

  @override
  State<BotaoFlutuante> createState() => _BotaoFlutuanteState();
}

class _BotaoFlutuanteState extends State<BotaoFlutuante> {
  double squareWidth = 80;
  double squareHeight = 80;
  double radiusBotao = 40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.clear),
            Spacer(),
            Text('Desafio do Botão Flutuante'),
            Spacer(),
          ],
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              radiusBotao = radiusBotao == 40 ? 0 : 40;
              squareWidth = radiusBotao == 40 ? 80 : 160;
            });
          },
          child: AnimatedAlign(
            duration: Duration(seconds: 1),
            curve: Curves.ease,
            alignment:
                radiusBotao == 40 ? Alignment.bottomRight : Alignment.topCenter,
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              width: squareWidth,
              height: squareHeight,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(radiusBotao),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
