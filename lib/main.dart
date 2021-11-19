import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> names = List.generate(60, (i) => 'Name: $i');
  ScrollController _scrollController = ScrollController();
  bool isShowFABExtend = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if(_scrollController.offset > 50) {
        isShowFABExtend = true;
      } else {
        isShowFABExtend = false;
      }

      setState(() { });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Gmail Animation with FAB'),
          backgroundColor: Colors.redAccent,
        ),
        body: ListView.builder(
          controller: _scrollController,
          itemCount: names.length,
          itemBuilder: (_,i) => Text( names[i] ),
        ),
        floatingActionButton: !isShowFABExtend
          ? AnimatedContainer(
            duration: Duration( milliseconds: 100 ),
            curve: Curves.linear,
            width: 150,
            height: 50,
            child: FloatingActionButton.extended(
              onPressed: () {}, 
              label: Text('Compose', style: TextStyle(color: Colors.black)),
              icon: Icon(Icons.edit_outlined, color: Colors.black),
              backgroundColor: Colors.blue.shade100,
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
            ),
          )
          : AnimatedContainer(
            duration: Duration( milliseconds: 100 ),
            curve: Curves.linear,
            width: 50,
            height: 50,
            child: FloatingActionButton.extended(
              icon: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Icon(Icons.edit_outlined, color: Colors.black),
              ),
              backgroundColor: Colors.blue.shade100,
              label: SizedBox(),
              onPressed: (){},
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15)),
            ),
          ),
      ),
    );
  }
}