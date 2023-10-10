import 'package:flutter/material.dart';
import 'package:synkrama_test/shared_preference.dart';
import 'dashboard.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool agreeCheckBox = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  SharedPreferenceClass sharedPreferenceClass = SharedPreferenceClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Card(
                child: Container(
        height: 500,
        width: 330,
                  child: Column(
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 4,right: 4,top: 12,bottom: 5
                              ),
                              child: TextFormField(
                                cursorColor: Colors.deepOrangeAccent,
                                controller: nameController,
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
                                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                                  labelText: 'Name',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your Name';
                                  }
                                  if(value.length <2){
                                    return 'Name Should Not Be Less Than 2';
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
                                controller: emailController,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 2.0,
                                    ),),
                                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                                  labelText: 'Email',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Your Email';
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
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 2.0,
                                    ),),
                                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                                  labelText: 'Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  if(value.length <6){
                                    return 'Password Should Not Be Less Than 6';
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
                                controller: confirmPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(
                                      color: Colors.deepOrangeAccent,
                                      width: 2.0,
                                    ),),
                                  labelStyle: TextStyle(color: Colors.deepOrangeAccent),
                                  labelText: 'Confirm Password',
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter Password';
                                  }
                                  if(value != passwordController.text){
                                    return 'Password Is Not Matching';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                              side: BorderSide(color: Colors.black),
                              activeColor: Colors.deepOrangeAccent,
                              value: agreeCheckBox,
                              onChanged: (value) {
                                setState(() {
                                  agreeCheckBox = !agreeCheckBox;
                                });
                              }),
                          Text(
                            "Accept Terms & Conditions",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
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
                          onPressed: ()async{
                            if (formKey.currentState!.validate()) {
                              if(agreeCheckBox == true) {
                                await sharedPreferenceClass.setItems(emailController.text);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(),
                                  ),
                                );
                              }
                              else{
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    elevation: 12,
                                    backgroundColor: Colors.deepOrangeAccent,
                                    duration: Duration(seconds: 3),
                                    content: Center(child: Text("Please Accept Terms & Conditions")),
                                  ),
                                );
                              }
                            };
                          },
                          child: Text("Sign Up"),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.deepOrangeAccent),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegExp.hasMatch(email);
  }
}
