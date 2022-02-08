import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

mixin CubitHelper<B extends BlocBase<S>, S> {
  Widget observe({
    required BlocWidgetBuilder<S> builder,
    BlocBuilderCondition<S>? buildWhen,
  }) {
    return BlocBuilder<B, S>(
      builder: builder,
      buildWhen: buildWhen,
    );
  }

  Widget listen({
    required BlocWidgetListener<S> listener,
    BlocListenerCondition<S>? listenWhen,
    Widget? child,
  }) {
    return BlocListener<B, S>(
      listener: listener,
      listenWhen: listenWhen,
      child: child,
    );
  }

  B? cubit(BuildContext context, {bool listen = false}) {
    return BlocProvider.of<B>(context, listen: listen);
  }
}
