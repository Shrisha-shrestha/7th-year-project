import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/exporter.dart';

class CookBook extends StatelessWidget {
  const CookBook({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecipeView();
  }
}
