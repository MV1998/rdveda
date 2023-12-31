import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../fragments/choose_authentication_option_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RDVeda"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      drawer: Drawer(
        clipBehavior: Clip.none,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DrawerHeader(
                child: Text(""),
              ),
              ListTile(
                leading: const Icon(FontAwesomeIcons.user),
                title: Text("Login/Register", style: Theme.of(context).textTheme.bodySmall,),
                trailing: const Icon(FontAwesomeIcons.x),
              ),
              ListTile(
                onTap: () {
                  GoRouter.of(context).pushNamed("all_product");
                },
                leading: const Icon(FontAwesomeIcons.home),
                title: Text("Home", style: Theme.of(context).textTheme.bodySmall,),
              ),
            ],
          ),
        ),
      ),
      body: const BuildBodyUI(),
    );
  }
}

class BuildBodyUI extends StatelessWidget {
  const BuildBodyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return const ChooseAuthenticationOptionScreen();
  }
}
