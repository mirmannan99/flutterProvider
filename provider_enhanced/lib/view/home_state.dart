import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_enhanced/state/app_state.dart';
import 'package:provider_enhanced/widget/second_page.dart';

import '../widget/first_page.dart';

class HomeState extends StatelessWidget {
  const HomeState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appProvider = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          appProvider.updateWidget();
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Code With Mannan'),
      ),
      body: Consumer<AppState>(
        builder: (context, provider, child) {
          return provider.change ? SecondPage() : FirstPage();
        },
      ),
    );
  }
}
