import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M0489 - Aizpurua - Form (C)',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final String title = 'Claudia Aizpurua - Form C';
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FormBuilder(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // -------------------------------------
                    // Choice Chips
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FormBuilderChoiceChips<String>(
                        name: 'choice_chips',
                        decoration: InputDecoration(
                          labelText: 'Choice Chips',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        alignment: WrapAlignment.center,
                        spacing: 20,
                        runSpacing: 10,
                        backgroundColor: Colors.blue.shade700,
                        selectedColor: Colors.grey.shade700,
                        labelStyle: const TextStyle(color: Colors.white),
                        options: const [
                          FormBuilderChipOption(
                            value: 'Flutter',
                            child: Text('Flutter'),
                          ),
                          FormBuilderChipOption(
                            value: 'Android',
                            child: Text('Android'),
                          ),
                          FormBuilderChipOption(
                            value: 'Chrome OS',
                            child: Text('Chrome OS'),
                          ),
                        ],
                      ),
                      ),
                    // -------------------------------------
                    // Switch Field
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FormBuilderSwitch(
                            name: 'switch',
                            title: const Text('This is a switch', style: TextStyle(fontSize: 16)),
                            initialValue: false,
                            activeColor: Colors.blue,
                            decoration: InputDecoration(
                              labelText: 'Switch',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              debugPrint(value.toString());
                            },
                      ),
                    ),
                    //-------------------------------------------------
                    // Text Field
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FormBuilderTextField(
                            name: 'text_field',
                            maxLength: 15,
                            decoration: InputDecoration(
                              labelText: 'Text Field',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onChanged: (value) {
                              debugPrint(value);
                            },
                      ),
                    ),
                    //-------------------------------------------------
                    // Dropdown Field
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FormBuilderDropdown(
                            name: 'dropdown_field',
                            decoration: InputDecoration(
                              hintText: 'Dropdown Field',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(value: 'option1', child: Text('Option 1')),
                              DropdownMenuItem(
                                  value: 'option2', child: Text('Option 2')),
                              DropdownMenuItem(value: 'option3', child: Text('Option 3')),
                            ],
                            onChanged: (String? value) {
                              debugPrint(value);
                            },
                      ),
                    ),
                    //-------------------------------------------------
                    // Radio Group Field
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: FormBuilderRadioGroup(
                        decoration: InputDecoration(
                          labelText: 'Radio Group Model',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                      ),
                      name: "speed",
                      orientation: OptionsOrientation.vertical,
                      separator: const Padding(padding: EdgeInsets.all(5)),
                      options: const [
                        FormBuilderFieldOption(value: 'Option 1'),
                        FormBuilderFieldOption(value: 'Option 2'),
                        FormBuilderFieldOption(value: 'Option 3'),
                        FormBuilderFieldOption(value: 'Option 4')
                      ],
                      onChanged: (String? value) {
                        debugPrint(value);
                      },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.upload),
          onPressed: () {
            _formKey.currentState?.saveAndValidate();
            String? formString = _formKey.currentState?.value.toString();
            alertDialog(context, formString!);
          }),
    );
  }
}

// ignore: must_be_immutable
void alertDialog(BuildContext context, String contentText) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text("Submission Completed"),
      icon: const Icon(Icons.check_circle),
      content: Text(contentText),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, 'Tancar'),
          child: const Text('Tancar'),
        ),
      ],
    ),
  );
}
