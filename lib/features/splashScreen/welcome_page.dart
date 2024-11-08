import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children:[ 
          Container(
            height: MediaQuery.of(context).size.height,
          decoration:  const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/welcome.jpeg'),
              fit: BoxFit.cover)),
        ),
        Positioned(
          bottom: MediaQuery.of(context).size.height /1.8,
          left: 15,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Bienvenue \nsur EcoBite',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900),),
              Text('Réduisez le gaspillage alimentaire et \nprofitezde repas à prix réduits avec\nEcobite',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
            ],
          ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height /3,
            left: 15,
            child: Container(
              width: 400,             
              child: ElevatedButton(
              onPressed: (){
                   Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  SignIn()),
                      );    
              }, 
              child: Text("Connectez vous"),
              style:ElevatedButton.styleFrom(
                foregroundColor:Colors.white,
              backgroundColor: AppColor.primary,
              ),
              ),
            )
            )
      ]),
    );
  }
}