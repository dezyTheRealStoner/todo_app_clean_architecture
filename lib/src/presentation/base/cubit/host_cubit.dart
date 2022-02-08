import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_clean_acrhitechture/src/di/di.dart';

class HostCubit<T extends BlocBase> extends StatelessWidget {
  const HostCubit({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>(
      create: (_) => getIt.get(),
      child: child,
    );
  }
}
