import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:testing_project/GetX/bindings/biniding.dart';
import 'package:testing_project/routes/route.dart';
import 'package:testing_project/views/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      initialBinding: BindingManager(),
      debugShowCheckedModeBanner: false,
      initialRoute: LoginView.route,
      getPages: RoutesClass.routes,
      home: const LoginView(),
      theme: ThemeData(
        fontFamily: 'HelveticaNeue',
        splashColor: Colors.transparent,
        indicatorColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
  );
}
