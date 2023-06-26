import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/widgets/custom_botton.dart';
import 'package:chat_app/widgets/custom_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isLoding = false;
  String? email;
  String? password;
  // final email_contraller = TextEditingController();
  // final password_contraller = TextEditingController();

  SharedPreferences? loginData;
  bool? newUser;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                      "Login",
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
                  lableText: 'Email',
                  onChange: (data) {
                    email = data;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomFormTextFeiled(
                    obsecureText: true,
                    lableText: 'Password',
                    onChange: (data) {
                      password = data;
                    }),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoding = true;
                        setState(() {});
                        try {
                          await loginUser();
                          showSnackBar(context, 'Login successed');
                          Navigator.pushNamed(context, 'ChatPage',
                              arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showSnackBar(
                                context, 'No user found for that email.');
                          } else if (ex.code == 'wrong-password') {
                            showSnackBar(context,
                                'Wrong password provided for that user.');
                          }
                        }
                        isLoding = false;
                        setState(() {});
                      }
                    },
                    nameOfButton: 'Sign In'),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'don\'t have account ? ',
                      style: TextStyle(color: Colors.white),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'SignUpPage');
                      },
                      child: InkWell(
                        child: Text(
                          'Sign Up',
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

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
