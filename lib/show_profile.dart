import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class ShowProfile extends StatefulWidget {
  const ShowProfile({Key? key}) : super(key: key);

  @override
  State<ShowProfile> createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  var id, firstName, lastName;

  void apiCall() async {
    // var url = Uri.http("192.168.178.28:8080", "/api/accounts");
    var url = Uri.https("money-transfer-api-act23.fly.dev", "/api/accounts");

    var response = await http.get(url);

    var jsonResponse = convert.jsonDecode(response.body);

    print(jsonResponse);

    setState(() {
      id = jsonResponse[0]['id'];
      firstName = jsonResponse[0]['firstName'];
      lastName = jsonResponse[0]['lastName'];
    });
  }

  @override
  void initState() {
    super.initState();
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Show Profile"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Show Profile $id'),
            Text('First Name $firstName', style: const TextStyle(fontSize: 30)),
            Text(
              'Last Name $lastName',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
