import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main_app/constants.dart';
import 'package:main_app/components/search_bar.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text('Raste ka Maal Saste me',
              style: GoogleFonts.openSans(textStyle: kTopAppBarTextStyle)),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchBar());
              })
        ],
      ),
      body: ProductListDisplay(),
    );
  }
}

class ProductListDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List choices = const [
      const Choice(
          title: 'Pottery1',
          distance: 'distance1',
          description: 'Add sample text regarding to the category item here',
          imglink:
              'https://images.unsplash.com/photo-1493106641515-6b5631de4bb9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2036&q=80'),
      const Choice(
          title: 'Pottery2',
          distance: 'distance2',
          description: 'Add sample text regarding to the category item here',
          imglink:
              'https://images.unsplash.com/photo-1529690840038-f38da8894ff6?ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60'),
      const Choice(
          title: 'Pottery3',
          distance: 'distance3',
          description: 'Add sample text regarding to the category item here',
          imglink:
              'https://images.unsplash.com/photo-1507022787381-b30170b5ebf4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=600&q=60'),
      const Choice(
          title: 'Pottery4',
          distance: 'distance4',
          description: 'Add sample text regarding to the category item here',
          imglink:
              'https://www.outlookindia.com/outlooktraveller/resizer.php?src=https://www.outlookindia.com/outlooktraveller/public/uploads/articles/explore/header6.jpg&w=500&h=400'),
    ];

    return MaterialApp(
        home: new ListView(
            padding: const EdgeInsets.all(20.0),
            children: List.generate(choices.length, (index) {
              return Center(
                child: ChoiceCard(choice: choices[index], item: choices[index]),
              );
            })),
        debugShowCheckedModeBanner: false);
  }
}

class Choice {
  final String title;
  final String description;
  final String imglink;
  final String distance;

  const Choice({this.title, this.description, this.imglink, this.distance});
}

class ChoiceCard extends StatelessWidget {
  const ChoiceCard(
      {this.choice, this.onTap, @required this.item, this.selected: false});

  final Choice choice;

  final VoidCallback onTap;

  final Choice item;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.headline3;

    if (selected)
      textStyle = textStyle.copyWith(color: Colors.lightGreenAccent[400]);

    return Card(
        color: Colors.white,
        child: Column(
          children: [
            new Container(
                padding: const EdgeInsets.all(4.0),
                child: Image.network(choice.imglink)),
            new Container(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          choice.title,
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Text(
                        choice.distance,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      choice.description,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
          crossAxisAlignment: CrossAxisAlignment.start,
        ));
  }
}
