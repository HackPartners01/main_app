import 'package:flutter/material.dart';
import 'package:main_app/data_models/seller.dart';
import 'package:main_app/data_models/product.dart';

class SellPage2 extends StatelessWidget {
  static Seller seller;

  SellPage2(Seller sellerInfo) {
    seller = sellerInfo;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SellForm2());
  }
}

class SellForm2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SellForm2State();
  }
}

class SellForm2State extends State<SellForm2> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _product = Product();

    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
                child: Row(
                  children: [
                    CategoryDropdown(),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Enter product name',
                              prefixIcon: Icon(Icons.drive_file_rename_outline),
                              border: OutlineInputBorder(),
                            ),
                            validator: (name) {
                              if (name.isEmpty) return 'Please enter a product name';
                              return null;
                            },
                            onSaved: (val) => _product.name = val //TODO
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 3,
                    decoration: InputDecoration(
                      labelText: 'Enter the product description',
                      border: OutlineInputBorder(),
                    ),
                    validator: (desc) {
                      if (desc.isEmpty) return 'Please enter  a product description';
                      return null;
                    },
                    onSaved: (val) => _product.description = val //TODO
                    ),
              ),
            ),
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter the product price',
                      prefixIcon: Icon(Icons.money),
                      border: OutlineInputBorder(),
                    ),
                    validator: (desc) {
                      if (desc.isEmpty) return 'Please enter the price';
                      return null;
                    },
                    onSaved: (val) => _product.price = int.parse(val) //TODO
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  final form = _formKey.currentState;
                  if (form.validate()) {
                    form.save();
                    _product.sellerId = SellPage2.seller.id;
                    _product.save();
                    Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text(
                            'Product ${_product.name} added successfully to seller ${SellPage2.seller.name}\'\ account')));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryDropdown extends StatefulWidget {
  CategoryDropdown({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<CategoryDropdown> {
  static String dropdownValue = 'Choose Category';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: dropdownValue,
        elevation: 16,
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Choose Category',
          'Category1',
          'Category2',
          'Category3',
          'Category4'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
