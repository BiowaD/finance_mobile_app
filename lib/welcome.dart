import 'package:flutter/material.dart';

import 'constants.dart';
import 'generated/assets.dart';

class Welcome extends StatelessWidget{
  Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.lightBlueAccent,
              eirie,
            ],
            stops: [0.05, 0.2, 0.4],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.18,),
            Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.45,),
                Transform.rotate(
                  angle: 0.785390*2,
                  child: Container(
                    height: MediaQuery.of(context).size.width*0.5,
                    width: MediaQuery.of(context).size.height*0.35,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(Assets.imagesVisa),
                          fit: BoxFit.cover,
                        )
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height*0.1,
                  right: 0,
                  child: Transform.rotate(
                    angle: 0.785390*2,
                    child: Container(
                      height: MediaQuery.of(context).size.width*0.5,
                      width: MediaQuery.of(context).size.height*0.35,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(Assets.imagesMastercard),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                  ),
                )
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile banking \nthe world loves',
                      style: TextStyle(
                        fontFamily: family,
                        color: ivory,
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('Seamless money management, effortless transactions and personalized financial insights',
                      style: TextStyle(
                        fontFamily: family,
                        color: Colors.white54,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width*0.9, 70),
                    padding: EdgeInsets.all(20),
                    backgroundColor: ivory,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    )
                ),
                onPressed: (){

                },
                child: Text('Create an Account',style: TextStyle(
                    color: eirie,
                    fontSize: 24,
                    fontFamily: family
                ),)
            )
          ],
        ),
      ),
    );
  }
}