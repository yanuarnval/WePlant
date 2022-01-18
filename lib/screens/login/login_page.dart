import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_flutter/bloc/login_bloc.dart';
import 'package:mobile_flutter/model/Login_state_model.dart';
import 'package:mobile_flutter/model/login_event.dart';
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
  final _keyGlobal = GlobalKey<FormState>();
  bool _statusDialogShow = true;

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BlocProvider<LoginBloc>(
          create: (_) => LoginBloc(),
          child: BlocListener<LoginBloc, LoginAuthState>(
            listener: (_, state) {
              if (state is FailureLoadLoginAuthState) {
                if (_statusDialogShow) {
                  _showMyDialog(state.errorMessage, context);
                }
              } else if (state is SuccesLoadLoginAuthState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext c) => const MainScreen()));
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [_buildContent(), _buildBottom(context)],
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
      onStatusChanged: (status) {
        if (status == FlushbarStatus.SHOWING) {
          _statusDialogShow = false;
        } else if (status == FlushbarStatus.IS_HIDING) {
          _statusDialogShow = true;
        }
      },
    ).show(context);
  }

  Padding _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _keyGlobal,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: SvgPicture.asset(
                'assets/icons/chevron-left.svg',
              ),
            ),
            Center(
              child: Image.asset(
                'assets/images/login-image.png',
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.height * 0.4,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'let’s sign you in.',
              style: GoogleFonts.poppins(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: TextFormField(
                cursorColor: ColorsWeplant.colorPrimary,
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                validator: (value) {},
                controller: _usernameController,
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
                style: GoogleFonts.poppins(color: Colors.black, fontSize: 16),
                validator: (value) {},
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: ColorsWeplant.colorTextfield,
                  filled: true,
                  hintText: "Password",
                  hintStyle: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot password?',
                  style: GoogleFonts.poppins(
                      color: ColorsWeplant.colorPrimary, fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _buildBottom(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: BlocBuilder<LoginBloc, LoginAuthState>(builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            context
                .read<LoginBloc>()
                .add(Login(_usernameController.text, _passwordController.text));
          },
          child: Text(
            'Log in',
            style: GoogleFonts.poppins(),
          ),
        );
      }),
    );
  }
}
