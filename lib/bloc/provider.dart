import 'package:flutter/material.dart';

import 'package:flutter_app_fusi/bloc/app_bloc.dart';

class Provider extends InheritedWidget {
  final AppBloc bloc;

  Provider({Key key, this.bloc, child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static AppBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
}
