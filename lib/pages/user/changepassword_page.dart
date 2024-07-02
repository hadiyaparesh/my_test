import 'package:flutter/material.dart';
import 'package:my_test/pages/login_page.dart';


class Changepassword extends StatefulWidget {
  const Changepassword({super.key});

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {
  final _formkey = GlobalKey<FormState>();

  var newpassword = "";

  void changepass() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  final Newpasswordcontroller = TextEditingController();

  void dispose() {
    Newpasswordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: "Email",
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white))),
                  controller: Newpasswordcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter your password ";
                    }
                    return null;
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 54, 30, 38),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        setState(() {
                          newpassword = Newpasswordcontroller.text;
                        });
                        changepass();
                      }
                    },
                    child: Text(
                      "Change Password",
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    )),
              ),
            )
          ],
        ));
  }
}
