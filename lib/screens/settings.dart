import 'package:comidas/components/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrwaer(),
      body: Center(
        child: Text('Configurações'),
      ),
    );
  }
}