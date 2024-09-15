import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping/home.dart';
import 'package:shopping/sign.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  void initState() {
    super.initState();
  }

  bool _isChange = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 130, 30, 0),
          child: Column(
            children: [
              Center(
                child: Text(
                  "Login",
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
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const home()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, minimumSize: Size(180, 50)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(45,5,20,0),
                child: Row(
                  children: [
                    Text("If you don't have account"),
                    const SizedBox(
                      height: 3,
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const sign()));
                        },
                        child: Text("sign up",style: TextStyle(color: Colors.blueAccent,decoration: TextDecoration.underline),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
