
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({super.key});

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      backgroundColor:  Color(0xffA4AAB6),
      appBar: AppBar(
        backgroundColor: Color(0xffA4AAB6),
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop('/');
            },
            child: Icon(Icons.arrow_back,size: 30,)),
        title: Text('Timer',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
        actions: [
          Icon(Icons.more_vert,size: 35,)
        ],
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 100, bottom: 100),
                height: 300,
                width: 300,
                child: CircularProgressIndicator(
                  value: 0,
                  valueColor: AlwaysStoppedAnimation(Color(0xff30353C)),
                  backgroundColor: Colors.black12,
                  strokeWidth: 20,

                ),
              ),
              Container(
                child: Text(
                  '00:00:00 ',
                  style: TextStyle(
                      color: Color(0xff30353C),
                      fontWeight: FontWeight.w500,
                      fontSize: 40),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                  backgroundColor: Color(0xff30353C),
                  onPressed: () {},
                  child: Icon(
                    Icons.play_arrow,
                    size: 40,
                    color:Colors.white70,
                  )),
              SizedBox(
                width: 200,
              ),
              FloatingActionButton(
                  backgroundColor: Color(0xff30353C),
                  onPressed: () {},
                  child: Icon(
                    Icons.pause,
                    size: 40,
                    color:Colors.white70,
                  )),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          FloatingActionButton(

              backgroundColor: Color(0xff30353C),
              onPressed: () {},
              child: Icon(
                Icons.restart_alt,
                size: 40,
                color:Colors.white70,
              )),
          Padding(
            padding: const EdgeInsets.only(
                top: 150
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
                  Container(
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
                ]),
          )
        ],
      ),
    ));
  }
}

