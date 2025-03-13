import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 116, 39),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to this app',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 208, 214, 219),
              ),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[500],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/quiz');
              },
              child: Text('Start game'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[500],
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 20),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Usage rights'),
                      content: Text(
                        'This video is by [naturalsteponline](https://www.youtube.com/watch?v=FFCNCQleCuk&ab_channel=naturalsteponline) and is used under the Creative Commons Attribution 4.0 License (CC BY 4.0)',
                        textAlign: TextAlign.right,
                      ),
                      actions: [
                        TextButton(
                          child: Text('Okay!'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Rights'),
            ),
          ],
        ),
      ),
    );
  }
}
