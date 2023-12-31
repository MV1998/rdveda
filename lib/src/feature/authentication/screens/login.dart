import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:rdveda/src/feature/authentication/login_bloc/login_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is FailedLoginState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }

          if (state is SuccessLoginState) {
            ScaffoldMessenger.of(context).removeCurrentSnackBar();
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Successful logged in")));
          }
        },
        builder: (context, state) {
          if (state is LoadingLoginState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          // if (state is SuccessLoginState) {
          //
          // }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/main_logo_white.png",
                  height: 200,
                  width: 200,
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: usernameTextEditingController,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Email",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade50)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: passwordTextEditingController,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        fillColor: Colors.grey.shade200,
                        filled: true,
                        hintText: "Password",
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade50)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2))),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LoginBloc>().add(LoginRequestedEvent(
                          usernameTextEditingController.text.trim(),
                          passwordTextEditingController.text.trim()));
                    },
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Sign up"),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
