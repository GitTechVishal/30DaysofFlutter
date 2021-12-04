import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changeButton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.fill,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter user Name",
                      labelText: "User Name",
                    ),
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //ElevatedButton(
                  //  child: Text("Login Set"),
                  //  style: TextButton.styleFrom(maximumSize: Size(250, 40)),
                  //  onPressed: () {
                  //    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  // },
                  // )
                  InkWell(
                      splashColor: Colors.blue,
                      onTap: () async {
                        setState(() {
                          changeButton = true;
                        });

                        await Future.delayed(Duration(seconds: 1));
                        Navigator.pushNamed(context, MyRoutes.homeRoute);
                      },
                      child: AnimatedContainer(
                          duration: Duration(seconds: 1),
                          width: changeButton ? 50 : 100,
                          height: 50,
                          alignment: Alignment.center,
                          child: changeButton
                              ? Icon(Icons.done, color: Colors.white)
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                          decoration: BoxDecoration(
                              color: Colors.deepPurple,
                              //shape: changeButton
                              //    ? BoxShape.circle
                              //    : BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(
                                  changeButton ? 50 : 8))))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
