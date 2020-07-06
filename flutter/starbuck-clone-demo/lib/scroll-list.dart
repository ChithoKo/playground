import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter 101',
        // home: Scaffold(

        //   appBar: AppBar(
        //     title: Text('Flutter getting started'),
        //   ),
        //   body: Center(
        //     child: RandomWords(),
        //   ),
        // ));
        home: RandomWords()
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Scroller'),
      ),
      body: _buildList(),
    );
  }

  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider(color: Colors.grey[50],);

        final index = i ~/ 2;

        if (index >= _suggestions.length) {
          _suggestions.addAll(generateWordPairs().take(10));
        }

        return _buildRow(_suggestions[index]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    final subTitle = WordPair.random();
    final List<IconData> iconsList = <IconData>[Icons.favorite, Icons.account_box, Icons.audiotrack, Icons.beach_access];
    // final List colors = [Colors.pink, Colors.blue, Colors.grey, Colors.green];
    final Random r = new Random();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[100],
      ),
      child: Center(
        child: ListTile(
          leading: Icon(
            iconsList[r.nextInt(iconsList.length)],
            size: 56.0,
            color: Color(r.nextInt(0xFFFFFFFF))
            // color: colors[r.nextInt(colors.length)],
          ),
          title: Text(
            pair.asPascalCase,
            style: _biggerFont,
          ),
          subtitle: Text(subTitle.asPascalCase),
          trailing: Icon(Icons.more_vert),
        )
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}