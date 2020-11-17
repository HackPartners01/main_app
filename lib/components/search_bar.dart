import 'package:flutter/material.dart';

class SearchBar extends SearchDelegate<String> {
  // TODO: Replace this list with actual product list stored on database
  final productList = [
    'shampoo',
    'pottery',
    'Handicrafts',
    'bedsheets',
  ];

  final recentSearch = [
    'bedsheets',
    'Handicrafts',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO : Products Page/Results page
    return Text('Result');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      final suggestionList = recentSearch;
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.history),
          title: Text(suggestionList[index]),
          onTap: () {
            showResults(context);
          },
        ),
        itemCount: suggestionList.length,
      );
    } else {
      final suggestionList =
          productList.where((p) => p.startsWith(query)).toList();
      // TODO : Edit the display of suggestion list based on updated styling
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.search),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].substring(0, query.length),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          onTap: () {
            showResults(context);
          },
        ),
        itemCount: suggestionList.length,
      );
    }
  }
}
