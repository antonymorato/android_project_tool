import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'utils/parse_xml.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool os = true;
  bool fb = true;
  bool signing = true;
  @override
  void initState() {
    super.initState();
    // readFileAsync();
  }

  String pathToProject;
  String packageName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Container(
        alignment: Alignment.topLeft,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Icon(Icons.directions_rounded),
                          labelText: 'path in format: C:\\src\\myProj'),
                      onChanged: (path) => pathToProject = path,
                    ),
                  ),
                  FlatButton(
                      color: Theme.of(context).colorScheme.primary,
                      onPressed: () {
                        ParseXml.readFileAsync();
                      },
                      child: Text(
                        'Check',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ))
                ],
              ),
              Row(children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Icon(Icons.text_fields),
                        labelText: 'package in format: com.example.my_proj'),
                    onChanged: (package) => packageName = package,
                  ),
                ),
                FlatButton(
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {},
                  child: Text(
                    'Check',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ]),
              // Row(
              //   children: [

              //   ],
              // ),
              Row(
                children: [
                  Column(
                    children: [
                      Text('OS'),
                      Checkbox(
                        value: os,
                        onChanged: (value) {
                          setState(() {
                            os = value;
                          });
                        },
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Text('FB'),
                      Checkbox(
                        value: fb,
                        onChanged: (value) {
                          setState(() {
                            fb = value;
                          });
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text('Signing'),
                          Checkbox(
                            value: signing,
                            onChanged: (value) {
                              setState(() {
                                signing = value;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
