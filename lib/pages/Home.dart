// ignore_for_file: use_key_in_widget_constructors, file_names, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Criando os controllers

  TextEditingController txtcelsius = TextEditingController();
  TextEditingController txtfa = TextEditingController();

  void calcularTemperatura() {
    setState(() {
      double c, f;

      //receber os dados do celsius

      c = double.parse(txtcelsius.text);

      // calculo
      f = (c * 9 / 5) + 32;

      txtfa.text = f.toStringAsFixed(1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2A01B), //COLOR O 0xFF APAGAR O JOGO DA #
      body: SingleChildScrollView(
        child: Container(
          width: double
              .infinity, //sera toda a largura da tela, para aceitar o mainAxisAlignment e crossAxisAlignment.
          padding: EdgeInsets.only(top: 80, left: 10, right: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Conversor de Temperatura',
                style: TextStyle(
                  color: (Colors.white),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Converta de Celsius para Fahrenheit',
                style: TextStyle(
                  color: (Colors.white),
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                ),
              ),
              SizedBox(
                //espacamento entre as colunas
                height: 20,
              ),
              TextField(
                controller: txtcelsius,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Entre com uma temp em celsius',
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 10, //espacamento entre as colunas
              ),
              TextField(
                controller: txtfa,
                readOnly:
                    true, // para nao conseguir digitar nada no campo no caso Temperatura em Fahrenheit
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Temperatura em Fahrenheit',
                ),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity, // para o botao pegar a largura definida
                height: 50,
                child: ElevatedButton(
                  onPressed: calcularTemperatura,
                  child: Text('Converter'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff005cb9),
                    onPrimary: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity, // para o botao pegar a largura definida
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    txtcelsius.clear();
                    txtfa.clear();
                  },
                  child: Text('Limpar'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    onPrimary: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
