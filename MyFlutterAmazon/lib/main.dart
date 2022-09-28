import 'dart:js';

import 'package:flutter/material.dart';
import 'package:myflutteramazon/constants/global_variable.dart';
import 'package:myflutteramazon/providers/user_provider.dart';
import 'package:myflutteramazon/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserProvider()),
  ],child: const MyApp(),));
}

class MyApp extends StatefulWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp>{


  @override
  Widget build(BuildContext context) {
   return  MaterialApp(debugShowCheckedModeBanner: false,
     title: 'Amazon clone',
     theme: ThemeData(
       scaffoldBackgroundColor: GlobalVariables.backgroundColor,
       colorScheme: const ColorScheme.light(
         primary: GlobalVariables.secondaryColor
       ),
       appBarTheme: const AppBarTheme(
         elevation: 0,
         iconTheme: IconThemeData(
           color: Colors.black,
         )
       ),
       useMaterial3: true,
     ),
     onGenerateRoute: (settings)=> generateRoute(settings),
     home: Provider.of<UserProvider>(context).user.token.isNotEmpty?
          Provider.of<UserProvider>(context).user.type == 'user'? const BottomBar(): const AdminScreen():
      const AuthScreen(),
   );
  }


}


