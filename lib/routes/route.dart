import 'package:get/route_manager.dart';
import 'package:testing_project/views/home_view.dart';
import 'package:testing_project/views/login_view.dart';
import 'package:testing_project/views/post_opinion_view.dart';

class RoutesClass {
  static List<GetPage> routes = [
    GetPage(
        name: PostOpinionWidget.route, page: () => const PostOpinionWidget()),
    GetPage(name: HomeView.route, page: () => const HomeView()),
    GetPage(name: LoginView.route, page: () =>const LoginView())
  ];
}
