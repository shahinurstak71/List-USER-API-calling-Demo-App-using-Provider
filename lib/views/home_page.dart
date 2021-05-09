import 'package:ecom_ui/models/requis_api_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _provider = Provider.of<UserModel>(context, listen: false);
    //var apiValue = _provider.data;
    // print(apiValue);
    return Scaffold(
        appBar: AppBar(
          title: Text('API CALLING'),
          centerTitle: true,
        ),
        body: Center(
            child: _provider.data == null
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: _provider.data.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Image.network(_provider.data[0].avatar),
                          Text(_provider.data[0].email),
                          Text(_provider.data[0].firstName),
                          Text(_provider.data[0].lastName),
                          Text(_provider.data[0].id.toString()),
                        ],
                      );
                    })));
  }
}
