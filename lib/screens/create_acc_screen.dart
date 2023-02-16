import 'package:flutter/material.dart';
import 'package:log_in_form_flutter/screens/log_out_screen.dart';

class MyCreateAccScreen extends StatefulWidget {
  const MyCreateAccScreen({super.key});

  @override
  State<MyCreateAccScreen> createState() => _MyCreateAccScreenState();
}

class _MyCreateAccScreenState extends State<MyCreateAccScreen> {
  final _fnKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final cpasswordController = TextEditingController();
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.grey,
              size: 28,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _fnKey,
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
                  'Create Account',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Please create account to continue',
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
              ),

              //Full Name
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.person_outline),
                  hintText: 'Enter full name 👩‍🦲',
                  labelText: 'Full Name *',
                ),
                validator: (name) {
                  String pattern = r'^[A-Za-z]+(?: [A-Za-z]+)*$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(name!)) {
                    return 'Invalid username';
                  } else {
                    return null;
                  }
                },
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

              //Password
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  obscureText: !_showPassword,

                  controller: passwordController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.lock_outline),
                    hintText: 'Enter password 🔐',
                    labelText: 'Password *',
                    suffix: IconButton(
                      splashRadius: 15,
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: _showPassword ? Colors.deepPurple : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => _showPassword = !_showPassword);
                      },
                    ),
                  ),
                  // onSaved: (String? value) {},
                  validator: (String? value) {
                    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else {
                      if (!regex.hasMatch(value)) {
                        return 'Enter valid password';
                      } else {
                        return null;
                      }
                    }
                  },
                ),
              ),

              //Password confirmation
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  obscureText: !_showPassword,
                  controller: cpasswordController,
                  decoration: InputDecoration(
                    icon: const Icon(Icons.check),
                    hintText: 'Confirm password ✔',
                    labelText: 'Confirm Password *',
                    suffix: IconButton(
                      splashRadius: 15,
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: _showPassword ? Colors.blue : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() => _showPassword = !_showPassword);
                      },
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please enter password';
                    } else if (passwordController.text != cpasswordController.text) {
                      return 'Passwords must match';
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              //Sign In Button
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_fnKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          Navigator.push(context, MaterialPageRoute(builder: ((context) => const LogOut())));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Ne valja')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                        backgroundColor: const Color.fromARGB(255, 252, 181, 75),
                        elevation: 10,
                        shadowColor: Colors.orangeAccent,
                      ),
                      child: Row(
                        children: const [
                          Text(
                            'SIGN UP',
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
      ),
    );
  }
}
