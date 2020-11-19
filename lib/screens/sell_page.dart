import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:main_app/data_models/seller.dart';
import 'package:main_app/screens/sell_page_part2.dart';
import 'package:main_app/data_models/product.dart ';


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
  final _sellerinfo = Seller();
  final _product = Product();
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
                  onSaved: (val)=>
                      setState(() => _sellerinfo.name = val ),//TODO
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
                  onSaved: (val)=>
                      setState(() => _sellerinfo.contact = int.parse(val)),//TODO
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
                  onSaved: (val)=>
                      setState(() => _sellerinfo.shopName = val ),//TODO
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
                  onSaved: (val)=>
                      setState(() => _sellerinfo.shopAddress = val ),//TODO
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
                            onSaved: (val)=>
                                setState(() => _sellerinfo.shopAddress += val+" "),//TODO
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
                            onSaved: (val)=>
                                setState(() => _sellerinfo.shopAddress += val ),//TODO
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
                  final form = _formKey.currentState;
                  if (form.validate()) {

                      form.save();
                      _sellerinfo.save();

                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Sahi hai bhai data!')));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SellPage2(_sellerinfo),
                        ),
                      );
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

