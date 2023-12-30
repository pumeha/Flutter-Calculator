import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/calculator_provider.dart';

void main() => runApp(MultiProvider(
  providers: [ChangeNotifierProvider(create: (_) => CalProvider())],
  child: const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  
  ),
));

  class Home extends StatelessWidget {
    const Home({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Simple Calculator',
          style: TextStyle(color: Colors.deepPurple,fontSize: 24.0,fontWeight: FontWeight.w700)),
        backgroundColor: Colors.white, centerTitle: true,),
        body:  Calculator(),

      );
    }
  }

  class Calculator extends StatefulWidget {
    const Calculator({super.key});
   static const TextStyle myStyle =  TextStyle(fontSize: 32.0);


    @override
    State<Calculator> createState() => _CalculatorState();
  }

  class _CalculatorState extends State<Calculator> {
  TextEditingController c = TextEditingController();
  final FocusNode _focusNode = FocusNode();
    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
          children: [
           Padding(
            padding: const EdgeInsets.fromLTRB(18, 18, 18, 8),
            child: TextField(textInputAction: TextInputAction.none,readOnly: true, showCursor: true, autofocus: true,
            textAlign: TextAlign.right, controller: c, focusNode: _focusNode, style: Calculator.myStyle,
                    ),
          ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0,bottom: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(context.watch<CalProvider>().result.toString(),style: Calculator.myStyle,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilledButton( onPressed: ()=> context.read<CalProvider>().btnClear(c),
                    child: const Text('C',style: TextStyle(color: Colors.red,fontSize: 32.0),)),
                    FilledButton(onPressed: ()=> context.read<CalProvider>().btnDivide(c), child: const Text('÷',style: Calculator.myStyle,)),
                    FilledButton(onPressed: ()=> context.read<CalProvider>().btnMultiply(c), child: const Icon(Icons.close)),
                    FilledButton(onPressed: ()=> context.read<CalProvider>().btnClearLast(c), child: const Icon(Icons.backspace)),
                  ],
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton( onPressed: ()=> context.read<CalProvider>().btn7(c),
                      child: const Text('7',style: Calculator.myStyle,)),
                  FilledButton(onPressed: ()=> context.read<CalProvider>().btn8(c), child: const Text('8',style: Calculator.myStyle,)),
                  FilledButton(onPressed: ()=>context.read<CalProvider>().btn9(c), child: const Text('9',style: Calculator.myStyle,)),
                  FilledButton(onPressed: ()=> context.read<CalProvider>().btnMinus(c), child: const Icon(Icons.remove)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton( onPressed: ()=> context.read<CalProvider>().btn4(c),
                      child: const Text('4',style: Calculator.myStyle,)),
                  FilledButton(onPressed: ()=> context.read<CalProvider>().btn5(c), child: const Text('5',style: Calculator.myStyle,)),
                  FilledButton(onPressed: ()=> context.read<CalProvider>().btn6(c), child: const Text('6',style: Calculator.myStyle,)),
                  FilledButton(onPressed: ()=> context.read<CalProvider>().btnAdd(c), child: const Icon(Icons.add),style: const ButtonStyle(),),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FilledButton( onPressed: () { context.read<CalProvider>().btn1(c); },
                                child: const Text('1',style: Calculator.myStyle,)),
                            FilledButton(onPressed: (){ context.read<CalProvider>().btn2(c); },
                                child: const Text('2',style: Calculator.myStyle,)),
                            FilledButton(onPressed: ()=>context.read<CalProvider>().btn3(c),
                                child: const Text('3',style: Calculator.myStyle,)),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FilledButton( onPressed: ()=> context.read<CalProvider>().btnPercent(c),
                                child: const Icon(Icons.percent)),
                            FilledButton(onPressed: ()=> context.read<CalProvider>().btn0(c), child: const Text('0',style: Calculator.myStyle,)),
                            FilledButton(onPressed: ()=> context.read<CalProvider>().btnDot(c), child: const Text('.',style: Calculator.myStyle,textAlign: TextAlign.center,)),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding( padding: const EdgeInsets.only(right: 18),
                  child: FilledButton(onPressed: ()=> context.read<CalProvider>().btnEqualsTo(c) , child: const Text('\n=\n',style: Calculator.myStyle,)),
                )
              ],
            )
          ],
        ),
      );
    }
  }



  

  

