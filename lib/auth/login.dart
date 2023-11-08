// ignore_for_file: file_names
import 'dart:developer';

import 'package:e_commerce/shared/colors.dart';
import 'package:e_commerce/shared/costumelogo.dart';
import 'package:e_commerce/shared/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                ),
                const CostumeLogoAuth(),
                Container(
                  height: 20,
                ),
                const Text(
                  "Login",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Login to continue using the app",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                CostumeTextForm(
                  IconButtonUse: false,
                    hinttext: "Enter Your Email", mycontroller: email, isPassword: false),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                const Text(
                  "Password",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                // CostumeTextForm(
                //   // IconButtonUse: true,
                //     hinttext: "Enter Your Password", mycontroller: password, isPassword: true,
                // ),
        TextFormField(
          keyboardType: TextInputType.text,
          obscureText: _isVisible ? false : true,
          controller: password,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () => updateStatus(),
              icon:
              Icon(_isVisible ? Icons.visibility : Icons.visibility_off),
            ),
            hintText: 'Enter Your Password',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0),
              borderSide: BorderSide(color: Color.fromARGB(255, 184, 184, 184)),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.0),
                borderSide: BorderSide(color: Color.fromARGB(255, 190, 190, 190))),
          ),
        ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: (){
                    //   If you forget your password
                    },
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
            // CostumeButtonAuth(title: "Login", onPressed: () {}),
            SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(email: email.text, password: password.text);
                      if (!mounted) return;
                      Navigator.of(context).pushNamed("home");
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        log('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        log('Wrong password provided for that user.');
                      }
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(
                      btnGreen,
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text("Login"),
                )),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              height: 40,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
              color: Colors.red[700],
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Login With google "),
                  Image.asset(
                    "images/google.png",
                    width: 30,
                  )
                ],
              ),
            ),
            Container(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account ? "),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("Signup");
                  },
                  child: const Text(
                    "Register",
                    style: TextStyle(color: btnGreen, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:e_commerce/auth/register.dart';
// import 'package:e_commerce/shared/colors.dart';
// import 'package:flutter/material.dart';
//
// import '../shared/constants.dart';
//
// class Login extends StatelessWidget {
//   const Login({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//    return Scaffold(
//       backgroundColor: Color.fromARGB(255, 247, 247, 247),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(33.0),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   child: Image.asset('images/logo.png'),
//                 ),
//                 SizedBox(
//                   height: 64,
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.emailAddress,
//                   obscureText: false,
//                   decoration: decorationTextField.copyWith(
//                     hintText: "Enter Your Email",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 33,
//                 ),
//                 TextField(
//                   keyboardType: TextInputType.text,
//                   obscureText: true,
//                   decoration: decorationTextField.copyWith(
//                     hintText: "Enter Your Password",
//                   ),
//                 ),
//                 SizedBox(
//                   height: 33,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Navigator
//                     // Navigator.push(context, MaterialPageRoute(builder: (context) {
//                     //
//                     // },));
//                   },
//                   child: Text(
//                     'Sign in',
//                     style: TextStyle(fontSize: 19),
//                   ),
//                   style: ButtonStyle(
//                       backgroundColor: MaterialStatePropertyAll(btnGreen),
//                       padding: MaterialStateProperty.all(
//                         EdgeInsets.all(12),
//                       ),
//                       shape: MaterialStateProperty.all(RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8.0)))),
//                 ),
//                 SizedBox(height: 33,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text('Do not have an account?',style: TextStyle(fontSize: 18),),
//                       TextButton(onPressed: (){
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Register()),);
//                       }, child: Text('sign up',style: TextStyle(color: Colors.black,fontSize: 18),),),
//                 ]),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// // flutter project e-commerce 1:00:07
//
