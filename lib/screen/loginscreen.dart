import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:login_ui/data/bloc.dart';
import 'package:login_ui/utils/utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.android,
                      size: 100,
                    ),
                    Gap(40),
                    Text(
                      'Hello There!',
                      style: Styles.heading,
                    ),
                    Gap(10),
                    Text(
                      'Welcome Back, You\'ve been missed',
                      style: Styles.heading2,
                    ),
                    Gap(50),
                    emailField(),
                    Gap(20),
                    passField(),
                    Gap(20),
                    sigIn(),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Not a member',
                          style: Styles.miText,
                        ),
                        Gap(10),
                        Text(
                          'Register Now',
                          style: Styles.miText.copyWith(color: Colors.blue),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return StreamBuilder(
      stream: bloc.email,
      builder: ((context, snapshot) {
        return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                onChanged: bloc.emailOn,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Email',
                  errorText: snapshot.error?.toString(),
                ),
              ),
            ));
      }),
    );
  }

  Widget passField() {
    return StreamBuilder(
        stream: bloc.pass,
        builder: (context, snapshot) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: TextField(
                onChanged: bloc.passOn,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'password',
                  errorText: snapshot.error?.toString(),
                ),
              ),
            ),
          );
        });
  }

  Widget sigIn() {
    return StreamBuilder<Object>(
        stream: bloc.submitValid,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: snapshot.hasData ? () {} : null,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  'Sign In',
                  style: Styles.miText.copyWith(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
