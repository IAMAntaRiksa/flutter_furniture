import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ecom/bloc/product_bloc.dart';
import 'package:flutter_ecom/ui/screen/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        canvasColor: Colors.grey.shade200,
      ),
      home: MultiBlocProvider(providers: [
        BlocProvider<ProductBloc>(create: (context) => ProductBloc())
      ], child: const HomeScreen()),
    );
  }
}
