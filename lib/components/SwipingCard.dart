import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile {
  String userName;
  String distance;
  String imageAsset;

  Profile(
      {required this.imageAsset,
      required this.distance,
      required this.userName});
}

class SwipingCard extends StatelessWidget {
  Profile profile;

  SwipingCard({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      width: 350,
      padding: EdgeInsets.symmetric(vertical: 50),
      child: Stack(
        children: [
          Positioned.fill(
              child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Image.network(
              profile.imageAsset,
              fit: BoxFit.fitHeight,
            ),
          )),
          Positioned(
              bottom: 0,
              child: Container(
                height: 80,
                width: 350,
                decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadows: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 8,
                      ),
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        profile.userName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 20),
                      ),
                      Text(
                        "${profile.distance}km away",
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
