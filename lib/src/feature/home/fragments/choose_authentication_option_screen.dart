import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChooseAuthenticationOptionScreen extends StatelessWidget {
  const ChooseAuthenticationOptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              "assets/images/main_logo_white.png",
              height: 200,
              width: 200,
            ),
            const SizedBox(height: 20,),
            ListTile(
              onTap: () {
                GoRouter.of(context).pushNamed("register");
              },
              leading: const Icon(Icons.mail, color: Colors.white,),
              title: Text("Continue with Email", style: Theme.of(context).textTheme
                  .bodySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),),
              trailing: const Icon(Icons.arrow_right, color: Colors.white),
              tileColor: Colors.green.shade400,
            ),
            ListTile(
              onTap: () {
                GoRouter.of(context).pushNamed("login");
              },
              title: Text("Login to an existing account",
                  style: Theme.of(context).textTheme
                      .bodySmall?.copyWith(fontWeight: FontWeight.bold)),
              trailing: const Icon(Icons.arrow_right),
            )
          ],
        ),
      ),
    );
  }
}
