import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:testing_project/GetX/controllers/auth_controller.dart';
import 'package:testing_project/widget/textField_widget.dart';
import 'package:testing_project/widget/text_widget.dart';

class LoginView extends StatefulWidget {
  static const route = '/login-view';
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      animationDuration: Duration(milliseconds: 1),
      length: 2,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 249, 246, 246),
        body: Center(
          child: Column(
            spacing: 10.0,
            children: [
              const Gap(100),
              TextWidget(
                text: "My Puk",
                color: Color(0xFF4DBF71),
                fontSize: 42.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'ClashDisplay',
              ),
              TextWidget(
                text: "Welcome to my PUK",
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'ClashDisplay',
              ),
              TextWidget(
                text:
                    "Sign up or login bellow to discover all \n               you want to know.",
                color: const Color(0xFF41525C99),
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.fade,
                fontFamily: 'ClashDisplay',
              ),
              TabBar(
                splashBorderRadius: BorderRadius.circular(5),
                labelStyle: TextStyle(
                  color: Color(0xFF4DBF71),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelColor: Color(0xFFD9D9D9),
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Color(0xFF4DBF71),
                tabs: [
                  Tab(
                    child: TextWidget(
                      text: "Login",
                    ),
                  ),
                  Tab(
                    child: TextWidget(
                      text: "SignUp",
                    ),
                  ),
                ],
                controller: controller,
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [
                    // First Tab
                    FirstTab(),
                    //Second Tab
                    SecondTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondTab extends StatefulWidget {
  const SecondTab({
    super.key,
  });

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  late TextEditingController fullNameController;
  late TextEditingController emailandPhoneController;
  late TextEditingController passwordController;
  late TextEditingController confrmPassController;

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailandPhoneController = TextEditingController();
    passwordController = TextEditingController();
    confrmPassController = TextEditingController();
    super.initState();
  }

  bool passObscure = true;
  bool confirmpassObscure = true;
  bool _isPasswordEightCharacters = false;
  bool hasPasswordOneNumber = false;
  bool? isChecked = false;
  onPasswordChanged(String password) {
    final numericRegex = RegExp(r'[0-9]');

    setState(() {
      _isPasswordEightCharacters = false;
      if (password.length >= 8) {
        _isPasswordEightCharacters = true;
      }

      hasPasswordOneNumber = false;
      if (numericRegex.hasMatch(password)) {
        hasPasswordOneNumber = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        spacing: 14.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextfieldWidget(
            prefixIcon: Icons.person_outline_outlined,
            hintText: "Full Name",
            textInputType: TextInputType.text,
            controller: fullNameController,
          ),
          TextfieldWidget(
            prefixIcon: Icons.email_outlined,
            hintText: "Email Address or Phone Number",
            textInputType: TextInputType.text,
            controller: emailandPhoneController,
          ),
          TextfieldWidget(
            onChanged: (password) => onPasswordChanged(password ?? ''),
            onPressed: () {
              setState(() {
                passObscure = !passObscure;
              });
            },
            iconObscureText: passObscure,
            suffixIcon: passObscure ? Icons.visibility : Icons.visibility_off,
            prefixIcon: Icons.lock_outline_rounded,
            hintText: "Password",
            textInputType: TextInputType.visiblePassword,
            controller: passwordController,
          ),
          TextfieldWidget(
            onPressed: () {
              setState(() {
                confirmpassObscure = !confirmpassObscure;
              });
            },
            iconObscureText: confirmpassObscure,
            suffixIcon:
                confirmpassObscure ? Icons.visibility : Icons.visibility_off,
            prefixIcon: Icons.lock_outline_rounded,
            hintText: "Confirm Password",
            textInputType: TextInputType.visiblePassword,
            controller: confrmPassController,
          ),
          Row(
            spacing: 5,
            children: [
              AnimatedContainer(
                width: 20,
                height: 20,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: _isPasswordEightCharacters
                        ? Color(0xFF4DBF71)
                        : Colors.transparent,
                    border: _isPasswordEightCharacters
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              TextWidget(
                text: "Contains at least 8 Character",
                color: Colors.grey.shade400,
              ),
            ],
          ),
          Row(
            spacing: 5,
            children: [
              AnimatedContainer(
                width: 20,
                height: 20,
                duration: Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    color: hasPasswordOneNumber
                        ? Color(0xFF4DBF71)
                        : Colors.transparent,
                    border: hasPasswordOneNumber
                        ? Border.all(color: Colors.transparent)
                        : Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(50)),
                child: Center(
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 15,
                  ),
                ),
              ),
              TextWidget(
                text: "Contains at least 1 Number",
                color: Colors.grey.shade400,
              ),
            ],
          ),
          // Row(
          //   spacing: 5,
          //   children: [
          //     AnimatedContainer(
          //       width: 20,
          //       height: 20,
          //       duration: Duration(milliseconds: 500),
          //       decoration: BoxDecoration(
          //           color: _isPasswordEightCharacters
          //               ? Color(0xFF4DBF71)
          //               : Colors.transparent,
          //           border: _isPasswordEightCharacters
          //               ? Border.all(color: Colors.transparent)
          //               : Border.all(color: Colors.grey.shade400),
          //           borderRadius: BorderRadius.circular(50)),
          //       child: Center(
          //         child: Icon(
          //           Icons.check,
          //           color: Colors.white,
          //           size: 15,
          //         ),
          //       ),
          //     ),
          //     TextWidget(
          //       text: "Both upper and lower case letters",
          //       color: Colors.grey.shade400,
          //     ),
          //   ],
          // ),
          // const Gap(5.0),
          Row(
            children: [
              Expanded(
                child: Checkbox(
                    value: isChecked,
                    activeColor: Color(0xFF4DBF71),
                    onChanged: (newBool) {
                      setState(() {
                        isChecked = newBool;
                      });
                    }),
              ),
              TextWidget(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                  text:
                      "By agreeing to the terms and conditions, you are \nentering into a legally binding contract with the service \nprovider.")
            ],
          ),
          GetBuilder(
              init: AuthController.to,
              builder: (controller) {
                return LoginButtonWidget(
                    onTab: () async {
                      // final success =
                      await controller.signUp(
                        emailandPhoneController.text.trim(),
                        passwordController.text.trim(),
                      );

                      // if (success) {
                      Get.toNamed('home-view');
                      // } else {
                      //   log("Registration unsuccessfull");
                      // }
                    },
                    isIcon: false,
                    text: "SignUp",
                    btnColor: Color(0xFF4DBF71),
                    textColor: Colors.white,
                    borderColor: Colors.transparent);
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: "Discover as ",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('home-view');
                },
                child: TextWidget(
                  text: "Guest",
                  color: Color(0xFF4DBF71),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FirstTab extends StatefulWidget {
  const FirstTab({
    super.key,
  });

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab>
    with SingleTickerProviderStateMixin {
  late TextEditingController emailController;
  late TextEditingController passController;

  @override
  void initState() {
    emailController = TextEditingController();
    passController = TextEditingController();
    super.initState();
  }

  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 15,
        children: [
          LoginButtonWidget(
            onTab: () {},
            isIcon: true,
            cirlceSize: 16,
            text: "Sign in with google",
            image: 'assets/icons/google.png',
            btnColor: Colors.white,
            textColor: Colors.black,
            borderColor: Colors.black,
          ),
          LoginButtonWidget(
            onTab: () {},
            isIcon: true,
            cirlceSize: 25,
            text: "Continue with facebook",
            image: 'assets/icons/facebook.png',
            btnColor: Colors.blue,
            textColor: Colors.white,
            borderColor: Colors.transparent,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 1.5,
                  thickness: .5,
                ),
              ),
              TextWidget(
                text: "OR CONTINUE WITH EMAIL",
                color: Colors.grey,
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey,
                  height: 1.5,
                  thickness: .5,
                ),
              ),
            ],
          ),
          TextfieldWidget(
            controller: emailController,
            hintText: "Email Address or Phone Number",
            textInputType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
          ),
          TextfieldWidget(
            onPressed: () {
              setState(() {
                isSelected = !isSelected;
              });
            },
            controller: passController,
            iconObscureText: isSelected,
            hintText: "Password",
            textInputType: TextInputType.visiblePassword,
            prefixIcon: Icons.lock_outline,
            suffixIcon: isSelected ? Icons.visibility : Icons.visibility_off,
          ),
          Row(
            children: [
              const Spacer(),
              TextWidget(
                text: "FORGOT PASSWORD?",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ],
          ),
          LoginButtonWidget(
              onTab: () {
                Get.toNamed('home-view');
              },
              isIcon: false,
              text: "Login",
              btnColor: Color(0xFF4DBF71),
              textColor: Colors.white,
              borderColor: Colors.transparent),
          const Gap(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextWidget(
                text: "Discover as ",
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed('home-view');
                },
                child: TextWidget(
                  text: "Guest",
                  color: Color(0xFF4DBF71),
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.text,
    this.image,
    required this.btnColor,
    required this.textColor,
    this.cirlceSize,
    required this.borderColor,
    required this.isIcon,
    required this.onTab,
  });

  final String text;
  final String? image;
  final Color btnColor;
  final Color textColor;
  final double? cirlceSize;
  final Color borderColor;
  final bool isIcon;
  final VoidCallback onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        width: double.infinity,
        height: 60.7,
        decoration: BoxDecoration(
            color: btnColor,
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(23.51)),
        child: Row(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isIcon == true)
              CircleAvatar(
                radius: cirlceSize,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(image ?? ''),
              ),
            TextWidget(
              text: text,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}
