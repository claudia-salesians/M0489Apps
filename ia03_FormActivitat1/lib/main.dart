
import 'package:flutter/material.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text - Claudia'),
        backgroundColor: const Color.fromARGB(255, 54, 121, 247),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: myController,
            ),

            const SizedBox(height: 100),

            // ModalBottomSheet
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 50),
              ),
              onPressed: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      decoration: const BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(myController.text),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Tancar BottomSheet'),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              //tooltip: 'Mostra el valor amb ModalBottomSheet!',
              child: const Text('ModalBottomSheet'),
            ),

            const SizedBox(height: 20),

            // ShowDialog
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('SimpleDialog'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(myController.text),
                        ),
                        
                      ],
                    );
                  },
                );
              },
              //tooltip: 'Mostra el valor amb SimpleDialog!',
              child: const Text('SimpleDialog'),
            ),

            const SizedBox(height: 20),

            // AlertDialog
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 50),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('AlertDialog'),
                      content: Text(myController.text),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              //tooltip: 'Mostra el valor amb AlertDialog!',
              child: const Text('AlertDialog'),
            ),

            const SizedBox(height: 20),

            // SnackBar
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(220, 50),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(myController.text),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              //tooltip: 'Mostra el valor amb SnackBar!',
              child: const Text('SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}
