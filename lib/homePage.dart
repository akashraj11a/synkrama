import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:synkrama_test/dashboard.dart';
import 'package:synkrama_test/shared_preference.dart';
import 'package:synkrama_test/signUp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SharedPreferenceClass sharedPreferenceClass = SharedPreferenceClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Card(
                child: Container(
                  height: 300,
                  width: 330,
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 4,right: 4,top: 12,bottom: 5
                              ),
                              child: TextFormField(
                                cursorColor: Colors.deepOrangeAccent,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent, // Border color when focused
                                      width: 2.0,         // Border width when focused
                                    ),),
                                  labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.deepOrangeAccent)
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!isValidEmail(value)) {
                                    return 'Please enter a valid email address';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4.0,right: 4,top: 5,bottom: 5
                              ),
                              child: TextFormField(
                                cursorColor: Colors.deepOrangeAccent,
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // Define the border for the focused state
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent, // Border color when focused
                                      width: 2.0,         // Border width when focused
                                    ),),
                                  labelText: 'Password',
                                  labelStyle: TextStyle(color: Colors.deepOrangeAccent)
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if(value.length <6){
                                    return 'Password Should Not Be Less Than 6';
                                  }
                                  return null;
                                },
                              ),
                            ),],),),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0,bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 150,
                              height: 40,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Colors.deepOrangeAccent),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                            side: BorderSide(
                                                color: Colors.deepOrangeAccent)))),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await sharedPreferenceClass.setItems(emailController.text);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
                                      ),
                                    );
                                  };
                                },
                                child: Text("Sign In"),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.deepOrangeAccent),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: RichText(
                          text: TextSpan(
                              text: "Create An Account ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()..onTap = () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUp()));
                                    },
                                    text: "Sign Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.deepOrangeAccent,
                                    )),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}
