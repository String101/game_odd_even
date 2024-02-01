import 'package:flutter/material.dart';
import 'package:game_odd_even/Game.dart';
import 'package:game_odd_even/view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => viewModel(),
    builder: (context, child) {
      return const MaterialApp(
        home: Game(),
      );
    },
    );
  }
}