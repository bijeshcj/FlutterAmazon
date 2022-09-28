import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings){
   return MaterialPageRoute(builder: (_) => const Scaffold(
     body: Center(
       child: Text('Screen does not exist'),
     ),
   ));
}