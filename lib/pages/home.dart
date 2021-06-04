import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var result = 'Escolha uma opção abaixo';
  var img =  'lib/assets/images/padrao.png';
  var win = 0;
  var lose = 0;
  var draw = 0;


  void _setChoice(choice){

    final rng = Random().nextInt(3);
    final arrOptions = [
      'Pedra',
      'Papel',
      'Tesoura'
    ];
    final arrImg = [
      'lib/assets/images/pedra.png',
      'lib/assets/images/papel.png',
      'lib/assets/images/tesoura.png',
    ];

    var IAChoice = arrOptions[rng];

    switch(IAChoice) {
      case 'Pedra':
        if(choice=='Pedra'){
          setState((){
            result = 'Empate';
            draw++;
          });
        }else if(choice=='Papel'){
          setState((){
            result = 'Você venceu!!';
            win++;
          });
        }else if(choice=="Tesoura"){
          setState((){
            result = 'Você Perdeu!!';
            lose++;
          });
        }
      break;
      case 'Papel':
        if(choice=='Papel'){
          setState((){
            result = 'Empate';
            draw++;
          });
        }else if(choice=='Pedra'){
          setState((){
            result = 'Você Perdeu!!';
            lose++;
          });
        }else if(choice=="Tesoura"){
          setState((){
            result = 'Você Venceu!!';
            win++;
          });
        }
      break;
      case 'Tesoura':
        if(choice=='Tesoura'){
          setState((){
            result = 'Empate';
            draw++;
          });
        }else if(choice=='Papel'){
          setState((){
            result = 'Você Perdeu!!';
            lose++;
          });
        }else if(choice=="Pedra"){
          setState((){
            result = 'Você Venceu!!';
            win++;
          });
        }
      break;
    }
    setState(() {
      img = arrImg[rng];
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                  'Escolha do App'
                  ,style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  )
                ),
              ),
              Image.asset(this.img,height: 120,width: 120,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text(
                    result
                    ,style:TextStyle(
                        fontWeight: FontWeight.bold
                        ,fontSize: 20
                    )
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    child:Image.asset('lib/assets/images/pedra.png',height: 120, width: 120,),
                    onTap: (){
                      _setChoice('Pedra');
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('lib/assets/images/papel.png',height: 120, width: 120,),
                    onTap: (){
                      _setChoice('Papel');
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('lib/assets/images/tesoura.png',height: 120, width: 120,),
                    onTap: (){
                      _setChoice('Tesoura');
                    },
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('V: ${win} / '),
                    Text('D: ${lose} / '),
                    Text('E: ${draw} '),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
