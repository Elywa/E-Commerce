import 'package:e_commerce/UI/Auth/Login/login_view.dart';
import 'package:e_commerce/UI/Home/tabs/profile%20tab/widgets/profile_item_text_field.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/shared_preference.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTabViewBody extends StatelessWidget {
  ProfileTabViewBody({super.key});
  TextEditingController emailController =
      TextEditingController(text: 'aeliwa13@gmail.com');
  TextEditingController passwordController =
      TextEditingController(text: '779979999999999999999');
  TextEditingController nameController =
      TextEditingController(text: 'Ahmed Mohamed Omer Eliwa');
  TextEditingController phoneNumberController =
      TextEditingController(text: '01060807019');
  TextEditingController addressController =
      TextEditingController(text: 'Damietta - Faraskour - Elroda city');
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Padding(
              //   padding: EdgeInsets.only(top: 6.h, right: 348.w, bottom: 16.h),
              //   child: const SizedBox(
              //     width: 66,
              //     height: 22,
              //     child: Image(
              //       image: AssetImage('assets/images/route_image.png'),
              //       fit: BoxFit.fill,
              //     ),
              //   ),
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.h),
                    child: Text(
                      'Welcome, Ahmed',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.primaryColor, fontSize: 20),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        MySharedPrefrence.removeData(key: 'Token');
                        Navigator.pushNamedAndRemoveUntil(
                            context, LoginView.loginViewId, (route) => false);
                      },
                      icon: const Icon(
                        Icons.logout,
                        size: 20,
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40.h),
                child: Text(
                  'aeliwa13@gmail.com',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey, fontSize: 14),
                ),
              ),
              ProfileItemTextField(
                textController: nameController,
                label: 'Your Full Name',
              ),
              ProfileItemTextField(
                textController: emailController,
                label: 'Your Email',
              ),
              ProfileItemTextField(
                textController: passwordController,
                label: 'Your Password',
                isObsecure: true,
              ),
              ProfileItemTextField(
                  textController: phoneNumberController, label: 'Your Number'),
              ProfileItemTextField(
                  textController: addressController, label: 'Your Address')
            ],
          ),
        ),
      ),
    );
  }
}
