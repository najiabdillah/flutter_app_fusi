import 'package:flutter/material.dart';
import 'package:flutter_app_fusi/bloc/app_bloc.dart';
import 'package:flutter_app_fusi/bloc/provider.dart';

void main() {
  final appBloc = AppBloc();
  runApp(MyApp(appBloc));
}

class MyApp extends StatelessWidget {
  final AppBloc bloc;

  MyApp(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Provider(
        bloc: bloc,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: MyHomePage(title: 'Flutter'),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context).counterBloc;
    final evenBloc = Provider.of(context).evenCounterBloc;
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(title: Text('Result 1')),
            StreamBuilder(
                stream: evenBloc.counter$,
                builder: (context, snapshot) => snapshot.hasData
                    ? Text('${snapshot.data}',
                    style: Theme.of(context).textTheme.display1)
                    : CircularProgressIndicator()),
            ListTile(title: Text('Result 2')),
            StreamBuilder(
                stream: bloc.counter$,
                builder: (context, snapshot) => snapshot.hasData
                    ? Text('${snapshot.data}',
                    style: Theme.of(context).textTheme.display1)
                    : CircularProgressIndicator()),
            RaisedButton(
              child: Text(" 1 "),
              onPressed: () => bloc.increment.add(null),
              color: Color(0xffFF1744),
              textColor: Colors.white,
              splashColor: Colors.grey,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),

            RaisedButton(
              child: Text(" 2 "),
              onPressed: () => bloc.increment.add(null),
              color: Color(0xff0091EA),
              textColor: Colors.white,
              splashColor: Colors.grey,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),

            ),

            RaisedButton(
              child: Text(" 3 "),
              onPressed: () => bloc.increment.add(null),
              color: Color(0xff1B5E20),
              textColor: Colors.white,
              splashColor: Colors.grey,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
            RaisedButton(
              child: Text(" 4 "),
              onPressed: () => bloc.increment.add(null),
              color: Color(0xff1B5E20),
              textColor: Colors.white,
              splashColor: Colors.grey,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),

          ],

        ),
      ),



    );
  }
}
