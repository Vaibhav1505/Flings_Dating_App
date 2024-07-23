import 'package:flings_flutter/components/ProfileCard.dart';
import 'package:flings_flutter/components/SwipingCard.dart';
import 'package:flings_flutter/components/Tag.dart';
import 'package:flutter/material.dart';

//UNSERSTAND THIS FILE AGAIN BECAUSE SO MANY THINGS DOES NOT DONE BY SELF....SOME THINGS ARE COPIED

enum Swipe { left, right, none }

class DragWidget extends StatefulWidget {
  int index;
  Profile profile;
  final ValueNotifier<Swipe> swipeNotifier;
  final bool isLastCard;

  DragWidget(
      {super.key,
      required this.profile,
      required this.index,
      required this.swipeNotifier,
      this.isLastCard = false});

  @override
  State<DragWidget> createState() => _DragWidgetState();
}

class _DragWidgetState extends State<DragWidget> {
  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Draggable<int>(
        data: widget.index,
        feedback: Material(
          color: Colors.transparent,
          child: ValueListenableBuilder(
            valueListenable: swipeNotifier,
            builder: (context, swipe, _) {
              return RotationTransition(
                turns: swipe != Swipe.none
                    ? swipe == Swipe.left
                        ? const AlwaysStoppedAnimation(-15 / 360)
                        : const AlwaysStoppedAnimation(15 / 360)
                    : const AlwaysStoppedAnimation(0),
                child: Stack(children: [
                  SwipingCard(profile: widget.profile),
                  swipe != Swipe.none
                      ? swipe == Swipe.right
                          ? Positioned(
                              top: 40,
                              left: 20,
                              child: Transform.rotate(
                                angle: 15,
                                child: Tag(

                                    //CHANGING

                                    TagIcon: Icon(Icons.favorite),
                                    TagColor: Colors.green),
                              ))
                          : Positioned(
                              top: 50,
                              right: 24,
                              child: Transform.rotate(
                                angle: -12,
                                child: Tag(
                                  //CHANGING

                                  TagIcon: Icon(Icons.close),
                                  TagColor: Colors.teal,
                                ),
                              ))
                      : const SizedBox.shrink(),
                ]),
              );
            },
          ),
        ),
        onDragUpdate: (DragUpdateDetails dragUpdateDetails) {
          if (dragUpdateDetails.delta.dx > 0 &&
              dragUpdateDetails.globalPosition.dx >
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.right;
          }
          if (dragUpdateDetails.delta.dx < 0 &&
              dragUpdateDetails.globalPosition.dx <
                  MediaQuery.of(context).size.width / 2) {
            widget.swipeNotifier.value = Swipe.left;
          }
        },
        onDragEnd: (drag) {
          widget.swipeNotifier.value = Swipe.none;
        },
        childWhenDragging: Container(
          color: Colors.transparent,
        ),
        child: (ValueListenableBuilder(
          valueListenable: widget.swipeNotifier,
          builder: (BuildContext context, Swipe swipe, Widget? child) {
            return Stack(
              children: [
                SwipingCard(profile: widget.profile),
                swipe != Swipe.none && widget.isLastCard
                    ? swipe == Swipe.right
                        ? Positioned(
                            top: 40,
                            left: 20,
                            child: Transform.rotate(
                              angle: 12,
                              child: Tag(
                                TagIcon: Icon(Icons.favorite),
                                TagColor: Colors.grey[400]!,
                              ),
                            ),
                          )
                        : Positioned(
                            top: 50,
                            right: 24,
                            child: Transform.rotate(
                              angle: -12,
                              child: Tag(
                                TagIcon: Icon(Icons.close),
                                TagColor: Colors.blue,
                              ),
                            ),
                          )
                    : const SizedBox.shrink(),
              ],
            );
          },
        )),
      ),
    );
  }
}
