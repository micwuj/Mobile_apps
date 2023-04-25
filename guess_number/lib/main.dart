import 'package:flutter/material.dart';
import 'package:guess_number/gueses.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _numberController = TextEditingController();
  final List<Gueses> gueses = [];
  int rand = Random().nextInt(100);
  int val = 0;
  int iterator = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Guess a number'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.green, width: 1.0),
                      ),
                      border: OutlineInputBorder(),
                      labelText: 'Guess a number',
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      textStyle: const TextStyle(
                      fontWeight: FontWeight.bold)),
                    onPressed: isPressed
                        ? null
                        : () {
                            val = int.tryParse(_numberController.text) ?? 0;
                            iterator += 1;
                            setState(() {
                              gueses.add(Gueses(
                                id: iterator,
                                number:
                                    int.tryParse(_numberController.text) ?? 0,
                                hint: (val > rand)
                                    ? 'Too much!'
                                    : (val < rand)
                                        ? 'Too low!'
                                        : 'Got it!',
                              ));
                            });
                            (val == rand) ? isPressed = true : null;
                            _numberController.clear();
                          },
                    child: const Text('Try'),
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 6,
            child: Container(
              color: Colors.green,
              width: double.infinity,
              height: 30,
              child: const Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: const Text(
                  'Attempts',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
          ...gueses.reversed.map((g) {
            return Card(
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 2,
                      ),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      '${g.number}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('${g.hint}'),
                      ),
                    ],
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}
