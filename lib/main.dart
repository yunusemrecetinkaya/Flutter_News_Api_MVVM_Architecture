import 'package:flutter/material.dart';
import 'package:flutter_news_api/view_model/news_list_view_model.dart';
import 'package:provider/provider.dart';

import 'view/new_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NewsListViewModel())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: NewsHome(),
      ),
    );
  }
}
