import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notable',
          style: TextStyle(fontFamily: 'Satisfy', fontSize: 32),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('notes').listenable(),
        builder: (context, notes, _) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: kIsWeb ? 4 : 2),
                 itemCount: notes.length,
            itemBuilder: (context, index) {
              return GridTile(child: Text(data));
            },          
          );
        },
      ),
    );
  }
}
