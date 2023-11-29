import 'package:flutter/material.dart';

class ReceitasPage extends StatefulWidget {
  final String title;
  const ReceitasPage({Key? key, this.title = 'ReceitasPage'}) : super(key: key);
  @override
  ReceitasPageState createState() => ReceitasPageState();
}
class ReceitasPageState extends State<ReceitasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}