import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

void _setChoice(context,string){

  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
      SnackBar(
        content:Text(string),
        action: SnackBarAction(label:'undo',onPressed: scaffold.hideCurrentSnackBar,),
      )
  );
}

class _HomeState extends State<Home> {
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
              Image.asset("lib/assets/images/padrao.png",height: 120,width: 120,),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Text('Escolha uma opção abaixo'
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
                      _setChoice(context,'Pedra');
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('lib/assets/images/papel.png',height: 120, width: 120,),
                    onTap: (){
                      _setChoice(context,'Papel');
                    },
                  ),
                  GestureDetector(
                    child: Image.asset('lib/assets/images/tesoura.png',height: 120, width: 120,),
                    onTap: (){
                      _setChoice(context,'Tesoura');
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );
  }
}
