import 'package:flutter/material.dart';

import 'package:main_app/data.dart';
import 'package:main_app/data_models/product.dart';
import 'package:main_app/screens/product_page.dart';

class SearchBar extends SearchDelegate<String> {
  // TODO: Store this recentSearch list on users device
  List<Product> recentSearch = [];
  Product searchProduct;

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
    if (!recentSearch.contains(searchProduct)) recentSearch.add(searchProduct);
    return ProductPage(product: searchProduct, showAppBar: false);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) {
      final suggestionList = recentSearch;
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.history),
          title: Text(suggestionList[index].name),
          onTap: () {
            searchProduct = suggestionList[index];
            showResults(context);
          },
        ),
        itemCount: suggestionList.length,
      );
    } else {
      final suggestionList =
          data.productList.where((p) => p.name.startsWith(query)).toList();
      return ListView.builder(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(Icons.search),
          title: RichText(
            text: TextSpan(
              text: suggestionList[index].name.substring(0, query.length),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].name.substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
          onTap: () {
            searchProduct = suggestionList[index];
            showResults(context);
          },
        ),
        itemCount: suggestionList.length,
      );
    }
  }
}
