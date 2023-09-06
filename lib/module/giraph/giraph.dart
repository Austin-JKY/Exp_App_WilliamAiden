import 'package:flutter/material.dart';
import 'package:my_app_fi/core/utils/colors.dart';

class Giraph extends StatefulWidget {
  const Giraph({super.key});

  @override
  State<Giraph> createState() => _GiraphState();
}

class _GiraphState extends State<Giraph> {
  @override
  Widget build(BuildContext context) {
    List day = ['Day', 'Week', 'Month', 'Year'];
    int index_color = 0;
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "GIRAPH",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...List.generate(4, (int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            index_color = index;
                            print(index_color);
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.all(7),
                          width: 75,
                          height: 35,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color:
                                index_color == index ? homeBody : Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            day[index],
                            style: TextStyle(
                              color: index_color == index
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 150,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: homeBody),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Down",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Icon(
                          Icons.arrow_downward_outlined,
                          size: 20,
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
