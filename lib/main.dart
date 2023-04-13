import 'package:flutter/material.dart';
import 'package:money_transfer_mobile_app_act23/show_profile.dart';

import 'api.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Money Transfer App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: const MyHomePage(title: 'Money Transfer App by ACT23'),
      home: const ShowProfile(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? firstName, middleName, lastName, phoneNumber, email;
  int? pin, confirmPin;

  void _handleCreateAccount() {
      print("button is clicked");

      print("pin ${pin!}");   //same as print("pin" + pin!.toString());
      print("confirm pin ${confirmPin!}");

      if (pin == confirmPin) {

        final data = createAccount(firstName!, middleName, lastName, phoneNumber, email, pin);

        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Account created with successfully!")));

        setState(() {
            firstName = '';
            middleName = '';
            lastName = '';
            phoneNumber = '';
            email = '';
            pin = 0;
            confirmPin = 0;
        });

      } else {
        print("Pin and Confirm Pin are not the same");
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Pin and Confirm Pin are not the same")));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Create Account",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 20,),
              const Text("First name"),
              TextField(
                autofocus: true,
                keyboardType: TextInputType.name,
                onChanged: (String value) { firstName = value; },
              ),
              const SizedBox(height: 20,),
              const Text("Middle name"),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (String value) { middleName = value; },
              ),
              const SizedBox(height: 20,),
              const Text("Last name"),
              TextField(
                keyboardType: TextInputType.name,
                onChanged: (String value) { lastName = value; },
              ),
              const SizedBox(height: 20,),
              const Text("Phone number"),
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: (String value) { phoneNumber = value; },
              ),
              const SizedBox(height: 20,),
              const Text("Email"),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (String value) { email = value; },
              ),
              const SizedBox(height: 20,),
              const Text("Pin"),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (String value) { pin = int.parse(value); },
              ),
              const SizedBox(height: 20,),
              const Text("Confirm Pin"),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (String value) { confirmPin = int.parse(value); },
              ),
              const SizedBox(height: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.red,
                ),
                onPressed: _handleCreateAccount,
                child: const Text('Create Account'),
              )
            ]),
      ),
    );
  }
}
