import 'package:finance_mobile_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.light,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontFamily: 'Grotesk'),
            bodyMedium: TextStyle(fontFamily: 'Grotesk'),
            bodySmall: TextStyle(fontFamily: 'Grotesk')
          ),
        ),
        darkTheme: ThemeData(
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(fontFamily: 'Grotesk'),
              bodyMedium: TextStyle(fontFamily: 'Grotesk'),
              bodySmall: TextStyle(fontFamily: 'Grotesk')
          ),
        ),
        themeMode: !themeController.isDarkMode.value ? ThemeMode.dark : ThemeMode.light,
        home: Welcome(),
      );
    });
  }
}

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

class Home extends StatelessWidget {
  Home({super.key});
  final _selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            backgroundColor: backgroundColor,
            child: IconButton(
              iconSize: 20,
              icon: Icon(Icons.dashboard),
              onPressed: (){

              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: CircleAvatar(
              backgroundColor: backgroundColor,
              child: Stack(
                children: [
                  IconButton(
                    onPressed: (){

                    },
                    iconSize: 20,
                    icon: Icon(Icons.notifications),
                  ),
                  Positioned(
                    right: 9,
                    top: 9,
                    child: Icon(Icons.circle, color: Colors.red, size: 10,),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: Stack(
        alignment: Alignment.center,
        children: [
            Obx(()=>Container(
              height: 80,
              width: 295,
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: backgroundColor
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: ()=>_selectedIndex.value = 0,
                    child: CircleAvatar(
                        radius: 35,
                        backgroundColor: _selectedIndex.value==0?ivory:backgroundColor,
                        child: Icon(
                          Icons.home_filled,
                          size: 35,
                          color: _selectedIndex.value==0?eirie:ivory,
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>_selectedIndex.value = 1,
                    child: CircleAvatar(
                        radius: 35,
                        backgroundColor: _selectedIndex.value==1?ivory:backgroundColor,
                        child: Icon(
                          Icons.add_card,
                          size: 35,
                          color: _selectedIndex.value==1?eirie:ivory,
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>_selectedIndex.value = 2,
                    child: CircleAvatar(
                        radius: 35,
                        backgroundColor: _selectedIndex.value==2?ivory:backgroundColor,
                        child: Image.asset(
                          Assets.imagesChat,
                          height: 30,
                          color: _selectedIndex.value==2?eirie:ivory,
                        )
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=>_selectedIndex.value = 3,
                    child: CircleAvatar(
                        radius: 35,
                        backgroundColor: _selectedIndex.value==3?ivory:backgroundColor,
                        child: Icon(
                          Icons.account_circle,
                          size: 35,
                          color: _selectedIndex.value==3?eirie:ivory,
                        )
                    ),
                  ),
                ],
              ),
            ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(

          children: [
            SizedBox(height: 50,),
            Center(
              child: Text(
                'Your balance',
                style: TextStyle(
                  fontFamily: family,
                  fontSize: 22,
                ),
              ),
            ),
            Center(
              child: Text('\$${NumberFormat("#,##0.00").format(balance)}',
              style: TextStyle(
                fontFamily: family,
                fontSize: 60
              ),),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index){
                  String asset = index == 0 ? Assets.imagesVisa:Assets.imagesMastercard;
                  Color color = index == 0 ? Colors.grey : Colors.blue;
                  return GestureDetector(
                    onTap: ()=>detail(index, context),
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      width: MediaQuery.of(context).size.width*0.8,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            asset,
                          )
                        )
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void detail(int index, context){
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0)),
        ),
        backgroundColor: Colors.white10,
        builder: (BuildContext context){
          return Container(
            padding: EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Cards', style: TextStyle(
                        fontFamily: family,
                        fontSize: 22,
                        color: ivory,
                        fontWeight: FontWeight.bold
                      ),),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundColor: backgroundColor,
                            child: Icon(
                                Icons.add_circle, color: Colors.white54,),
                          ),
                          SizedBox(width: 5,),
                          Stack(
                            children: [
                              Container(
                                height: 45,
                                width: 65,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: AssetImage(Assets.imagesVisa),
                                        fit: BoxFit.fill
                                    )
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                left: 5,
                                child: Text('9500', style: TextStyle(color: Colors.black,fontFamily: family, fontWeight: FontWeight.bold),),
                              )
                            ],
                          ),
                          SizedBox(width: 5,),
                          Stack(
                            children: [
                              Container(
                                height: 45,
                                width: 65,
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
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                            color: ivory,
                            borderRadius: BorderRadius.circular(40)
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add_circle, color: eirie,),
                              SizedBox(width: 5,),
                              Text('Add', style: TextStyle(color: eirie,
                              fontWeight: FontWeight.bold,
                              fontFamily: family,
                              fontSize: 20),),
                              SizedBox(width: 50,)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      GestureDetector(
                        onTap: ()=>Get.to(Transfer()),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                          decoration: BoxDecoration(
                              color: ivory,
                              borderRadius: BorderRadius.circular(40)
                          ),
                          child: Row(
                            children: [
                              Transform.rotate(
                                angle: 0.785390,
                                child: CustomPaint(
                                  size: Size(30, 30),
                                  painter: LongArrowPainter(),
                                ),
                              ),
                              Text('Send', style: TextStyle(color: eirie,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: family,
                                  fontSize: 20),),
                              SizedBox(width: 50,)

                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5,),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: backgroundColor),
                              color: Colors.transparent,
                            ),
                          ),
                          Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: backgroundColor,
                              ),
                              child: Icon(Icons.more_horiz,size: 22,)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Transactions', style: TextStyle(fontSize: 24,color: ivory,fontFamily: family),),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: backgroundColor,
                                child: Image.asset(
                                  Assets.imagesDribbble,
                                    color: ivory,
                                  height: 35,
                                )
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Dribbble',style: TextStyle(fontFamily: family, fontSize: 24,fontWeight: FontWeight.bold,color: ivory),),
                                  Text('Today, 16.40',style: TextStyle(fontFamily: family, fontSize: 22,color: Colors.white54),)
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('-\$120',style: TextStyle(fontFamily: family, fontSize: 24,fontWeight: FontWeight.bold,color: ivory),),
                              Text('Transfer',style: TextStyle(fontFamily: family, fontSize: 22,color: Colors.white54),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: backgroundColor,
                                child: Transform.rotate(
                                  angle: 0.785390*4,
                                  origin: Offset(0, 1.5),
                                  child: CustomPaint(
                                    size: Size(30, 30),
                                    painter: LongArrowPainter(color: ivory),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Indra Kawatir',style: TextStyle(fontFamily: family, fontSize: 24,fontWeight: FontWeight.bold,color: ivory),),
                                  Text('Yesterday, 12.10',style: TextStyle(fontFamily: family, fontSize: 22,color: Colors.white54),)
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('\$120',style: TextStyle(fontFamily: family, fontSize: 24,fontWeight: FontWeight.bold,color: ivory),),
                              Text('Income',style: TextStyle(fontFamily: family, fontSize: 22,color: Colors.white54),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 35,
                                backgroundColor: backgroundColor,
                                child: Transform.rotate(
                                  angle: 0.785390,
                                  origin: Offset(5, 2),
                                  child: CustomPaint(
                                    size: Size(30, 30),
                                    painter: LongArrowPainter(color: ivory),
                                  ),
                                ),
                              ),
                              SizedBox(width: 20,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Biowa Denon',style: TextStyle(fontFamily: family, fontSize: 24,fontWeight: FontWeight.bold,color: ivory),),
                                  Text('Friday, 7.50',style: TextStyle(fontFamily: family, fontSize: 22,color: Colors.white54),)
                                ],
                              )
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('-\$${NumberFormat("#,#00").format(1800)}',style: TextStyle(fontFamily: family, fontSize: 24,fontWeight: FontWeight.bold,color: ivory),),
                              Text('Transfer',style: TextStyle(fontFamily: family, fontSize: 22,color: Colors.white54),)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          );

        }
    );
  }
}

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
