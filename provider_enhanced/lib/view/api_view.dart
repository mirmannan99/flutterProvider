import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/data_model.dart';
import '../state/app_state.dart';
import '../util/data_util.dart';

class ApiView extends StatelessWidget {
  const ApiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<AppState>(
      builder: (context, provider, child) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () async {
              List<DataModel> data = await DataUtil().getData();
              provider.updateDataModel(data);
            },
          ),
          appBar: CupertinoNavigationBar(
            middle: Text('Fetching APi'),
          ),
          body: Container(
            height: size.height - CupertinoNavigationBar().preferredSize.height,
            width: size.width,
            child: provider.dataList.isEmpty
                ? Center(
                    child: const Text(
                      "There is no data",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      //! index : returns every items that we call in it
                      return ListTile(
                        title: Text("${provider.dataList[index].title}"),
                        subtitle: Text("${provider.dataList[index].body}"),
                        leading: Text("${provider.dataList[index].id}"),
                      );
                    },
                    itemCount: provider.dataList.length,
                  ),
          ),
        );
      },
    );
  }
}
