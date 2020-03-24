import 'package:first_app/screens/location_detail/location_detail.dart';
import 'package:flutter/material.dart';
import 'screens/locations/locations.dart';
import 'style.dart';

//É uma boa deixar as rotas definidas dessa forma em constantes
const LocationsRoute = "/";
const LocationDetailRoute = "/location_detail";

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      home: Locations(),
      /*
      //Essa é uma forma de fazer rotas para o app
      initialRoute: "/",
      routes: {
        "/": (context) => FirstScreen(),
        "/second": (context) => LocationDetail(1),
      },
      */
      theme: _theme(),        
    );
  }

  RouteFactory _routes(){
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationsRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments["id"]);
          break;
        default:
          return null;  
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }

  ThemeData _theme(){
    return ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(title: AppBarTextStyle),
        ),
        textTheme: TextTheme(
          title: TitleTextStyle, 
          body1: Body1TextStyle,
        ));
  }
}