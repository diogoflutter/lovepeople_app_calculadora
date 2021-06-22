import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculadora(),
    );
  }
}

class Calculadora extends StatefulWidget {
  @override
  _CalculadoraState createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  String display = '';
  String operador = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora'),
      ),
      body: Column(
        children: [
          _buildDisplay(),
          _buildButtons(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return Container(
      width: double.maxFinite,
      margin: EdgeInsets.all(24),
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.green,
        border: Border.fromBorderSide(
          BorderSide(color: Colors.black, width: 2),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        display,
        style: TextStyle(color: Colors.white, fontSize: 32),
        textAlign: TextAlign.end,
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('7'),
            _buildButton('8'),
            _buildButton('9'),
            _buildButton('/'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('4'),
            _buildButton('5'),
            _buildButton('6'),
            _buildButton('*'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('1'),
            _buildButton('2'),
            _buildButton('3'),
            _buildButton('-'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildButton('C'),
            _buildButton('0'),
            _buildButton('='),
            _buildButton('+'),
          ],
        ),
      ],
    );
  }

  Widget _buildButton(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          onPressed: () {
            if (title == '=') {
              calcular();
            } else if (title == 'C') {
              apagar();
            } else {
              addInDisplay(title);
            }
            if (title == '-' || title == '+' || title == '/' || title == '*') {
              operador = title;
            }
          },
          child: Text(title)),
    );
  }

  void calcular() {
    List<String> valores = display.split(operador);
    int valor1 = int.parse(valores[0]);
    int valor2 = int.parse(valores[1]);
    num resultado = 0;

    if (operador == '+') {
      resultado = valor1 + valor2;
    }
    if (operador == '-') {
      resultado = valor1 - valor2;
    }

    if (operador == '*') {
      resultado = valor1 * valor2;
    }
    if (operador == '/') {
      resultado = valor1 / valor2;
    }

    setState(() {
      display = resultado.toString();
    });
  }

  void apagar() {
    setState(() {
      display = '';
    });
  }

  void addInDisplay(String text) {
    setState(() {
      display += text;
    });
  }
}
