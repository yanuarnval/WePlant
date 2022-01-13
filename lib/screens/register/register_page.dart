import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/register_bloc_auth.dart';
import 'package:mobile_flutter/model/register_auth_state.dart';
import 'package:mobile_flutter/model/Register_event.dart';
import 'package:mobile_flutter/screens/main_screen.dart';
import 'package:mobile_flutter/shared/color_weplant.dart';
import 'package:mobile_flutter/theme/weplant_theme.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  bool _statusDialogShow= true;

  @override
  void dispose() {
    // TODO: implement dispose
    _userController.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    Firebase.initializeApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider<RegisterBlocAuth>(
          create: (_) => RegisterBlocAuth(),
          child: BlocListener<RegisterBlocAuth, RegisterAuthState>(
            listener: (_, state) {
              if (state is FailureLoadRegisterAuthState) {
                print('value error');
                if(_statusDialogShow){
                  _showMyDialog(state.errorMessage, context);
                }
              } else if (state is SuccesLoadRegisterAuthState) {
                print("succes sta");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext c) => const MainScreen()));
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset('assets/icons/chevron-left.svg'),
                ),
                const SizedBox(
                  height: 16,
                ),
                _buildContent(),
                const Spacer(),
                _buildBottom(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _showMyDialog(String error, BuildContext context) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      title: "Error Message",
      message: error,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
      onStatusChanged: (status){
        if(status == FlushbarStatus.SHOWING){
            _statusDialogShow=false;
        }else if(status == FlushbarStatus.IS_HIDING){
          _statusDialogShow =true;
        }
      },
    ).show(context);
  }

  Padding _buildBottom(BuildContext parentContext) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocBuilder<RegisterBlocAuth, RegisterAuthState>(
              builder: (context, state) {
            return ElevatedButton(
                onPressed: () {
                  context.read<RegisterBlocAuth>().add(
                      Register(_userController.text, _passController.text));
                },
                child: Text(
                  'Register',
                  style: GoogleFonts.poppins(),
                ));
          }),
          TextButton(
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text: 'You have an account? ',
                        style: GoogleFonts.poppins(color: Colors.grey)),
                    TextSpan(
                        text: 'Sign in',
                        style: GoogleFonts.poppins(
                            color: ColorsWeplant.colorPrimary)),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  Container _buildContent() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Register',
            style: GoogleFonts.poppins(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          Form(
            key: _formkey,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    cursorColor: ColorsWeplant.colorPrimary,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                    validator: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: ColorsWeplant.colorTextfield,
                      filled: true,
                      hintText: "First name",
                      hintStyle: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    cursorColor: ColorsWeplant.colorPrimary,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                    validator: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: ColorsWeplant.colorTextfield,
                      filled: true,
                      hintText: "Last name",
                      hintStyle: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    cursorColor: ColorsWeplant.colorPrimary,
                    controller: _userController,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                    validator: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: ColorsWeplant.colorTextfield,
                      filled: true,
                      hintText: "Email",
                      hintStyle: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: TextFormField(
                    cursorColor: ColorsWeplant.colorPrimary,
                    controller: _passController,
                    obscureText: true,
                    style:
                        GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                    validator: (value) {},
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: ColorsWeplant.colorTextfield,
                      filled: true,
                      hintText: "Password",
                      hintStyle: GoogleFonts.poppins(fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: 'By signing you agree to our ',
                            style: GoogleFonts.poppins(
                                color: ColorsWeplant.colorPrimary)),
                        TextSpan(
                            text: 'Term of use ',
                            style: GoogleFonts.poppins(color: Colors.grey)),
                        TextSpan(
                            text: 'and ',
                            style: GoogleFonts.poppins(
                                color: ColorsWeplant.colorPrimary)),
                        TextSpan(
                            text: 'privacy notice',
                            style: GoogleFonts.poppins(color: Colors.grey)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
