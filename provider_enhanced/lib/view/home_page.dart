import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_enhanced/state/app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //! create instance of provider

  @override
  Widget build(BuildContext context) {
    //? 1st way
    // AppState provider = Provider.of<AppState>(context);

    //? 2nd way for single widget not the whole app
    return Scaffold(
      appBar: AppBar(
        title: const Text('code with Mannan'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Center(
          //   child: Text(
          //     'Provider Value from whole page level ${provider.temp}',  //! global for the page
          //     style: const TextStyle(
          //       color: Colors.red,
          //       fontSize: 25,
          //     ),
          //   ),
          // ),
          Consumer<AppState>(builder: (context, providerValue, child) {
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Provider value in case of target single widget\n\n ${providerValue.name}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.lightBlue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    color: Colors.green,
                    child: const Text('press me'),
                    onPressed: () {
                      // providerValue.updateTemp(200);

                      // providerValue.getTimer();

                      providerValue.getName("Abdul Mannan");
                    },
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
