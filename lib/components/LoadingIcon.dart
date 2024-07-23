import 'package:flings_flutter/routes/imageURL.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingIcon extends StatefulWidget {
  const LoadingIcon({super.key});

  @override
  State<LoadingIcon> createState() => LogoFadeState();
}

class LogoFadeState extends State<LoadingIcon> {
  double opacityLevel = 1.0;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    // TODO: implement initState
    print("Loading Icon Executed");
    super.initState();
    _changeOpacity();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: const Duration(seconds: 3),
      child: SvgPicture.asset(
        APP_LOGO_FILLED,
        height: 100,
        width: 100,
      ),
    );
  }
}
