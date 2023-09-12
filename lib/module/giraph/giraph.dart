import 'package:flutter/material.dart';
import 'package:my_app_fi/core/utils/colors.dart';
import 'package:my_app_fi/core/utils/model/money_list.dart';
import 'package:my_app_fi/module/giraph/chart.dart';

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
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "GIRAPH",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
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
                          margin: const EdgeInsets.all(7),
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
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: homeBody),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Row(
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Chart(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const Row(
                    children: [
                      Text(
                        "TOP SPENDING",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/images/${getMoney()[index].image!}",
                      ),
                    ),
                    trailing: Text(
                      "${getMoney()[index].fee!} K",
                      style: TextStyle(
                          color: conColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      getMoney()[index].time!,
                      style: TextStyle(
                        fontSize: 13,
                        color: homeBody,
                      ),
                    ),
                  );
                },
                childCount: getMoney().length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
