import 'dart:convert';

import 'package:get/get.dart';
import 'package:testing_project/services/remote_service.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find(tag: 'auth-controller');

  String? token;

  Future<bool> signUp(String email, String password) async {
    final String apiUrl = 'http://192.168.1.5:2025/api/auth/register';
    // Replace with your API URL

    try {
      final response = await RemoteService().post(
        url: apiUrl,
        body: ({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        token = data['token'];
        // cache to local storage.

        //shared preferences
        // get storage.

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    final String apiUrl = 'http://192.168.1.5:2025/api/auth/login';
    // Replace with your API URL

    try {
      final response = await RemoteService().post(
        url: apiUrl,
        body: ({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        token = data['token'];
        // cache to local storage.

        //shared preferences
        // get storage.

        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
