import 'package:flutter/material.dart';
import 'package:flutter_testcase/screens/home_screen.dart';

class LoginDesign extends StatefulWidget {
  const LoginDesign({super.key});

  @override
  State<LoginDesign> createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SetEmailField(),
              const SizedBox(
                height: 10.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: TextFormField(
                  key: const Key('password'),
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: ElevatedButton(
                  key: const Key('login_btn'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.blueAccent,
                    ),
                  ),
                  onPressed: () {
                    var snackBar =
                        const SnackBar(content: Text('Button Pressed'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    Future.delayed(const Duration(milliseconds: 1000), () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    });
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SetEmailField extends StatelessWidget {
  final emailAddressController = TextEditingController();

  SetEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.0,
      width: 300.0,
      child: TextField(
        controller: emailAddressController,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Email',
        ),
      ),
    );
  }
}
