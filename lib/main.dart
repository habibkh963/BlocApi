import 'package:blocapi/bloc/add_dellete_post_bloc.dart';
import 'package:blocapi/bloc/get_and_update_post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Data/DataProviders.dart';
import 'MyHomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DataProviders(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GetAndUpdatePostBloc>(
            create: (context) =>
                GetAndUpdatePostBloc(context.read<DataProviders>()),
          ),
          BlocProvider(
            create: (context) =>
                AddDelletePostBloc(context.read<DataProviders>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
