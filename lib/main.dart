import 'package:flutter/material.dart';
import 'package:flutter_dapp_wallet/widgets/slider.dart';
import 'package:http/http.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:web3dart/web3dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Wallet',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Client httpClient;
  late Web3Client web3client;
  bool data = false;
  double myAmount = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Vx.gray300,
      body: ZStack([
        VxBox()
            .blue600
            .size(context.screenWidth, context.percentHeight * 30)
            .make(),
        VStack([
          (context.percentHeight * 10).heightBox,
          widget.title.text.xl4.white.bold.center.makeCentered().py16(),
          (context.percentHeight * 5).heightBox,
          VxBox(
            child: VStack([
              "Balance".text.gray700.xl2.semiBold.makeCentered(),
              10.heightBox,
              data
                  ? "\$1".text.bold.xl6.makeCentered()
                  : CircularProgressIndicator().centered()
            ]),
          )
              .p16
              .white
              .size(context.screenWidth, context.percentHeight * 18)
              .rounded
              .shadowXl
              .make()
              .p16(),
          30.heightBox,
          SliderWidget(
            min: 0,
            max: 100,
            finalValue: (value) {
              myAmount = (value * 100);
              print(myAmount);
            },
          ).centered(),
          HStack(
            [
              FlatButton.icon(
                onPressed: () {},
                color: Colors.blue,
                shape: Vx.roundedSm,
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
                label: "Refresh".text.white.make(),
              ).h(50),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.green,
                shape: Vx.roundedSm,
                icon: const Icon(
                  Icons.call_made_outlined,
                  color: Colors.white,
                ),
                label: "Deposit".text.white.make(),
              ).h(50),
              FlatButton.icon(
                onPressed: () {},
                color: Colors.red,
                shape: Vx.roundedSm,
                icon: const Icon(
                  Icons.call_received_outlined,
                  color: Colors.white,
                ),
                label: "Withdraw".text.white.make(),
              ).h(50),
            ],
            alignment: MainAxisAlignment.spaceAround,
            axisSize: MainAxisSize.max,
          ).p16(),
        ])
      ]),
    );
  }
}
