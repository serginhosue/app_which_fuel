import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';

class CalculatorFuel extends StatefulWidget {
  @override
  _CalculatorFuelState createState() => _CalculatorFuelState();
}

class _CalculatorFuelState extends State<CalculatorFuel> {
  TextEditingController _controllerEtanol = new TextEditingController();
  TextEditingController _controllerGasolina = new TextEditingController();

  var _message = "Qual melhor custo benefício?";
  var _messageColor = 0xffFFFFFF;


  void _calculateBetterFuel(){

    double _priceEtanol = double.tryParse( _controllerEtanol.text );
    double _priceGasolina = double.tryParse( _controllerGasolina.text );

    if(_priceEtanol == null || _priceGasolina == null){

      setState(() {
        _message = "Favor digitar um valor validor. \nUsar (.) ao invés de (,)";
        _messageColor = 0xFFFF1493;
      });

    }else{

      if((_priceEtanol / _priceGasolina) >= 0.7){
        setState(() {
          _message = "Abasteça com Gasolina";
          _messageColor = 0xFF00FF7F;
        });
      }else{
        setState(() {
          _message = "Abasteça com Etanol";
          _messageColor = 0xFF00FF7F;
        });

        _clearFields();
      }



    }

  }
  void _clearFields(){
    _controllerEtanol.text = "";
    _controllerGasolina.text = "";
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff5600CC),
          title: Text(
            "Descubral qual melhor combustível",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold
            ),
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff6D9FFF), Color(0xffC27BFF)])),
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Image.asset("assets/images/home/logo-app-which-fuel.png"),
                Text(
                  "$_message",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(_messageColor),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      labelText: "Preço do Etanol, ex: X.XX",
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white)
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      )),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _controllerEtanol,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                      labelText: "Preço da Gasolina, ex: X.XX",
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      labelStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: RaisedButton(
                    color: Color(0xfff5600CC),
                    child: Text(
                      "CALCULAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),
                    ),
                    onPressed: _calculateBetterFuel,
                  ),
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            color: Color(0xff5600CC),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                "© Copyright Sergio Bernardes Suematsu",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )));
     }
}
