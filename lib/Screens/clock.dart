import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();

        switch (dateTime.weekday) {
          case 1:
            day = 'Monday';
            break;
          case 2:
            day = 'Tuesday';
            break;
          case 3:
            day = 'Wednesday';
            break;
          case 4:
            day = 'Thursday';
            break;
          case 5:
            day = 'Friday';
            break;
          case 6:
            day = 'Saturday';
            break;
          case 7:
            day = 'Sunday';
        }

        switch (dateTime.month) {
          case 1:
            month = 'January';
            break;
          case 2:
            month = 'February';
            break;
          case 3:
            month = 'March';
            break;
          case 4:
            month = 'April';
            break;
          case 5:
            month = 'May';
            break;
          case 6:
            month = 'June';
            break;
          case 7:
            month = 'July';
            break;
          case 8:
            month = 'August';
            break;
          case 9:
            month = 'September';
            break;
          case 10:
            month = 'October';
            break;
          case 11:
            month = 'November';
            break;
          case 12:
            month = 'December';
            break;
        }

        if (dateTime.hour > 11) {
          time = 'PM';
        } else {
          time = 'AM';
        }
      });
    });
    return SafeArea(
        child: Scaffold(
          backgroundColor:  Color(0xffA4AAB6),
          body: Column(
            children: [
             SingleChildScrollView(
               scrollDirection: Axis.horizontal,
               physics: BouncingScrollPhysics(),
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                   children: [
                     Container(
                       height: 840,
                       width: 432,
                       // color: Colors.black38,
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.menu,size: 30,),
                              Icon(Icons.more_vert,size: 40,),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 100,
                                left: 120
                            ),
                            child: Column(
                              children: [
                                Text(
                                  'Gujarat',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 50,
                                      letterSpacing: 3,
                                      color: Colors.black),
                                ),
                                Text(
                                  'India',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 35,
                                    letterSpacing: 2,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                            height: 300,
                            width: 300,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: RadialGradient(colors: [
                                  Color(0xff4e5359),
                                  Color(0xff4e5359),
                                  Color(0xff30353C),
                                  Color(0xff30353C),
                                  Color(0xff4e5359),
                                  Color(0xff4e5359),
                                ]),
                                border: Border.all(color: Color(0xff30353C), width: 10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0xff30353C),
                                      offset: Offset(10, 0),
                                      spreadRadius: 2,
                                      blurRadius: 20)
                                ]),
                              alignment: Alignment.center,
                                                    ),
                          ),
                          Center(
                            child: Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff191E24),
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffB7BCC2),
                              ),
                            ),
                          ),
                          ...List.generate(
                            60,
                                (index) => Center(
                                  child: Transform.rotate(
                                      angle: ((index + 1) * 6 * pi) / 180,
                                      child: ((index + 1) % 15 == 0)
                                          ? const VerticalDivider(
                                        color: Colors.white,
                                        endIndent: 278,
                                        indent: 540,
                                        thickness: 3.5,
                                      )
                                          : const VerticalDivider(
                                        endIndent: 321,
                                        indent: 650,
                                        thickness: 2,
                                      )),
                                ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: dateTime.hour % 12 * 30 * pi / 180,
                              child: VerticalDivider(
                                thickness: 5 + 0.5,
                                color: Color(0xffB7BCC2),
                                indent: 350,
                                endIndent: 415,
                              ),
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: (dateTime.second * 6 * pi) / 180,
                              child: VerticalDivider(
                                thickness: 2 + 0.5,
                                color: Color(0xffB7BCC2),
                                indent: 320,
                                endIndent: 415,
                              ),
                            ),
                          ),
                          Center(
                            child: Transform.rotate(
                              angle: (dateTime.minute * 6 * pi) / 180,
                              child: VerticalDivider(
                                thickness: 4,
                                color: Color(0xffB7BCC2),
                                indent: 320,
                                endIndent: 415,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: 600,
                                    left: 80
                                ),
                                height: 150,
                                width: 280,
                                decoration: BoxDecoration(
                                    color:  Color(0xff30353C),
                                    borderRadius: BorderRadius.circular(30)
                                ),
                                child: Container(
                                  child:  Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 30,left: 65),
                                        child: Row(
                                          children: [
                                            Text(
                                              '${dateTime.hour % 12}:${dateTime.minute}:${dateTime.second} ',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 35),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Text(
                                                '$time',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 25),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        '$day , $month ${dateTime.day}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 40,left: 75),
                                height: 15,
                                width: 100,
                                // color: Colors.white10,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 10,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(5)),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    Container(
                                      height: 10,
                                      width: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        ]
                      ),
                     ),
                     SizedBox(
                       width: 10,
                     ),



                   ],
                 ),
               ),
             ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/alarm');
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xff30353C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.alarm,
                            color: Color(0xffB7BCC2),
                            size: 35,
                          )),
                    ),
                    Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color(0xff30353C),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.watch_later_outlined,
                          color: Color(0xffB7BCC2),
                          size: 35,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/strap');
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xff30353C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.timelapse,
                            color: Color(0xffB7BCC2),
                            size: 35,
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/timer');
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color(0xff30353C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Icon(
                            Icons.timer_outlined,
                            color: Color(0xffB7BCC2),
                            size: 35,
                          )),
                    ),
                  ])
            ],
          ),
        ),);
  }
}


DateTime dateTime = DateTime.now();

String day = '';

String time = '';
String month = '';