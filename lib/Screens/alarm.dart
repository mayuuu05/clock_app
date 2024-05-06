import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Alarm extends StatefulWidget {
  const Alarm({super.key});

  @override
  State<Alarm> createState() => _AlarmState();
}

class _AlarmState extends State<Alarm> {
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
    return SafeArea(child: Scaffold(
      backgroundColor:  Color(0xffA4AAB6),
      appBar: AppBar(
        backgroundColor: Color(0xffA4AAB6),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop('/');
          },
            child: Icon(Icons.arrow_back,size: 30,)),
        title: Text('Alaram',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          Icon(Icons.more_vert,size: 35,)
        ],
      ),
      body:  Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 780,
              width: 400,
              // color: Colors.black38,
              alignment: Alignment.topCenter,
              child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: 70,
                          left: 70
                      ),
                      child: Text(
                        '    Wake up,\nchase dreams',
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            fontSize: 40,
                            letterSpacing: 3,
                            color: Colors.black),
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
                              endIndent: 250,
                              indent: 510,
                              thickness: 3.5,
                            )
                                : const VerticalDivider(
                              endIndent: 340,
                              indent: 500,
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
                          indent: 330,
                          endIndent: 390,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: (dateTime.second * 6 * pi) / 180,
                        child: VerticalDivider(
                          thickness: 2 + 0.5,
                          color: Color(0xffB7BCC2),
                          indent: 290,
                          endIndent: 390,
                        ),
                      ),
                    ),
                    Center(
                      child: Transform.rotate(
                        angle: (dateTime.minute * 6 * pi) / 180,
                        child: VerticalDivider(
                          thickness: 4,
                          color: Color(0xffB7BCC2),
                          indent: 290,
                          endIndent: 390,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 570,
                        left: 30
                      ),
                      width: 350,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          const Text(
                            '11:11',
                            style: TextStyle(
                              color: Color(0xff30353C),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Text(
                            '  pm',
                            style: TextStyle(
                              color: Color(0xff30353C),
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 50,
                            height: 19,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 4,
                                  top: 2,
                                  child: Container(
                                    width: 39,
                                    height: 13,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 26,
                                  top: 0,
                                  child: Container(
                                    width: 17,
                                    height: 17,
                                    decoration: const ShapeDecoration(
                                      color: Color(0xff30353C),
                                      shape: OvalBorder(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 640,
                          left: 30
                      ),
                      width: 350,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          const Text(
                            '3:30',
                            style: TextStyle(
                              color: Color(0xff30353C),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Text(
                            '  pm',
                            style: TextStyle(
                              color: Color(0xff30353C),
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 50,
                            height: 19,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 4,
                                  top: 2,
                                  child: Container(
                                    width: 39,
                                    height: 13,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xff30353C),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: 710,
                          left: 30
                      ),
                      width: 350,
                      height: 60,
                      decoration: ShapeDecoration(
                        color: Colors.black26,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20,),
                          const Text(
                            '5:00',
                            style: TextStyle(
                              color: Color(0xff30353C),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          const Text(
                            '  am',
                            style: TextStyle(
                              color: Color(0xff30353C),
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              height: 0,
                            ),
                          ),
                          Spacer(),
                          SizedBox(
                            width: 50,
                            height: 19,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 4,
                                  top: 2,
                                  child: Container(
                                    width: 39,
                                    height: 13,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 17,
                                  height: 17,
                                  decoration: const ShapeDecoration(
                                    color: Color(0xff30353C),
                                    shape: OvalBorder(),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/');
                  },
                  child: Container(
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
                ),
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
    ));
  }
}


DateTime dateTime = DateTime.now();

String day = '';

String time = '';
String month = '';