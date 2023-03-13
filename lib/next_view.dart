import 'package:flutter/material.dart';

import 'button.dart';

class NextView extends StatelessWidget {
  const NextView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                width: double.maxFinite,
                height: 600,
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Take a pick!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    //ButtonView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
