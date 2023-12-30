import 'dart:math' as math;

import 'package:flutter/material.dart';

class CalProvider with ChangeNotifier{
  // String _lastpressed = '';
  String _lastpressed = '';
  String _result = '';

  String get result {
    return _result;
  }

  set  result(String result){
    _result = result;
  }


  String get lastpressed => _lastpressed;

  set lastpressed(String value){
    _lastpressed = value;
  }

  void btn1(TextEditingController controller){
    if(lastpressed != '%') {
      controller.text = controller.text + '1';
      lastpressed = '1';
    }
  }
  void btn2(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '2';
      lastpressed = '2';
    }
  }
  void btn3(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '3';
      lastpressed = '3';
    }
  }
  void btn4(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '4';
      lastpressed = '4';
    }
  }
  void btn5(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '5';
      lastpressed = '5';
    }
  }
  void btn6(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '6';
      lastpressed = '6';
    }
  }
  void btn7(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '7';
      lastpressed = '7';
    }
  }
  void btn8(TextEditingController c){
    if(lastpressed != '%') {
      c.text = c.text + '8';
      lastpressed = '8';
    }
  }
  void btn9(TextEditingController c){
   if(lastpressed != '%'){
     c.text = c.text + '9';
     lastpressed = '9';
   }
  }
  void btn0(TextEditingController c){
    if(lastpressed != '%'){
      c.text = c.text + '0';
      lastpressed = '0';
    }

  }
  void btnPercent(TextEditingController c){
    if( lastpressed != 'x' && lastpressed != '+' && lastpressed != '-' &&
        lastpressed != '÷' && lastpressed != '.' && lastpressed != '%' && c.text != '') {
      c.text = c.text + '%';
      lastpressed = '%';
    }
  }
  void btnAdd(TextEditingController c){
    if( lastpressed != 'x' && lastpressed != '+' && lastpressed != '-' &&
        lastpressed != '÷' && lastpressed != '.' && c.text != '') {
      c.text =  c.text + '+';
      lastpressed = '+';
    }



  }

  void btnMinus(TextEditingController c){
    if( lastpressed != 'x' && lastpressed != '+' && lastpressed != '-' &&
        lastpressed != '÷' && lastpressed != '.' ){
      c.text = c.text + '-';
      lastpressed = '-';
    }


  }
  void btnDivide(TextEditingController c){
  if( lastpressed != 'x' && lastpressed != '+' && lastpressed != '-' &&
      lastpressed != '÷' && lastpressed != '.' && c.text != ''){
    c.text = c.text + '÷';
    lastpressed  = '÷';
  }

  }

  void btnMultiply(TextEditingController c){
    if( lastpressed != 'x' && lastpressed != '+' && lastpressed != '-' &&
        lastpressed != '÷' && lastpressed != '.' && c.text != ''){
      c.text = c.text + 'x';
      lastpressed = 'x';
    }
  }

  btnClear(TextEditingController c) {
    c.text = '';
    result = '';
    lastpressed = '';
    notifyListeners();
  }

  void btnClearLast(TextEditingController c){
    if(c.text.isNotEmpty) {
      int size = c.text.length;
      c.text = c.text.substring(0, size - 1);
      lastpressed = c.text.substring(c.text.length-1,c.text.length);
      print(c.text.substring(c.text.length-1,c.text.length));
    }
  }
  
  void btnEqualsTo(TextEditingController c){
    var value = c.text;

    if(value.isNotEmpty){

      if(value.startsWith('-')){
        value = value.replaceFirst('-','0-');
      }

      if(value.endsWith('+') || value.endsWith('x') || value.endsWith('÷') || value.endsWith('-')){
        value = value.replaceRange(value.length-1, value.length,'');
      }

      value =  value.replaceAll('x','*');
      value = value.replaceAll('÷', '/');
      //value = value.replaceAll('%', '*0.01');

      //Using Regular expression to split the arithmetic signs (+, -, *, /)
      RegExp regExp = RegExp(r'[+\-*/]');
      // Splitting the numbers based on arithmetic signs
      List<String> numbers = value.split(regExp);

      // Getting the arithmetic signs
      List<String> operators = regExp.allMatches(value).map((match) => match.group(0)!).toList();

      // Printing the split numbers
      print(numbers);

      // Printing the arithmetic signs
      print(operators);

      // Performing arithmetic operations
      double results = calculate(numbers, operators);
      result = '$results';
      print('Result: $result');
      notifyListeners();
    }
  }

  void btnDot(TextEditingController c){
    if(lastpressed != '.'){
      c.text = c.text +'.';
      lastpressed = '.';
    }
  }

  double calculate(List<String> numbers, List<String> operators) {
    if (numbers.length != operators.length + 1) {
      throw ArgumentError('Invalid expression');
    }
    double result = 0.0;
    if(numbers[0].contains('%')){
       result = double.parse(numbers[0].replaceAll('%','')) *0.01;
    }else{
      result = double.parse(numbers[0]);
    }


    for (var i = 0; i < operators.length; i++) {
      double nextOperand = 0.0;
      if(numbers[i+1].contains('%')){
        nextOperand = double.parse(numbers[i+1].replaceAll('%', '')) * 0.01;
      }else{
        nextOperand = double.parse(numbers[i+1]);
      }

      switch (operators[i]) {
        case '+':
          result += nextOperand;
          break;
        case '-':
          result -= nextOperand;
          break;
        case '*':
          result *= nextOperand;
          break;
        case '/':
          result /= nextOperand;
          break;

        default:
          throw ArgumentError('Invalid operator');
      }
    }

    return result;
  }

}