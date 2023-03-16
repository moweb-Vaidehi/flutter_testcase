import 'package:flutter/material.dart';

class LoginDesign extends StatefulWidget {
  const LoginDesign({super.key});

  @override
  State<LoginDesign> createState() => _LoginDesignState();
}

class _LoginDesignState extends State<LoginDesign> {
  final passwordController = TextEditingController(text: 'password');

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.orange,
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
                height: 20.0,
              ),
              SizedBox(
                height: 60.0,
                width: 300.0,
                child: ElevatedButton(
                  key: const Key('login_btn'),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.orange,
                    ),
                  ),
                  onPressed: () {
                    // print('Text field input - ${emailAddressController.text}');
                    // BlocProvider.of<LoginBloc>(context).add(LoginAPIEvents(
                    //     emailId: emailAddressController.text,
                    //  password: passwordController.text));
                  },
                  child: const Text(
                    'Login',
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
  final emailAddressController =
      TextEditingController(text: 'calendar_test@gmail.com');

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
