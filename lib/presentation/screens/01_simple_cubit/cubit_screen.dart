import 'package:blocs_app/config/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/blocs.dart';


class CubitScreen extends StatelessWidget {
  const CubitScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //final usernameCubit = context.watch<UsernameCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit'),
      ),
      body: Center(
        child: BlocBuilder<UsernameCubit, String>(
          buildWhen: (previous, current) => previous != current,
          builder: (context, state) {
            return Text(
              state,
              style: Theme.of(context).textTheme.bodyLarge,
            );
          },
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          context.read<UsernameCubit>().changeUsername(
            RandomGenerator.getRandomName()
          );
          // usernameCubit.changeUsername(
          //   RandomGenerator.getRandomName()
          // );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}