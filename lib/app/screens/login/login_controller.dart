import 'dart:convert';
import 'package:crypto/crypto.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_asignment/app/screens/home/home_view.dart';
import 'package:http/http.dart' as http;
import 'package:login_asignment/app/utils/api_endpoints.dart';
import 'package:login_asignment/app/utils/app_strings.dart';

class LoginController extends GetxController {
  var isButtonActive = false.obs;
  TextEditingController usernameC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  // final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    var bytes = utf8.encode(passwordC.text); // data being hashed
    var digest = sha256.convert(bytes);
    // print("Digest as hex string: $digest");
    var headers = {
      'Authorization': ApiEndPoints.headers,
    };
    var url = Uri.parse(ApiEndPoints.baseUrl);

    var body = {
      'username': usernameC.text,
      'password': digest.toString(),
      'grant_type': AppStrings.password,
    };

    http.Response response = await http.post(url, body: body, headers: headers);

    if (response.statusCode == 200) {
      usernameC.clear();
      passwordC.clear();
      Get.to(() => const HomeScreen());
    } else if (response.statusCode == 401) {
      final data = json.decode(response.body);
      String message = data['status']['message'].toString();
      showDialog(
        context: Get.context!,
        builder: (context) => SimpleDialog(
          title: const Text(
            AppStrings.somethingWentWrong,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 50),
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(message),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      );
    } else {
      // Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) => const SimpleDialog(
          title: Text(AppStrings.invalidUsernamePassword),
        ),
      );
    }
  }
}
