import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SellPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SellForm());
  }
}

class SellForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SellFormState();
  }
}

class SellFormState extends State<SellForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, top: 16.0, right: 8.0, bottom: 8.0),
                child: TextFormField(
                  controller: TextEditingController(),
                  autocorrect: true,
                  decoration: InputDecoration(
                    labelText: 'Enter your Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                  validator: (name) {
                    if (name.isEmpty) return 'Please enter a valid name';
                    return null;
                  },
                ),
              ),
            ),
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Enter your Mobile Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  validator: (mob) {
                    if (mob.isEmpty)
                      return 'Please enter a valid Mobile Number';
                    return null;
                  },
                ),
              ),
            ),
            Container(
              width: 400.0,
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 0, right: 8, top: 8, bottom: 8),
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
                            if (name.isEmpty)
                              return 'Please enter a product name';
                            return null;
                          },
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
                    if (desc.isEmpty)
                      return 'Please enter a a product description';
                    return null;
                  },
                ),
              ),
            ),
            Container(
  width: 400.0,
  child: Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter the shop name',
        prefixIcon: Icon(Icons.business_outlined),
        border: OutlineInputBorder(),
      ),
      validator: (desc) {
        if (desc.isEmpty) return 'Please enter a valid shop name';
        return null;
      },
    ),
  ),
),
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter the shop address',
                    prefixIcon: Icon(Icons.add_shopping_cart),
                    border: OutlineInputBorder(),
                  ),
                  validator: (desc) {
                    if (desc.isEmpty) return 'Please enter a valid address';
                    return null;
                  },
                ),
              ),
            ),
            Container(
              width: 400.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, right: 8, bottom: 8),
                        child: Container(
                          child: TextFormField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Enter City',
                              border: OutlineInputBorder(),
                            ),
                            validator: (name) {
                              if (name.isEmpty)
                                return 'Please enter a city name';
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        child: Container(
                          child: TextFormField(
                            autocorrect: true,
                            decoration: InputDecoration(
                              labelText: 'Enter the State',
                              border: OutlineInputBorder(),
                            ),
                            validator: (name) {
                              if (name.isEmpty)
                                return 'Please enter a valid state';
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Sahi hai bhai data!')));
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
  String dropdownValue = 'Choose Category';

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
