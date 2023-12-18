import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rdveda/src/feature/authentication/providers/registration_provider.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late RegistrationProvider registrationProvider;

  @override
  void initState() {
    registrationProvider = Provider.of(context, listen: false);
    registrationProvider.init();
    super.initState();
  }

  @override
  void dispose() {
    registrationProvider.doDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQueryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: mediaQueryData.viewInsets.bottom == 0.0
                  ? mediaQueryData.size.height / 8
                  : 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hello! Register now to get started",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller:
                            registrationProvider.firstNameTextEditingController,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "First Name",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 60,
                      child: TextField(
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        controller:
                            registrationProvider.lastNameTextEditingController,
                        decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            hintText: "Last Name",
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade50)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 2))),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: registrationProvider.emailTextEditingController,
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
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  controller:
                      registrationProvider.passwordTextEditingController,
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
                height: 60,
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  controller:
                      registrationProvider.confirmPasswordTextEditingController,
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 10),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      hintText: "Confirm Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade50)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 2))),
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  registrationProvider.setPromotions();
                },
                child: Row(
                  children: [
                    Consumer<RegistrationProvider>(
                      builder: (_, value, child) {
                        return Checkbox.adaptive(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          value: value.enabledPromotions,
                          onChanged: (value) {
                            registrationProvider.setPromotions();
                          },
                        );
                      },
                    ),
                    Flexible(
                      child: Text(
                        "Agree to receive promotions and news by email",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  registrationProvider.setTermsAndServices();
                },
                child: Row(
                  children: [
                    Consumer<RegistrationProvider>(
                      builder: (_, value, child) {
                        return Checkbox.adaptive(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          visualDensity: VisualDensity.compact,
                          value: value.agreedTermsAndServices,
                          onChanged: (value) {
                            registrationProvider.setTermsAndServices();
                          },
                        );
                      },
                    ),
                    Flexible(
                      child: Text(
                        "I agree to the Terms of Service",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    registrationProvider.createAccount();
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text("Register"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text("Login Now"),
                  ),
                ],
              )
            ],
          ),
        ),
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
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        print("-----> $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}

/*
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
 */
