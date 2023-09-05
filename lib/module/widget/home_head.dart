import 'package:flutter/material.dart';
import 'package:my_app_fi/core/utils/colors.dart';

Widget homehead(context) {
  var size = MediaQuery.of(context).size;
  return Stack(children: [
    Column(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.2,
          child: const Stack(
            children: [
              Positioned(
                  top: 20,
                  right: 15,
                  child: Icon(
                    Icons.notification_add_outlined,
                    color: Colors.black,
                    size: 25,
                  )),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello',
                      style: TextStyle(
                          color: homeBody,
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                    Text(
                      '''This App Can Be Help 
Your Managment''',
                      style: TextStyle(color: homeBody, fontSize: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    ),
    Positioned(
      top: 100,
      right: 0,
      left: 0,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        width: size.width,
        height: size.height * 0.2,
        decoration: const BoxDecoration(color: homeBody),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: size.width,
            margin: const EdgeInsets.all(10),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Balance",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Colors.white,
                  size: 25,
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Text(
              "100,00.00 K",
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 30),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_circle_down_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "Income",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 40, top: 30),
                child: const Row(
                  children: [
                    Icon(
                      Icons.arrow_circle_up_outlined,
                      color: Colors.white,
                      size: 20,
                    ),
                    Text(
                      "Expenses",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                  left: 22,
                ),
                child: Row(
                  children: [
                    Text(
                      "100,0 K",
                      style: TextStyle(
                        fontSize: 15,
                        color: field,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 65,
                ),
                child: Row(
                  children: [
                    Text(
                      "100,0 K",
                      style: TextStyle(
                        fontSize: 15,
                        color: field,
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      ),
    )
  ]);
}
