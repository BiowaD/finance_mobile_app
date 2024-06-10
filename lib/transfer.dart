import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'constants.dart';
import 'controller.dart';
import 'generated/assets.dart';

class Transfer extends StatelessWidget {
  Transfer({super.key});

  final ThemeController themeController = Get.find();
  final amount = '1200'.obs;

  void _updateInput(String value) {
    if (value == '⌫') {
      if (amount.value.isNotEmpty) {
        amount.value = amount.value.substring(0, amount.value.length - 1);
      }
    } else {
      amount.value += value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: GestureDetector(
            onTap: ()=>Get.back(),
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Icon(Icons.arrow_back_ios_new,size: 20,color: ivory,),
            ),
          ),
        ),
        title: Center(child: const Text('Transfer',style: TextStyle(
            fontFamily: family,
            color: ivory
        ),)),
        /*actions: [
          Obx(() {
            return Switch(
              value: themeController.isDarkMode.value,
              onChanged: (value) {
                themeController.toggleTheme();
              },
            );
          }),
        ],*/
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height*0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(()=>Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    height: 95,
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '${amount.value.isEmpty?0:NumberFormat("#,##0", 'de_DE').format(double.parse(amount.value))}',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: ivory,fontFamily: family,
                              fontSize: 90),
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                              color: Colors.white54,fontFamily: family,
                              fontSize: 75),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'USD',
                            style: TextStyle(
                                color: Colors.white30,fontFamily: family,
                                fontSize: 45),
                          ),
                        ),
                      ],
                    ),
                  )),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Text('Your balance \$${NumberFormat("#,##0.00").format(balance)}',
                        style: TextStyle(
                            color: Colors.white30,fontFamily: family,
                            fontSize: 22)
                    ),
                  ),
                ],
              ),
            ),

            Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text('Main \naccount',
                            style: TextStyle(color: ivory,fontSize: 22),),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Stack(
                              children: [
                                Container(
                                  height: 30,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: AssetImage(Assets.imagesMastercard),
                                          fit: BoxFit.fill
                                      )
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: 5,
                                  child: Text('5531', style: TextStyle(fontFamily: family, fontWeight: FontWeight.bold),),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 70,
                          width: 70,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50)
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(50)
                                  ),
                                  child: Image.asset(
                                    Assets.imagesSwap,
                                    color: ivory,
                                    height: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(Assets.imagesBack)
                              ),
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                            child: Text('EK',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: family,color: ivory),),
                          ),
                        ),
                        Container(
                          child: Text('Edi \nKeyboard',
                            style: TextStyle(color: ivory,fontSize: 22),),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: ivory
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Continue',style: TextStyle(fontFamily: family,
                            color: eirie,fontSize: 24),),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Divider(),
            SizedBox(height: MediaQuery.of(context).size.height*0.05,),
            Container(
              height: MediaQuery.of(context).size.height*0.35,
              child: NumericKeyboard(
                onKeyboardTap: _updateInput,
              ),
            ),
          ],
        ),
      ),
    );
  }
}