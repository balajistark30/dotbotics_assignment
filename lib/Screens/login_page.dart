import 'dart:convert';

import 'package:dot_botics_assignment/loader.dart';
import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'package:dot_botics_assignment/Networking/apicall.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberme = false;
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final username = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff017D89),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            Container(
              height: 150,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Sus',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff6CAC31)),
                      ),
                      Text(
                        'tech',
                        style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff057B85)),
                      )
                    ],
                  ),
                  const Text(
                    'Tech For Sustainable Future',
                    style: TextStyle(fontSize: 12, color: Colors.black54),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Sus Tech Innovations Pvt.Ltd',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: 320,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Container(
                    width: 300,
                    height: 45,
                    decoration: BoxDecoration(
                      color: const Color(0xffF5F5F5),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset:
                              const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Please Sign In',
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          focusNode: _usernameFocusNode,
                          controller: username,
                          decoration: const InputDecoration(
                            hintText: 'Enter your username',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          focusNode: _passwordFocusNode,
                          obscureText: true,
                          controller: password,
                          decoration: const InputDecoration(
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: _rememberme,
                            onChanged: (bool? value) {
                              setState(() {
                                _rememberme = value!;
                              });
                            },
                          ),
                          Transform.scale(
                            scale: 0.8, // adjust the scale as per your need
                            child: const Text(
                              'Remember me',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 200,
                        child: ElevatedButton(
                          onPressed: () {
                            showLoader(context);
                            APICALL.login(username.text, password.text).then(
                                  // TODO: change status code before submitting
                                  (response) => response.statusCode != 200
                                      ? APICALL.getLocations().then(
                                            (value) => Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SecondScreen(data: value),
                                              ),
                                            ),
                                          )
                                      : ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                          SnackBar(
                                            content: Text(jsonDecode(
                                                response.body)["message"]),
                                          ),
                                        ),
                                );
                            _usernameFocusNode.unfocus();
                            _passwordFocusNode.unfocus();
                            // Perform login action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5FB65C),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text('Login'),
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text('Forgot Password ?'),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
