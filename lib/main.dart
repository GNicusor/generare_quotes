import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String postUrl = "https://api.kanye.rest/";
  String quote = "Random quote";

  generateQuotes () async {
    var res = await http.get(Uri.parse(postUrl));
    var result = jsonDecode(res.body);
    var quoteValue = result['quote'];
    print(result);
    setState(() {
      quote = quoteValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quotes generated")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(quote),
            SizedBox(height: 70,),
            ElevatedButton(
                onPressed: (){
                  generateQuotes();
                },
                child: Text('Generate'))
          ],
        ),
      ),
    );
  }
}
