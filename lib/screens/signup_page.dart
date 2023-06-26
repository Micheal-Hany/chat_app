import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'package:chat_app/screens/signIn_page.dart';
import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_text_filed.dart';

class RegistetionPage extends StatefulWidget {
  RegistetionPage({super.key});

  @override
  State<RegistetionPage> createState() => _RegistetionPageState();
}

class _RegistetionPageState extends State<RegistetionPage> {
  String? email;

  String? password;

  bool isLoding = false;

  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2B475E),
      body: ModalProgressHUD(
        inAsyncCall: isLoding,
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Image.asset("assets/images/scholar.png"),
                Text(
                  "Scholer Chat",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Colors.white),
                ),
                Spacer(
                  flex: 2,
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.only(left: 15)),
                    Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                          color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextFeiled(
                    onChange: (data) {
                      email = data;
                    },
                    lableText: 'Email'),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextFeiled(
                    obsecureText: true,
                    onChange: (data) {
                      password = data;
                    },
                    lableText: 'Password'),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoding = true;
                        setState(() {});
                        try {
                          await registerUser();
                          showSnackBar(context, 'Registration successed');
                          Navigator.pushNamed(context, 'ChatPage',
                              arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showSnackBar(context, 'Weak Password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context,
                                'The account already exists for that email.');
                          }
                        }
                        isLoding = false;
                        setState(() {});
                      }
                    },
                    nameOfButton: 'Register'),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'already have an account ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: InkWell(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Color(0xffC7EDE6)),
                        ),
                      ),
                    )
                  ],
                ),
                Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
