import 'package:flutter/material.dart';

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
          drawer: const Drawer(),
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
