import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class EnvironmentConfig {
  static const APP_NAME = String.fromEnvironment('HELLOWORLD_APP_NAME',
      defaultValue: 'awesomeDefault');
  static const APP_SUFFIX = String.fromEnvironment('HELLOWORLD_APP_SUFFIX');
  static const APP_ICON = String.fromEnvironment('HELLOWORLD_APP_ICON');
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'You defined ENV variables like',
              style: Theme.of(context).textTheme.headline5,
            ),
            Text(
              'APP_NAME: ${EnvironmentConfig.APP_NAME}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              'APP_SUFFIX: ${EnvironmentConfig.APP_SUFFIX}',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Package Name',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  FutureBuilder<PackageInfo>(
                      future: PackageInfo.fromPlatform(),
                      builder: (context, value) {
                        if (!value.hasData) {
                          return Container();
                        }

                        return Text(
                          value.data!.packageName,
                          style: Theme.of(context).textTheme.headline6,
                        );
                      }),
                ],
              ),
            ),
            // Image.asset(
            //     "android/app/main/res/mipmap-hdpi/${EnvironmentConfig.APP_ICON}.png"),
          ],
        ),
      ),
    );
  }
}
