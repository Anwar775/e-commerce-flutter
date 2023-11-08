import 'dart:developer';

import 'package:e_commerce/pages/home.dart';
import 'package:e_commerce/shared/colors.dart';
import 'package:e_commerce/shared/costumelogo.dart';
import 'package:e_commerce/shared/textformfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isVisible = false;
  void updateStatus() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }
  TextEditingController username = TextEditingController();
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
                  "SignUp",
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "SignUp to continue using the app",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Container(
                  height: 10,
                ),
                CostumeTextForm(
                  IconButtonUse: true,
                    hinttext: "Enter Your Username", mycontroller: username, isPassword: false),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
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
                Container(
                  height: 10,
                ),
                // CostumeTextForm(
                //   IconButtonUse: true,
                //     hinttext: "Enter Your Password", mycontroller: password, isPassword: true),
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
                SizedBox(height: 10.0),

                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 20),
                  alignment: Alignment.topRight,
                  // child: const Text(
                  //   "Forget Password ?",
                  //   style: TextStyle(fontSize: 14),
                  // ),
                ),
              ],
            ),
            // CostumeButtonAuth(
            //     title: "SignUp",
            //     onPressed: () {
            //       Navigator.of(context).pushReplacementNamed("home");
            //       // Navigator.of(context).pushReplacementNamed("login");
            //     }),
            // ElevatedButton(onPressed: (){}, child: child)

            SizedBox(
              height: 40,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  backgroundColor: const MaterialStatePropertyAll(
                    btnGreen,
                  ),
                ),
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                  );
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email.text,
                      password: password.text,
                    ).then((value) {
                        
                    Navigator.of(context).pushReplacementNamed("home");
                    });

                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      log('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      log('The account already exists for that email.');
                    }
                  } catch (e) {
                    log(e.toString());
                  }
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0));
                },
                child: const Text("SignUp"),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Have an account ? "),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushReplacementNamed("login");
                  },
                  child: const Text(
                    "Login",
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
