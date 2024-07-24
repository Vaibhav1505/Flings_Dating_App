import 'dart:async';

import 'package:flings_flutter/Practice/State%20Management/MulticlassProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiClassProviderPage extends StatefulWidget {
  const MultiClassProviderPage({super.key});

  @override
  State<MultiClassProviderPage> createState() => _MultiClassProviderPageState();
}

class _MultiClassProviderPageState extends State<MultiClassProviderPage> {
  @override
  void initState() {
    final provider = Provider.of<MulticlassProvider>(context, listen: false);
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      provider.incDoubleValue();
      print(provider.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Widget build ");

    final provider = Provider.of<MulticlassProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "<MulticlassProvider>",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<MulticlassProvider>(
              builder: (context, value, child) {
                return Text(value.value.toString());
              },
            ),
            Consumer<MulticlassProvider>(
              builder: (context, value, child) {
                return Text(
                    "Name from Multiclass Provider using Comsumer:${value.userKaNaam}");
              },
            )
          ],
        ),
      ),
    );
  }
}
