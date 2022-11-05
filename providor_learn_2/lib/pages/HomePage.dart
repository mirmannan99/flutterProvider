import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providor_learn_2/providers/home_page_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: ChangeNotifierProvider<HomePageProvider>(
            //! creates instance of home page provider for us to use
            create: (context) => HomePageProvider(),
            child:
                Consumer<HomePageProvider>(builder: (context, provider, child) {
              //! consumes the provider
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    provider.eligibilityMessage.toString(),
                    style: TextStyle(
                        color: (provider.isEligible == true)
                            ? Colors.green
                            : Colors.red),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your age',
                    ),
                    onChanged: (val) {
                      provider.checkEligibility(int.parse(val));
                    },
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
