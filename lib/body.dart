import 'package:flutter/material.dart';

import 'package:t_shoes/shoe.dart';
import 'package:t_shoes/popular_shoe.dart';
import 'package:t_shoes/provider.dart';
import 'package:provider/provider.dart';

final GlobalKey<FormState> _inputKey = GlobalKey();
final GlobalKey<ScaffoldState> _key = GlobalKey();
final textController = TextEditingController();

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(builder: (context, taskProvider, child) {
      return Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.025),
            width: MediaQuery.of(context).size.width * 0.95,
            decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.white38),
                borderRadius: BorderRadius.circular(80)),
            child: TextField(
                key: _inputKey,
                controller: textController,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(22, 12, 0, 12),
                  isDense: true,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    color: Colors.white38,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'font',
                  ),
                )),
          ),
          const SizedBox(
            height: 60,
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: taskProvider.sections.length,
                  itemBuilder: (context, index) {
                    List section = taskProvider.sections[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: Container(
                              margin: EdgeInsets.only(left: 15),
                              child: Text(
                                taskProvider.sectionsTitles[index],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontFamily: 'font',
                                    fontWeight: FontWeight.w600),
                              ),
                            )),
                        SizedBox(
                          height: 25,
                        ),
                        Container(
                            height: 300,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.05),
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: section.length,
                                itemBuilder: (context, index2) {
                                  return Row(children: [
                                    if (index == 0) ...[
                                      PopularShoe(shoe: section[index2]),
                                    ] else ...[
                                      Shoe(shoe: section[index2])
                                    ],
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    )
                                  ]);
                                }))
                      ],
                    );
                  })),
        ],
      );
    });
  }
}
