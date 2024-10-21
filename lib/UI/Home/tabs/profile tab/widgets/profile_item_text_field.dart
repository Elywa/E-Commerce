import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileItemTextField extends StatelessWidget {
  const ProfileItemTextField(
      {super.key,
      required this.textController,
      required this.label,
      this.isObsecure});

  final TextEditingController textController;
  final String label;
  final bool? isObsecure;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 25.h, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.black, fontSize: 20),
            ),
          ),
          TextFormField(
            obscureText: isObsecure ?? false,
            controller: textController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.border_color,
                  size: 16,
                ),
              ),
              filled: true,
              fillColor: AppColors.whiteColor,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 170, 204, 239),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(
                  color: Color.fromARGB(255, 196, 220, 244),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
