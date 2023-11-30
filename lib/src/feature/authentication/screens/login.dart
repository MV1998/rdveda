import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rdveda/src/common_ui_components/products_ui/product_card.dart';
import 'package:rdveda/src/feature/authentication/domain/repository/authentication.dart';
import 'package:rdveda/src/feature/authentication/domain/services/authenticator_manager.dart';
import 'package:rdveda/src/feature/authentication/domain/services/firebase_authentication.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late TextEditingController phoneNumberTextEditingController;

  @override
  void initState() {
    phoneNumberTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = (MediaQuery.of(context).size.width / 2) - 5;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: Image(
                height: 300,
                width: 300,
                image: AssetImage("assets/images/main_logo_white.png"),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: phoneNumberTextEditingController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45, width: 1,
                              style: BorderStyle.solid)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black45, width: 1,
                              style: BorderStyle.solid)
                      ),
                      hintStyle: TextStyle(color: Colors.black45, ),
                      hintText: "Phone Number",
                    ),
                    cursorColor: Colors.black45,
                    style: const TextStyle(color: Colors.black45),
                  ),
                  const SizedBox(height: 20,),
                  TextButton(
                    onPressed: () {
                      Authentication authentication = FirebaseAuthentication("7999646778", context);
                      AuthenticatorManager ma = AuthenticatorManager(authentication);
                      ma.authenticate();
                    },
                    child: Text("Sign In", style: Theme.of(context).textTheme.bodyMedium,),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              Container(
                margin: const EdgeInsets.all(15),
                child: const Text(
                  "- BestSeller -",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 325,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) {
                    return ProductCard(
                        id: index,
                        cardWidth: width,
                        offPercentage: index.toString(),
                        productName: "Luxury Perfume Gift Set For Man - 4x20ml",
                        imageURL:
                            "https://bellavitaorganic.com/cdn/shop/products/ManBox-01_765x.jpg?v=1652421642",
                        isLiked: false,
                        price: ((index + 1) * 1000).toString(),
                        onAdd: () {},
                        onLike: () {});
                  },
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

/*
   ElevatedButton(
            onPressed: () {
              User? user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                print(user.uid);
                print(user.email);
                print(user.phoneNumber);
                print(user.photoURL);
                try {
                  user.sendEmailVerification();
                } on FirebaseAuthException catch (e) {
                  print(e.code);
                  print(e.message);
                }
              } else {
                signInWithGoogle(context: context);
              }
            },
            child: const Text("Login"),
          ),
   */

  void startAuthenticate(String number) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: "+91 $number",
      verificationCompleted: (PhoneAuthCredential credential) {

      },
      verificationFailed: (FirebaseAuthException e) {

      },
      codeSent: (String verificationId, int? resendToken) {
        print("-----> $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }
}
