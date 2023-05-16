import 'package:checkers/home_screen.dart';
import 'package:checkers/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => TodoProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.pink,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        darkTheme: ThemeData(brightness: Brightness.dark),
        home: const HomeScreen(todo: {},),
      ),
    );
  }
}

/* Define API => ( Application Programme Interface) - An API is a way for two or more
*  computer programs to communicate with each other. I t is a type of software interface
*  offering a service to other pieces of software .
*
*  What does API contain => They contain data programmes or in my own terms methods that
*  a developer will consume into the application they are building. One can either use
*  any of the readily available APIs available that'll help them achieve what
* they want in their app or create their own API that curates to the need of their app
*
*  How does API work => API has methods that carry out certain fuctions that makes an Api an API
*
* There are many methods but the most commonly used are;
* 1. Post - Create API resource
* 2. Get - Retrieve info about API resource
* 3. Put - Update a API resource
* 4. Delete - Delete API resource or related component
* 5. Patch - Update a API
*   Others are,
* */