import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'constants.dart';
import 'generated/assets.dart';
import 'transfer.dart';

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