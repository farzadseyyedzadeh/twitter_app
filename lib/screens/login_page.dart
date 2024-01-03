import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_app/screens/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final RegExp validEmail = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FaIcon(
                FontAwesomeIcons.twitter,
                size: 75,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Log in to twitter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter an email';
                    } else if (!validEmail.hasMatch(value)) {
                      return 'Please enter a valid email';
                    } else {
                      return null;
                    }
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'email:',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 2, horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20)),
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your password';
                    } else if (value.length < 6) {
                      return 'password must be at least 6 characters';
                    } else {
                      return null;
                    }
                  },
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      labelText: 'password:', border: InputBorder.none),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('forgot password?'),
              ),
              Container(
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    if (_loginKey.currentState!.validate()) {
                      print(_emailController.text);
                      print(_passwordController.text);
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New to Twitter?'),
                  TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) {
                            return const SignupPage();
                          },
                        ));
                      },
                      child: const Text(
                        'sign up now',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
