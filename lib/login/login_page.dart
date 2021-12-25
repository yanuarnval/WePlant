import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/screens/main_screen.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset('assets/images/sale1.png'),
                ),
                Text(
                  'Log-in',
                  style: WeplantTheme.textTheme.headline1,
                ),
                SizedBox(
                  height: 5,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          errorStyle: GoogleFonts.spartan(),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsWeplant.colorPrimary, width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsWeplant.colorPrimary, width: 1),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: UnderlineInputBorder(),
                          label: Text(
                            'Enter your email',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Password',
                        style: GoogleFonts.roboto(color: Colors.black),
                      ),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter some text";
                          } else {
                            return null;
                          }
                        },
                        obscuringCharacter: '●',
                        obscureText: true,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_red_eye),
                          ),
                          errorStyle: GoogleFonts.spartan(),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsWeplant.colorPrimary, width: 1),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: ColorsWeplant.colorPrimary, width: 1),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: UnderlineInputBorder(),
                          label: Text(
                            'enter your password',
                          ),
                          errorBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                      ),
                      const SizedBox(height: 100,),
                      ElevatedButton(onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext c) => const MainScreen()));
                        }else{

                        }
                      },
                          child: Text('login'))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
