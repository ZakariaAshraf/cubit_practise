import 'package:cubit_practise/cubit/users_cubit.dart';
import 'package:cubit_practise/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: const MaterialApp(
        home: HomePage(),
        title: 'Flutter Cubit Practise',
      ),
    );
  }
}


