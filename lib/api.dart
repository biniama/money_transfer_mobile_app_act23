import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> createAccount(String firstName, middleName, lastName, phoneNumber, email, pin) async {

  final response = await http.post(
    // Uri.parse('http://192.168.178.28:8080/api/accounts'),
    Uri.parse('https://money-transfer-api-act23.fly.dev/api/accounts'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, String>{
      'firstName': firstName,
      'middleName': middleName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'email': email,
      'pin': pin.toString(),
      'dateOfBirth': '1990-01-01'
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response, then parse the JSON.
    final data = jsonDecode(response.body);
    print(data);
    return data;
  } else {
    // If the server did not return a 201 CREATED response, then throw an exception.
    throw Exception('Failed to create an account.');
  }
}