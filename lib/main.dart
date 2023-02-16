import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:log_in_form_flutter/bloc/login/login_bloc.dart';
import 'package:log_in_form_flutter/bloc/login/login_event.dart';
// import 'package:log_in_form_flutter/data/sp_helper.dart';

import 'package:log_in_form_flutter/screens/log_out_screen.dart';
import 'package:log_in_form_flutter/theme/change_button.dart';
import 'package:log_in_form_flutter/theme/theme.dart';
import 'package:provider/provider.dart';
import 'bloc/login/login_state.dart';

import 'screens/create_acc_screen.dart';
import 'screens/forgot_pass_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// ThemeModel model = ThemeModel();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            themeMode: themeProvider.themeMode,
            theme: MyThemes.lightTheme,
            darkTheme: MyThemes.darkTheme,
            debugShowCheckedModeBanner: false,
            home: const MyHomePage(),
          );
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showPassword = false;
  final _ekey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, loginState) {
          if (loginState.status == LoginStateStatus.submitted) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LogOut()));
          }
        },
        builder: (context, loginState) {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              actions: const [ChangeButton()],
              elevation: 0,
            ),

            // backgroundColor: Colors.white,
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _ekey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(flex: 2),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Login',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),

                    // EMAIL
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Please sign in to continue',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) => context.read<LoginBloc>().add(LoginUpdateEvent(model: loginState.model.copyWith(username: value))),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.mail_outline),
                        hintText: 'Enter email ✔',
                        labelText: 'Email *',
                      ),
                      validator: (String? value) {
                        RegExp regex = RegExp(r'^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
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

                    // Password
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        onChanged: (value) => context.read<LoginBloc>().add(LoginUpdateEvent(model: loginState.model.copyWith(password: value))),
                        obscureText: !_showPassword,
                        decoration: InputDecoration(
                          icon: const Icon(Icons.lock_outline),
                          hintText: 'Enter password ✔',
                          labelText: 'Password *',
                          suffix: IconButton(
                            splashRadius: 15,
                            icon: Icon(
                              Icons.remove_red_eye,
                              color: _showPassword ? Colors.deepPurpleAccent : Colors.grey,
                            ),
                            onPressed: () {
                              setState(() => _showPassword = !_showPassword);
                            },
                          ),
                        ),
                        validator: (String? value) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: ((context) => const MyForgotPasswScreen())));
                          },
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      ],
                    ),

                    // LOGIN BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_ekey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Processing Data')),
                              );
                              context.read<LoginBloc>().add(LoginSubmitEvent());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Ne valja')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor: Colors.deepPurple,
                            elevation: 10,
                            shadowColor: Colors.deepPurpleAccent,
                          ),
                          child: Row(
                            children: const [
                              Text(
                                'LOGIN',
                                style: TextStyle(fontSize: 20),
                              ),
                              Icon(Icons.arrow_right),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     () => model.toggleMode();
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     shape: const StadiumBorder(),
                    //     backgroundColor: const Color.fromARGB(255, 252, 181, 75),
                    //     elevation: 10,
                    //     shadowColor: Colors.orangeAccent,
                    //   ),
                    //   child: Row(
                    //     children: const [
                    //       Text(
                    //         'change theme',
                    //         style: TextStyle(fontSize: 20),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    const Spacer(flex: 1),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Don\'t have an account yet? '),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: ((context) => const MyCreateAccScreen())));
                              },
                              child: const Text('Sign Up'),
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
        },
      ),
    );
  }
}

class ThemeModel with ChangeNotifier {
  ThemeMode _mode;
  ThemeMode get mode => _mode;
  ThemeModel({ThemeMode mode = ThemeMode.light}) : _mode = mode;

  void toggleMode() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
