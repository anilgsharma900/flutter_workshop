import 'package:flutter/material.dart';

/// Created by Anil Sharma on 15/02/23.
class EntryView extends StatefulWidget {
  const EntryView({Key? key}) : super(key: key);

  @override
  State<EntryView> createState() => _EntryViewState();
}

class _EntryViewState extends State<EntryView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerFirstName = TextEditingController();
  TextEditingController _controllerLastName = TextEditingController();
  TextEditingController _controllerMiddleName = TextEditingController();

  // TextEditingController _controllerFirstName = TextEditingController();
  String _value = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Entry Form"),
          ),
          body: Container(
            color: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text("Hi Users"),
                      TextFormField(
                        controller: _controllerFirstName,
                        validator: (txt) => txt!.isEmpty ? "Empty field is not allowed" : null,
                        decoration: InputDecoration(
                            labelText: "first name",
                            hintText: "Enter first name",
                            enabledBorder: OutlineInputBorder()),
                      ),
                      TextFormField(
                        controller: _controllerMiddleName,
                        validator: (txt) => txt!.isEmpty ? "Empty field is not allowed" : null,
                        decoration:
                        InputDecoration(labelText: "middle name", hintText: "Enter first name"),
                      ),
                      TextFormField(
                        controller: _controllerLastName,
                        validator: (txt) => txt!.isEmpty ? "Empty field is not allowed" : null,
                        decoration:
                        InputDecoration(labelText: "last name", hintText: "Enter first name"),
                      ),

                      /// radio buttons
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ListTile(
                              leading: Radio(
                                  value: "Yes",
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                      _value = value!;
                                    });
                                  }),
                              title: const Text("Yes"),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Radio(
                                value: "No",
                                groupValue: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value!;
                                  });
                                }),
                          ),
                        ],
                      ),

                      /// dropdown menu
                      // DropdownButton(items: [
                      //   DropdownMenuItem(child: Text("data1")),
                      //   DropdownMenuItem(child: Text("data2")),
                      //   DropdownMenuItem(child: Text("data3")),
                      //   DropdownMenuItem(child: Text("data4")),
                      // ], onChanged: (value) {}),

                      /// checkboxes
                      Checkbox(value: false, onChanged: (value) {}),
                    ],
                  )),
            ),
          ),
        ));
  }
}
