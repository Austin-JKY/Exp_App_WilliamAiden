import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:my_app_fi/core/utils/colors.dart';
import 'package:my_app_fi/core/utils/model/add_data.dart';
import 'package:my_app_fi/core/utils/model/money_list.dart';
import 'package:my_app_fi/module/widget/home_head.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var history;
  final box = Hive.box<Add_data>('data');
  final List<String> day = [
    'Monday',
    "Tuesday",
    "Wednesday",
    "Thursday",
    'friday',
    'saturday',
    'sunday'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (BuildContext context, Box<Add_data> value, Widget? child) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(height: 260, child: homehead(context)),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "HISTORY",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See More...",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    history = box.values.toList()[index];
                    return getList(history, index);
                  },
                  childCount: box.length,
                ),
              ),
            ],
          );
        },
      )),
    );
  }

  Widget getList(Add_data history, int index) {
    return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          history.delete();
        },
        child: get(index, history));
  }

  Container get(int index, Add_data history) {
    // var day;
    return Container(
      margin: EdgeInsets.all(5),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          // selectedColor: Colors.amber,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              "assets/images/images.png",
            ),
          ),
          title: Text(
            history.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Text(
            "${history.amount}K",
            style: TextStyle(
                color: conColor, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            '${day[history.datetime.weekday - 1]}  ${history.datetime.year}-${history.datetime.day}-${history.datetime.month}',
            style: TextStyle(
              fontSize: 13,
              color: history.IN == 'InCome' ? homeBody : Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
