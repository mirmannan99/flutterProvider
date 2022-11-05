import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providor_learn_2/providers/second_page_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ChangeNotifierProvider<SecondPageProvider>(
            create: (context) => SecondPageProvider(),
            child: Consumer<SecondPageProvider>(
              builder: (context, provider, child) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You Pushed This button',
                    style: TextStyle(
                      fontSize: 20,
                      color: provider.counter == 0
                          ? Colors.transparent
                          : Colors.green,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    provider.counter.toString(),
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.increment();
                    },
                    child: Text(
                      'Increment',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.decrement();
                    },
                    child: Text(
                      'Decrement',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
