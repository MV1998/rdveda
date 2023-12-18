
import 'dart:async';

import 'package:flutter/material.dart';

class RegistrationProvider extends ChangeNotifier {
  late TextEditingController firstNameTextEditingController;
  late TextEditingController lastNameTextEditingController;
  late TextEditingController emailTextEditingController;
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;
  bool hasDisposed = false;
  bool enabledPromotions = false;
  bool agreedTermsAndServices = false;

  void init() {
    firstNameTextEditingController = TextEditingController();
    lastNameTextEditingController = TextEditingController();
    emailTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
  }

  void doDispose() {
    firstNameTextEditingController.dispose();
    lastNameTextEditingController.dispose();
    emailTextEditingController.dispose();
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    hasDisposed = true;
  }

  void setPromotions() {
    enabledPromotions = !enabledPromotions;
    notifyListeners();
  }

  void setTermsAndServices() {
    agreedTermsAndServices = !agreedTermsAndServices;
    notifyListeners();
  }

  void createAccount() {

  }
}