import 'dart:ui';

import 'package:athijeevana/widgets/EnterNumberWidget.dart';
import 'package:athijeevana/widgets/NumberPad.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneNumber extends StatefulWidget {
  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  String number = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0x333333),
        elevation: 0,
        title: Text(
          'Continue with phone',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return SingleChildScrollView(child: portraitMode(context));
          } else {
            return SingleChildScrollView(child: landscapeMode(context));
          }
        },
      ),
    );
  }

  Widget portraitMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.5),
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/images/phone.png',
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          SizedBox(height: 17.5),
          Center(
            child: Text(
              'An OTP will be sent to verify the Mobile Number',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(height: 22.5),
          enterNum(number),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04,
          ),
          NumberPad(onNumSelect: (value) {
            setState(() {
              if (value != -1) {
                if (number.length != 10) {
                  number = number + value.toString();
                }
              } else {
                if (number.length != 0) {
                  number = number.substring(0, number.length - 1);
                }
              }
            });
          })
        ],
      ),
    );
  }

  Widget landscapeMode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.5),
      child: Container(
        child: Column(
          children: [
            enterNum(number),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(height: 17.5),
                    Image.asset(
                      'assets/images/phone.png',
                      width: MediaQuery.of(context).size.width * 0.40,
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        'You will recieve a 4 digit code to verify next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 12,
                      top: MediaQuery.of(context).size.height * 0.10,
                    ),
                    child: NumberPad(onNumSelect: (value) {
                      setState(() {
                        if (value != -1) {
                          if (number.length != 10) {
                            number = number + value.toString();
                          }
                        } else {
                          if (number.length != 0) {
                            number = number.substring(0, number.length - 1);
                          }
                        }
                      });
                    }),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
