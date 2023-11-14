import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/core.dart';
import 'injection.dart';
import 'presentation/presentation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AuthCubit>(),
        ),
      ],
      child: MaterialApp(
        title: 'Internship challenge',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1FA0C9)),
          useMaterial3: true,
        ),
        initialRoute: AppRoute.initial,
        routes: AppRoute.routes,
      ),
    );
  }
}
