import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:ppanda/modules/shared/validators.dart';
import 'package:ppanda/services/cart_service.dart';
import 'package:ppanda/services/shop_service.dart';
import 'package:http/http.dart' as http;

class OrderFormScreen extends StatefulWidget {
  const OrderFormScreen({Key key}) : super(key: key);

  @override
  _OrderFormScreenState createState() => _OrderFormScreenState();
}

class _OrderFormScreenState extends State<OrderFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneFieldKey = GlobalKey<FormFieldState>();
  TextEditingController phoneController = TextEditingController();

  final _emailFieldKey = GlobalKey<FormFieldState>();
  TextEditingController emailController = TextEditingController();

  final _addressFieldKey = GlobalKey<FormFieldState>();
  TextEditingController addressController = TextEditingController();

  final _commentFieldKey = GlobalKey<FormFieldState>();
  TextEditingController commentController = TextEditingController();

  bool submitting = false;
  bool submitSuccess = false;

  @override
  Widget build(BuildContext context) {
    final List<Widget> orderDetails = [];

    ShopItem shopItem = CartService.instance.shopItems.first;
    Map<String, dynamic> selectedOptions = CartService.instance.selectedOptions[shopItem.id];

    String orderDetailsText = '';

    print(CartService.instance.selectedOptions);
    print(selectedOptions);

    orderDetails.add(
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        child: Text(
          shopItem.name,
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    orderDetailsText += shopItem.name + '\n';

    shopItem.options.forEach((option) {
      if (option.condition != null) {
        print('option.condition.keys.first: ${option.condition.keys.first}');
        print('selectedOptions[option.condition.keys.first]: ${selectedOptions[option.condition.keys.first]}');
        print('option.condition.values.first: ${option.condition.values.first}');

        if (selectedOptions[option.condition.keys.first] == null || selectedOptions[option.condition.keys.first] != option.condition.values.first) {
          return;
        }
      }

      if (option.choices != null) {
        final selectedOptionChoice =
            option.choices.firstWhere((ShopItemOptionChoice choice) => choice.id == selectedOptions[option.id], orElse: () => null);

        if (selectedOptionChoice != null) {
          orderDetails.add(
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 18.0),
              child: Text(
                option.name + ': ' + selectedOptionChoice.name,
                textAlign: TextAlign.start,
              ),
            ),
          );
          orderDetailsText += option.name + ': ' + selectedOptionChoice.name + '\n';
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return Container(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 24.0),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: Text(
                              'הזמנה - פרטים ליצירת קשר',
                              style: TextStyle(
                                fontSize: 26.0,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: Text(
                              'פרטי ההזמנה',
                              style: TextStyle(
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          ...orderDetails,
                          const SizedBox(height: 18.0),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: Text('כדי להשלים את ההזמנה, תכתבו את מספר הטלפון שלכם ופרטים נוספים, ואני אצור איתכם קשר'),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'טלפון'),
                              key: _phoneFieldKey,
                              controller: phoneController,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'email'),
                              key: _emailFieldKey,
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: validateEmail,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'כתובת'),
                              key: _addressFieldKey,
                              controller: addressController,
                              minLines: 2,
                              maxLines: 4,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: TextFormField(
                              decoration: InputDecoration(labelText: 'הערות'),
                              key: _commentFieldKey,
                              controller: commentController,
                              validator: (value) {
                                return null;
                              },
                            ),
                          ),
                          if (!submitSuccess && !submitting)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                              child: RaisedButton(
                                padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 48.0),
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
                                  if (_formKey.currentState.validate()) {

                                    setState(() {
                                      submitting = true;
                                    });

                                    submitForm(orderDetailsText);
                                  }
                                },
                                child: Text(
                                  'שלח',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          if (submitting)
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                              child: Text(
                                'שולח..',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          if (submitSuccess)
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                              child: Text(
                                'נשלח בהצלחה!',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }

  void submitForm(String orderDetailsText) async {
    // TODO: order details

    var url = 'https://formspree.io/xeqzbgrb';
    var response = await http.post(url, body: {
      '_replyto': emailController.text,
      'פרטי המזמין': 'טלפון: ' +
          phoneController.text +
          ', \n'
              'כתובת: ' +
          addressController.text +
          ', \n'
              'הערות: ' +
          commentController.text +
          ', \n',

      'פרטי ההזמנה': orderDetailsText,
    });

    if (response.statusCode == 302){
      setState(() {
        submitting = false;
        submitSuccess = true;
      });
    }

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
