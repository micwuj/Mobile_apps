// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _urlController = TextEditingController();
//   String _response = '';
//   int _counter = 0;

//   Future<void> _incrementCounterDelayed() async {
//     await Future.delayed(Duration(seconds: 5));
//     setState(() {
//       _counter++;
//     });
//   }

//   Future<void> _fetchData() async {
//     setState(() {
//       _response = 'Loading...';
//     });
//     try {
//       final response = await http.get(Uri.parse(_urlController.text));
//       if (response.statusCode == 200) {
//         setState(() {
//           _response = 'Length of response: ${response.body.length}';
//         });
//       } else {
//         setState(() {
//           _response = 'Request failed with status: ${response.statusCode}';
//         });
//       }
//     } catch (error) {
//       setState(() {
//         _response = 'Error: $error';
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _urlController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: TextField(
//               controller: _urlController,
//               decoration: const InputDecoration(
//                 labelText: 'Enter a URL',
//                 hintText: 'URL',
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () async {
//               await _fetchData();
//             },
//             child: Text('Fetch data'),
//           ),
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Text(_response),
//           ),
//           SizedBox(height: 20),
//           ElevatedButton(
//             onPressed: () {
//               _incrementCounterDelayed();
//             },
//             child: Text('Increase count in 5 seconds'),
//           ),
//           SizedBox(height: 10),
//           Text('Count: $_counter'),
//         ],
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final TextEditingController _urlController = TextEditingController();
  String _response = '';
  int counter = 0;

  Future<void> _incrementCounter() async {
    await Future.delayed(Duration(seconds: 5));
    setState(() {
      counter++;
    });
  }

  Future<void> _fetchData() async {
    try {
      final response = await http.get(Uri.https(_urlController.text, ''));
      if (response.statusCode == 200) {
        setState(() {
          _response = 'Response length: ${response.body.length}';
        });
      } else {
        setState(() {
          _response = 'Request failed. Status: ${response.statusCode}';
        });
      }
    } catch (error) {
      setState(() {
        _response = 'Error: $error';
      });
    }
  }

  @override
  void dispose() {
    _urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: _urlController,
              decoration: const InputDecoration(
                labelText: 'URL',
                hintText: 'URL',                
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _fetchData();
            },
            child: const Text('GO'),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(_response),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _incrementCounter();
              },
              child: const Text('Increment count in 5s.'),
            ),
          ),
          const SizedBox(height: 20),
          Text('Count: $counter'),
        ],
      ),
    );
  }
}