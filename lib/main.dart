import 'package:flutter/material.dart';
import 'package:proto_calculator/result_model.dart';
import 'package:provider/provider.dart';

import 'consts.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ResultModel(),
      child: const MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double width = 0.0;
  double height = 0.0;

  double result = 123;

  @override
  Widget build(BuildContext context) {
    if (width == 0.0) {
      final size = MediaQuery.of(context).size;
      width = size.width;
      height = size.height;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 结果区域
          Container(
            height: 168,
            width: width,
            color: const Color.fromARGB(255, 248, 248, 248),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Consumer<ResultModel>(builder: (context, result, child) {
                      return Text(
                        result.result.toString(),
                        style: resultTextStyle,
                      );
                    }),
                    const SizedBox(
                      width: 42,
                    )
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          // 数字键盘区域
          SizedBox(
            height: height - fixHeight,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                KeyBoardRow(['7', '8', '9', '×']),
                KeyBoardRow(['4', '5', '6', '÷']),
                KeyBoardRow(['1', '2', '3', '-']),
                KeyBoardRow(['0', '=', '+']),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class KeyBoardRow extends StatelessWidget {
  final List<String> keys;

  const KeyBoardRow(this.keys, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        if (keys.length == 3)
          const Text(
            '  ',
            style: keyboardTextStyle,
          ),
        Text(
          keys[0],
          style: keyboardTextStyle,
        ),
        Text(
          keys[1],
          style: keyboardTextStyle,
        ),
        Text(
          keys[2],
          style: keyboardTextStyle,
        ),
        if (keys.length > 3)
          Text(
            keys[3],
            style: keyboardTextStyle,
          )
      ],
    );
  }
}
