import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
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
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Email",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade50)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            SizedBox(
              height: 60,
              child: TextField(
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: "Password",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade50)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2))),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
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
      ),
    );
  }
}
