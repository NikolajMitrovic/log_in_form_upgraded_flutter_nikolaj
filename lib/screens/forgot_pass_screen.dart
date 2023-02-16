import 'package:flutter/material.dart';

class MyForgotPasswScreen extends StatefulWidget {
  const MyForgotPasswScreen({super.key});

  @override
  State<MyForgotPasswScreen> createState() => _MyForgotPasswScreenState();
}

class _MyForgotPasswScreenState extends State<MyForgotPasswScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey,
              size: 28,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Spacer(
              flex: 1,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Forgot your password?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Please enter your emali and we will send you authentication form',
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),

            //Email
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.mail_outline),
                hintText: 'Enter email 📩',
                labelText: 'Email *',
              ),
              validator: (String? value) {
                RegExp regex = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
                if (value!.isEmpty) {
                  return 'Please enter email';
                } else {
                  if (!regex.hasMatch(value)) {
                    return 'Please enter valid email';
                  } else {
                    return null;
                  }
                }
              },
            ),

            //Sign In Button
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.deepPurple,
                      elevation: 10,
                      shadowColor: Colors.deepPurpleAccent,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Send Email',
                          style: TextStyle(fontSize: 18),
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Already have an acc
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? '),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Log In'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
