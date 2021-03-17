import 'package:comidas/data/dummy_data.dart';
import 'package:comidas/models/filters.dart';
import 'package:comidas/screens/categories_meals_screen.dart';
import 'package:comidas/screens/meal_detail_screen.dart';
import 'package:comidas/screens/settings.dart';
import 'package:comidas/screens/tabs_screen.dart';
import 'package:comidas/utils/app_routes.dart';
import 'package:flutter/material.dart';

import 'models/meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Filtros filtros = Filtros();
  List<Meal> _avaiableMeals = DUMMY_MEALS;
  void _filtrodeComidas(Filtros filtros) {
    setState(() {
      this.filtros = filtros;
      _avaiableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = filtros.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = filtros.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = filtros.isVegan && !meal.isVegan;
        final filterVegetarian = filtros.isVegetarian && !meal.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos cozinhar?',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
              ))),
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_avaiableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(filtros, _filtrodeComidas),
      },
    );
  }
}
