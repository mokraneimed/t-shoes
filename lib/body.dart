import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:t_shoes/shoe.dart';
import 'package:t_shoes/popular_shoe.dart';
import 'package:t_shoes/provider.dart';
import 'package:provider/provider.dart';
import 'package:t_shoes/second_router.dart';

GlobalKey<FormState> _inputKey = GlobalKey();
GlobalKey<ScaffoldState> _key = GlobalKey();
var textController = TextEditingController();
late bool firstRun;
ScrollController _scrollController = ScrollController();
List<bool> slides = [true, true, false];
int duration = 500;

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<Body> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  int slideValue = 0;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(changeSelector);
  }

  changeSelector() {
    var maxScrollVal = _scrollController.position.maxScrollExtent;

    var divisor = (maxScrollVal / slides.length) + 30;

    var scrollValue = _scrollController.offset.round();
    var slideValue = (scrollValue / divisor).round();

    if (slides[slideValue] == false) {
      setState(() {
        slides[slideValue] = true;
        firstRun = false;
      });
    }

    // var currentSlide = allSlides.indexWhere((slide) => slide['selected']);
  }

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
                  primary: false,
                  controller: _scrollController,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: taskProvider.sections.length,
                  itemBuilder: (context, index) {
                    List section = taskProvider.sections[index];
                    if (slides[2] == false) {
                      firstRun = taskProvider.firstrun;
                    }
                    if (firstRun) {
                      _controller = AnimationController(
                          duration: Duration(milliseconds: duration),
                          vsync: this);
                      _animation =
                          Tween(begin: 0.0, end: 1.0).animate(_controller);

                      _controller.forward();
                      duration = duration + 500;
                      @override
                      void dispose() {
                        _controller.dispose();
                        super.dispose();
                      }
                    }
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
                            child: (index <= 1)
                                ? (firstRun)
                                    ? FadeTransition(
                                        opacity: _animation,
                                        child: Container(
                                            height: MediaQuery.of(context)
                                                .size
                                                .height,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                shrinkWrap: true,
                                                itemCount: section.length,
                                                itemBuilder: (context, index2) {
                                                  return Row(children: [
                                                    GestureDetector(
                                                        onTap: () {
                                                          firstRun = false;
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        SecondRouter(
                                                                          shoe:
                                                                              section[index2],
                                                                          sectionTitle:
                                                                              taskProvider.sectionsTitles[index],
                                                                        )),
                                                          );
                                                        },
                                                        child: (index == 0)
                                                            ? PopularShoe(
                                                                shoe: section[
                                                                    index2],
                                                                sectionTitle:
                                                                    taskProvider
                                                                            .sectionsTitles[
                                                                        index],
                                                              )
                                                            : Shoe(
                                                                shoe: section[
                                                                    index2],
                                                                sectionTitle:
                                                                    taskProvider
                                                                            .sectionsTitles[
                                                                        index],
                                                              )),
                                                    SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.1,
                                                    )
                                                  ]);
                                                })),
                                      )
                                    : Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: section.length,
                                            itemBuilder: (context, index2) {
                                              return Row(children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    SecondRouter(
                                                                      shoe: section[
                                                                          index2],
                                                                      sectionTitle:
                                                                          taskProvider
                                                                              .sectionsTitles[index],
                                                                    )),
                                                      );
                                                    },
                                                    child: (index == 0)
                                                        ? PopularShoe(
                                                            shoe:
                                                                section[index2],
                                                            sectionTitle:
                                                                taskProvider
                                                                        .sectionsTitles[
                                                                    index],
                                                          )
                                                        : Shoe(
                                                            shoe:
                                                                section[index2],
                                                            sectionTitle:
                                                                taskProvider
                                                                        .sectionsTitles[
                                                                    index],
                                                          )),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                )
                                              ]);
                                            }))
                                : AnimatedCrossFade(
                                    duration: Duration(seconds: 1),
                                    firstChild: Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: section.length,
                                            itemBuilder: (context, index2) {
                                              return Row(children: [
                                                GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    SecondRouter(
                                                                      shoe: section[
                                                                          index2],
                                                                      sectionTitle:
                                                                          taskProvider
                                                                              .sectionsTitles[index],
                                                                    )),
                                                      );
                                                    },
                                                    child: (index == 0)
                                                        ? PopularShoe(
                                                            shoe:
                                                                section[index2],
                                                            sectionTitle:
                                                                taskProvider
                                                                        .sectionsTitles[
                                                                    index],
                                                          )
                                                        : Shoe(
                                                            shoe:
                                                                section[index2],
                                                            sectionTitle:
                                                                taskProvider
                                                                        .sectionsTitles[
                                                                    index],
                                                          )),
                                                SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.1,
                                                )
                                              ]);
                                            })),
                                    secondChild: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height:
                                          MediaQuery.of(context).size.height,
                                      color: Colors.transparent,
                                    ),
                                    crossFadeState: slides[index]
                                        ? CrossFadeState.showFirst
                                        : CrossFadeState.showSecond))
                      ],
                    );
                  })),
        ],
      );
    });
  }
}
