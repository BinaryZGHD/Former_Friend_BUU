import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyApp898989 extends StatefulWidget {
  const MyApp898989({Key? key}) : super(key: key);

  @override
  State<MyApp898989> createState() => _MyApp898989State();
}

class _MyApp898989State extends State<MyApp898989> {
  @override
  Widget build(BuildContext context) {
    const title = 'Grid List88';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: Column(
          children: [
            Container(
              width: 100,
              height: 100,
            ),
            Expanded(
              child: GridView.count(
                shrinkWrap: true,
                // Create a grid with 2 columns. If you change the scrollDirection to
                // horizontal, this produces 2 rows.
                crossAxisCount: 2,
                // Generate 100 widgets that display their index in the List.
                children: List.generate(7, (index) {
                  return Card(
                    child: Container(
                      child: Center(
                        child: Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}