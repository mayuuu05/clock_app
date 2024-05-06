import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StrapWatch extends StatefulWidget {
  const StrapWatch({super.key});

  @override
  State<StrapWatch> createState() => _StrapWatchState();
}

class _StrapWatchState extends State<StrapWatch> {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        dateTime = DateTime.now();

        switch (dateTime.weekday) {
          case 1:
            day = 'Mon';
            break;
          case 2:
            day = 'Tue';
            break;
          case 3:
            day = 'Wed';
            break;
          case 4:
            day = 'Thu';
            break;
          case 5:
            day = 'Fri';
            break;
          case 6:
            day = 'Sat';
            break;
          case 7:
            day = 'Sun';
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
        title: Text('StrapWatch',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
        actions: [
          Icon(Icons.more_vert,size: 35,)
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 70,
                left: 50
            ),
            child: Text(
              'Do not watch the clock,do what it does keep going',
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 40,
                  letterSpacing: 3,
                  color: Colors.black),
            ),
          ),
           Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  value: dateTime.second / 60,
                  valueColor: AlwaysStoppedAnimation(Color(0xff30353C)),
                  backgroundColor: Colors.black12,
                  strokeWidth: 5,

                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                height: 250,
                width: 250,
                child: CircularProgressIndicator(
                  value: dateTime.minute / 60,
                  valueColor: AlwaysStoppedAnimation(Color(0xff30353C)),
                  backgroundColor: Colors.black12,
                  strokeWidth: 10,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                height: 200,
                width: 200,
                child: CircularProgressIndicator(
                  value: ((dateTime.hour % 12 + dateTime.minute / 60) / 12),
                  backgroundColor: Colors.black12,
                  valueColor: AlwaysStoppedAnimation(Color(0xff30353C)),
                  strokeWidth: 20,
                ),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 150),
                    child: Row(
                      children: [
                        Text(
                          '${dateTime.hour % 12}:${dateTime.minute}:${dateTime.second} ',
                          style: TextStyle(
                              color: Color(0xff30353C),
                              fontWeight: FontWeight.w500,
                              fontSize: 30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                          ),
                          child: Text(
                            '$time',
                            style: TextStyle(
                                color :Color(0xff30353C),
                                fontWeight: FontWeight.w400,
                                fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '$month ${dateTime.day} $day',
                    style: TextStyle(
                        color :Color(0xff30353C),
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 50
            ),
            child: Row(
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
                  Container(
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
                ]),
          )
        ],
      ),
    ));
  }
}

DateTime dateTime = DateTime.now();

String day = '';

String time = '';
String month = '';