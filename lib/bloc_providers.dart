import 'package:basic_code_for_any_project/app/di.dart';
import 'package:basic_code_for_any_project/presentation/bloc/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviders {
  static getProviders() => [
        BlocProvider(
          create: (context) => instance<AuthCubit>(),
        ),
      ];
}
