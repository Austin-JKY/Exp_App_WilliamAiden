import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app_fi/core/utils/colors.dart';
import 'package:my_app_fi/core/utils/model/money_list.dart';
import 'package:my_app_fi/module/widget/home_head.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: CustomScrollView(
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
                  GestureDetector(
                    onTap: () {
                      context.go('/giraph');
                    },
                    child: Text(
                      "HISTORY",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "See More...",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {},
                    child: ListTile(
                      // selectedColor: Colors.amber,
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                            "assets/images/${getMoney()[index].image!}"),
                      ),
                      title: Text(
                        getMoney()[index].name!,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
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
                    ),
                  ),
                );
              },
              childCount: getMoney().length,
            ),
          ),
        ],
      )),
    );
  }
}
