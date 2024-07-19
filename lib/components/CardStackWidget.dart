import 'package:flings_flutter/Themes/themes.dart';
import 'package:flings_flutter/components/IconOnpressed.dart';
import 'package:flings_flutter/components/SwipingCard.dart';
import 'package:flings_flutter/components/DragWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardStackWidget extends StatefulWidget {
  const CardStackWidget({super.key});

  @override
  State<CardStackWidget> createState() => _CardStackWidgetState();
}

class _CardStackWidgetState extends State<CardStackWidget>
    with SingleTickerProviderStateMixin {
  List<Profile> draggableItems = [
    Profile(
        imageAsset:
            "https://imgs.search.brave.com/hmpVxeNBRr7-witPzLbsmSGXK_PLGAd8N1QDZRGcNuQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9zdGF0/NS5ib2xseXdvb2Ro/dW5nYW1hLmluL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDE2LzAz/L05vcmEtRmF0ZWhp/LTEtMzQuanBn",
        distance: "30",
        userName: "Nora Fatehi"),
    Profile(
        imageAsset:
            "https://imgs.search.brave.com/nAgYPWrd8jIe-YIO1AI_hXZgAAYtzT_DMAEg6FMTcgE/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YmV5b3VuZy5pbi9i/ZXlvdW5naXN0YW4v/d3AtY29udGVudC91/cGxvYWRzLzIwMjMv/MDQvUHJpeWFua2Et/Q2hvcHJhLTcwOXgx/MDI0LmpwZw",
        distance: "30",
        userName: "Priyanka Chopra"),
    Profile(
        imageAsset:
            "https://imgs.search.brave.com/9EqauNpc5b54ez41eM4X8Bk2rswLn1SUbe9AzW4IqMY/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YmV5b3VuZy5pbi9i/ZXlvdW5naXN0YW4v/d3AtY29udGVudC91/cGxvYWRzLzIwMjMv/MDQvYmV5b3VuZ2lz/dGFuLWJsb2ctdG9w/LTUwLWFjdHJlc3Mt/NzA5eDEwMjQuanBn",
        distance: "30",
        userName: "Katrina Kaif"),
    Profile(
        imageAsset:
            "https://imgs.search.brave.com/kAQv0Q_NLBmXDrMBtVr1c0kiPaSg_P2okkD58NGU0KU/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly95MjBp/bmRpYS5pbi93cC1j/b250ZW50L3VwbG9h/ZHMvMjAyNC8wNS9T/aHJhZGRoYS1LYXBv/b3IuYXZpZg",
        distance: "30",
        userName: "Shradhha Kapoor"),
    Profile(
        imageAsset:
            "https://imgs.search.brave.com/NfRV-J2irA4JK1djwPAdd1cPCsBRoxKl_B3SozvAYwY/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly91cGxv/YWQud2lraW1lZGlh/Lm9yZy93aWtpcGVk/aWEvY29tbW9ucy9m/L2Y1L01ydW5hbF9U/aGFrdXJfYXRfU2l0/YV9SYW1hbV90cmFp/bGVyX2xhdW5jaF8o/MSkuanBn",
        distance: "30",
        userName: "Mrunal Thakur"),
  ];

  ValueNotifier<Swipe> swipeNotifier = ValueNotifier(Swipe.none);
  late final AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        draggableItems.removeLast();
        _animationController.reset();

        swipeNotifier.value = Swipe.none;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(clipBehavior: Clip.none, children: [
      ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ValueListenableBuilder(
              valueListenable: swipeNotifier,
              builder: (context, swipe, _) => Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: List.generate(draggableItems.length, (index) {
                    if (index == draggableItems.length - 1) {
                      return PositionedTransition(
                        rect: RelativeRectTween(
                                begin: RelativeRect.fromSize(
                                    const Rect.fromLTWH(0, 0, 580, 340),
                                    const Size(580, 340)),
                                end: RelativeRect.fromSize(
                                    Rect.fromLTWH(
                                        swipe != Swipe.none
                                            ? swipe == Swipe.left
                                                ? -300
                                                : 300
                                            : 0,
                                        0,
                                        580,
                                        340),
                                    const Size(580, 340)))
                            .animate(CurvedAnimation(
                          parent: _animationController,
                          curve: Curves.easeInOut,
                        )),
                        child: RotationTransition(
                          turns: Tween<double>(
                                  begin: 0,
                                  end: swipe != Swipe.none
                                      ? swipe == Swipe.left
                                          ? -0.1 * 0.3
                                          : 0.1 * 0.3
                                      : 0.0)
                              .animate(
                            CurvedAnimation(
                              parent: _animationController,
                              curve: const Interval(0, 0.4,
                                  curve: Curves.easeInOut),
                            ),
                          ),
                          child: DragWidget(
                            profile: draggableItems[index],
                            index: index,
                            swipeNotifier: swipeNotifier,
                            isLastCard: true,
                          ),
                        ),
                      );
                    } else {
                      return DragWidget(
                        profile: draggableItems[index],
                        index: index,
                        swipeNotifier: swipeNotifier,
                      );
                    }
                  })))),
      Positioned(
        bottom: 10,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.only(top: 46.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconOnpressed(
                buttonColor: MyTheme.fadedGrey,
                radius: 15,
                onpressed: () {
                  swipeNotifier.value = Swipe.left;
                  _animationController.forward();
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 20),
              IconOnpressed(
                radius: 15,
                buttonColor: MyTheme.fadedGrey,
                onpressed: () {
                  swipeNotifier.value = Swipe.right;
                  _animationController.forward();
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: 0,
        child: DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return IgnorePointer(
              child: Container(
                height: 700.0,
                width: 80.0,
                color: Colors.transparent,
              ),
            );
          },
          onAccept: (int index) {
            setState(() {
              draggableItems.removeAt(index);
            });
          },
        ),
      ),
      Positioned(
        right: 0,
        child: DragTarget<int>(
          builder: (
            BuildContext context,
            List<dynamic> accepted,
            List<dynamic> rejected,
          ) {
            return IgnorePointer(
              child: Container(
                height: 700.0,
                width: 80.0,
                color: Colors.transparent,
              ),
            );
          },
          onAccept: (int index) {
            setState(() {
              draggableItems.removeAt(index);
            });
          },
        ),
      ),
    ]);
  }
}
