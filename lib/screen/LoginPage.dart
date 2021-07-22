import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thaparexpress/screen/Widget/my_text_field.dart';

class LoginPage extends StatelessWidget {


  TextEditingController Email = TextEditingController();
  TextEditingController Password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.yellowAccent,
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 150),
              child: Text(
                "Login",
                style: TextStyle(
                  color: Colors.yellowAccent,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              children: [
                MyTextField(
                    controller: Email,
                    hintText: 'Email',
                    obscureText: false
                ),

                SizedBox(height: 30),
                MyTextField(
                    controller: Password,
                    hintText: 'Password',
                    obscureText: true
                ),
              ],
            ),
            Container(
              height: 60,
              width: 200,
              child: RaisedButton(
                color: Colors.yellowAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                onPressed: () {},
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New user", style: TextStyle(color: Colors.black),),
                Text("Register now",
                  style: TextStyle(color: Colors.yellowAccent),),
              ],
            )

          ],
        ),
      ),
    );
  }
}
