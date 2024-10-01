import 'package:flutter/material.dart';
import 'package:shopping/dataBase.dart';
import 'package:shopping/home.dart';
import 'package:shopping/login.dart';
import 'package:sqflite/sqflite.dart';

class sign extends StatefulWidget {
  const sign({super.key});

  @override
  State<sign> createState() => _signState();
}

class _signState extends State<sign> {
  final name = TextEditingController();
  final emails = TextEditingController();
  final passwords = TextEditingController();
  bool _isChange = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.fromLTRB(30, 130, 30, 0),
                child: Column(children: [
                  Center(
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 50),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    controller: name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        hintText: "User",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                    cursorColor: Colors.blueAccent,
                    cursorRadius: Radius.circular(5.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: emails,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        hintText: "Gmail",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                    cursorColor: Colors.blueAccent,
                    cursorRadius: Radius.circular(5.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: passwords,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[300],
                        prefixIcon: Icon(
                          Icons.key_sharp,
                          color: Colors.black,
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isChange = !_isChange;
                              });
                            },
                            icon: Icon(_isChange
                                ? Icons.visibility_off_rounded
                                : Icons.visibility)),
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            borderSide: BorderSide.none)),
                    obscureText: _isChange,
                    cursorColor: Colors.blueAccent,
                    cursorRadius: Radius.circular(5.0),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await DataBase.insertDatabase(name.text,emails.text, passwords.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const login()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: Size(180, 50)),
                  ),
                ]))));
  }
}
