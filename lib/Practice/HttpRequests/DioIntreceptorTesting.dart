import 'package:dio/dio.dart';
import 'package:flings_flutter/services/dioInterceptor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DemoInterceptor extends StatelessWidget {
  const DemoInterceptor({super.key});

  @override
  Widget build(BuildContext context) {
    DemoDIO() {
      final Dio _dio;
       _dio = Dio();
      _dio.interceptors.add(DioInterceptor());
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  print("FIrst Button");
                },
                child: Text("Login")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  print("FIrst Button");
                },
                child: Text("Store Token")),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: () {
                  print("Clear Token");
                },
                child: Text("Login")),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
