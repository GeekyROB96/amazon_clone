import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';

MaterialPageRoute generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.arguments) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  AuthScreen()
        );

        default :
         return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen doesnot exist'),
          ),
        )
        );

      
  }
  
}
