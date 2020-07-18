import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:ppanda/modules/shared/custom_date_picker.dart';

class ClubFormScreen extends StatefulWidget {
  const ClubFormScreen({Key key}) : super(key: key);

  @override
  _ClubFormScreenState createState() => _ClubFormScreenState();
}

class _ClubFormScreenState extends State<ClubFormScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameFieldKey = GlobalKey<FormFieldState>();
  TextEditingController nameController = TextEditingController();

  final _phoneFieldKey = GlobalKey<FormFieldState>();
  TextEditingController phoneController = TextEditingController();

  final _emailFieldKey = GlobalKey<FormFieldState>();
  TextEditingController emailController = TextEditingController();

  DateTime birthdayDate;
  DateTime weddingDayDate;

  final _soNameFieldKey = GlobalKey<FormFieldState>();
  TextEditingController soNameController = TextEditingController();

  DateTime soBirthdayDate;

  final List<GlobalKey<FormFieldState>> _kidsNameFieldsKeys = [];
  final List<TextEditingController> kidsNameControllers = [];

  final List<DateTime> kidsBirthdayDates = [];

  bool submitting = false;
  bool submitSuccess = false;

  @override
  void initState() {
    super.initState();

    addKid();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(builder: (BuildContext context) {
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
                            'חבר מועדון',
                            style: TextStyle(
                              fontSize: 26.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                          child: Text('טקסט טקסט טקסט טקסט טקסט טקסט טקסט טקסט טקסט טקסט טקסט טקסט '),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'שם'),
                            key: _nameFieldKey,
                            controller: nameController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
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
                          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'מייל'),
                            key: _emailFieldKey,
                            controller: emailController,
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
                          child: CustomDatePicker(
                            label: 'תאריך לידה',
                            initialBlankDateTime: DateTime.now().subtract(Duration(days: 366 * 15)),
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (DateTime newDateTime) {
                              print('DATETIME: $newDateTime');
                              setState(() => birthdayDate = newDateTime);
                            },
                            onSaved: (value) {
                              print('value: $value');
                              birthdayDate = value;
                            },
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                          child: CustomDatePicker(
                            label: 'תאריך נישואים',
                            initialBlankDateTime: DateTime.now().subtract(Duration(days: 366 * 15)),
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (DateTime newDateTime) {
                              print('weddingDayDate: $newDateTime');
                              setState(() => weddingDayDate = newDateTime);
                            },
                            onSaved: (value) {
                              print('value: $value');
                              weddingDayDate = value;
                            },
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                          child: TextFormField(
                            decoration: InputDecoration(labelText: 'שם בן/בת זוג'),
                            key: _soNameFieldKey,
                            controller: soNameController,
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
                          child: CustomDatePicker(
                            label: 'תאריך לידה של בן/בת זוג',
                            initialBlankDateTime: DateTime.now().subtract(Duration(days: 366 * 15)),
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (DateTime newDateTime) {
                              print('weddingDayDate: $newDateTime');
                              setState(() => soBirthdayDate = newDateTime);
                            },
                            onSaved: (value) {
                              print('value: $value');
                              soBirthdayDate = value;
                            },
                            validator: (value) {
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(height: 18.0),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                          child: Text('ילדים'),
                        ),
                        for (var i = 0; i < _kidsNameFieldsKeys.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                  child: TextFormField(
                                    decoration: InputDecoration(labelText: 'שם'),
                                    key: _kidsNameFieldsKeys[i],
                                    controller: kidsNameControllers[i],
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 18.0),
                                Flexible(
                                  child: CustomDatePicker(
                                    label: 'תאריך לידה',
                                    initialBlankDateTime: DateTime.now().subtract(Duration(days: 366 * 5)),
                                    maximumDate: DateTime.now(),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      print('DATETIME: $newDateTime');
                                      setState(() => kidsBirthdayDates[i] = newDateTime);
                                    },
                                    onSaved: (value) {
                                      print('value: $value');
                                      kidsBirthdayDates[i] = value;
                                    },
                                    validator: (value) {
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(width: 9.0),
                                SizedBox(
                                  width: 42.0,
                                  child: RaisedButton(
                                    onPressed: () {
                                      removeKid();
                                    },
                                    child: Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 18.0),
                          child: SizedBox(
                            width: 42.0,
                            child: RaisedButton(
                              onPressed: () {
                                addKid();
                              },
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
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
//                                if (_formKey.currentState.validate()) {
//                                  setState(() {
//                                    submitting = true;
//                                  });
//
//                                  submitForm('a');
//                                }
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
        }),
      ),
    );
  }

  void addKid() {
    if (_kidsNameFieldsKeys.length > 20) {
      return;
    }
    _kidsNameFieldsKeys.add(GlobalKey<FormFieldState>());
    kidsNameControllers.add(TextEditingController());
    kidsBirthdayDates.add(null);

    setState(() {});
  }

  void removeKid() {
    if (_kidsNameFieldsKeys.length < 1) {
      return;
    }
    _kidsNameFieldsKeys.removeLast();
    kidsNameControllers.removeLast();
    kidsBirthdayDates.removeLast();

    setState(() {});
  }

  void submitForm(String orderDetailsText) async {
    // TODO: order details

    var url = 'https://formspree.io/xeqzbgrb';
    var response = await http.post(url, body: {
      '_replyto': emailController.text,
      'פרטי המזמין': 'טלפון: ' +
          phoneController.text +
          ', \n'
              'כתובת: ',
      'פרטי ההזמנה': orderDetailsText,
    });

    if (response.statusCode == 302) {
      setState(() {
        submitting = false;
        submitSuccess = true;
      });
    }

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
