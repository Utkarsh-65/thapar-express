import 'package:flutter/material.dart';
import 'package:thaparexpress/screen/Widget/my_text_field.dart';

class Signup extends StatefulWidget{
  @override
  _SignUpState createstate() => _SignUpState();
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
class _SignUpState extends State<Signup> {
  RegExp regExp=RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
  Future sendData()async{
    await FirebaseFirestore.instance.collection('userdata').doc().set({
      'firstName':firstName.text,
      'lastName':lastName.text,
      'email':email.text,
      'password':password.text,
    });
  }


  void validation() {
    if (firstName.text.trim().isEmpty || firstName.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("firstName is empty"),
        ),
      );
      return;
    }
    if (lastName.text.trim().isEmpty || lastName.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("lastName is empty"),
        ),
      );
      return;
    }
    if (email.text.trim().isEmpty ||email.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("email is empty"),
        ),
      );
      return;
    }
    else if(!regExp.hasMatch(email.text)){
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("Please enter a valid email"),
        ),
      );
      return;
    }
    if (password.text.trim().isEmpty || password.text.trim() == null) {
      globalKey.currentState!.showSnackBar(
        SnackBar(
          content: Text("password is empty"),
        ),
      );
      return;
    }
  }
  Widget button({
    required String buttonName,
    required Color color,
    required Color textColor,
    required Function ontap,
  }){
    return Container(
      width: 100,
      child: RaisedButton(
          color: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Text(
            buttonName,
            style: TextStyle(fontSize: 15, color: textColor),
          ),
          onPressed: () {}),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      backgroundColor: Colors.blue[200],
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MyTextField(
                        controller: firstName,
                        obscureText: false,
                        hintText: 'firstname'),
                    MyTextField(
                        controller: lastName,
                        obscureText: false,
                        hintText: 'lastname'),
                    MyTextField(
                        controller: email,
                        obscureText: false,
                        hintText: 'email'),
                    MyTextField(
                        controller: password,
                        obscureText: true,
                        hintText: 'password'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button(
                    ontap: (){
                      validation();
                    },
                      buttonName: "Cancel",
                      color: Colors.white,
                      textColor: Colors.black),
                  SizedBox(width: 10),
                  button(
                    ontap: (){
                      validation();
                    },
                      buttonName: "Register",
                      color: Colors.yellowAccent,
                      textColor: Colors.black),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
