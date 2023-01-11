import 'package:flutter/material.dart';
import 'package:inherited_notifier/slider_notifier.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final sliderdata = SliderData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SliderNotifier(
        sliderData: sliderdata,
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Slider(
                  value: SliderNotifier.of(context),
                  onChanged: (value) {
                    sliderdata.value = value;
                  },
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: SliderNotifier.of(context),
                      child: Container(
                        color: Colors.yellow,
                        height: 200,
                      ),
                    ),
                    Opacity(
                      opacity: SliderNotifier.of(context),
                      child: Container(
                        color: Colors.blue,
                        height: 200,
                      ),
                    )
                  ].expandEqually().toList(),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

extension ExpandEqually on Iterable<Widget> {
  Iterable<Widget> expandEqually() => map((w) => Expanded(child: w));
}
