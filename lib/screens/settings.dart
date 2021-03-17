import 'package:comidas/components/main_drawer.dart';
import 'package:comidas/models/filters.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var filtros = Filtros();
  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filtros'),
      ),
      drawer: MainDrwaer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: AlignmentDirectional.topStart,
            child: Text(
              'Clique para usar os filtros',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  'Glutén',
                  'Apenas refeições sem glutén',
                  filtros.isGlutenFree,
                  (value) => setState(() => filtros.isGlutenFree = value),
                ),
                _createSwitch(
                  'Lactose',
                  'Apenas refeições sem lactose',
                  filtros.isLactoseFree,
                  (value) => setState(() => filtros.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana',
                  'Apenas refeições veganas',
                  filtros.isVegan,
                  (value) => setState(() => filtros.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana',
                  'Apenas refeições sem vegetariana',
                  filtros.isVegetarian,
                  (value) => setState(() => filtros.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
