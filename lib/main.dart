import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:blocs_app/config/config.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  serviceLocatorInit();
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UsernameCubit>(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => getIt<RouterSimpleCubit>(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => getIt<CounterCubit>(),
          lazy: true,
        ),
        BlocProvider(
          create: (context) => getIt<ThemeCubit>(),
          lazy: true,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final appRouterContent = context.read<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouterContent,
      theme: AppTheme( isDarkmode: theme.isDarkmode ).getTheme(),
    );
  }
}
