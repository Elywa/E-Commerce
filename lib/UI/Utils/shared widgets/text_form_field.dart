import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldItem extends StatefulWidget {
  TextFieldItem(
      {super.key,
      required this.hintText,
      required this.label,
      this.suffixIcon,
      required this.validator,
      required this.textController,
      this.keyboardTupe,
      this.isPassword = false}); // Add isPassword parameter

  final String hintText;
  final String label;
  final TextInputType? keyboardTupe;
  final Widget? suffixIcon;
  final TextEditingController textController;
  final bool isPassword;
  final String? Function(String?)? validator;
  @override
  State<TextFieldItem> createState() => _TextFieldItemState();
}

class _TextFieldItemState extends State<TextFieldItem> {
  bool isObsecure = true; // Initialize as true for password hiding

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16, bottom: 25.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 24.h),
            child: Text(
              widget.label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          TextFormField(
            validator: widget.validator,
            keyboardType: widget.keyboardTupe,
            obscureText: widget.isPassword
                ? isObsecure
                : false, // Obscure text only for password fields
            controller: widget.textController,
            decoration: InputDecoration(
              // Show suffix icon only if the field is a password field
              suffixIcon: widget.isPassword
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isObsecure = !isObsecure; // Toggle text visibility
                        });
                      },
                      child: Icon(
                        isObsecure
                            ? Icons.visibility
                            : Icons
                                .visibility_off, // Change icon based on state
                      ),
                    )
                  : null,
              hintText: widget.hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black.withOpacity(.5), fontSize: 16),
              filled: true,
              fillColor: AppColors.whiteColor,
              focusedBorder: buildBorders(AppColors.lightBlue, 16),
              enabledBorder: buildBorders(AppColors.lightBlue, 16),
            ),
          ),
        ],
      ),
    );
  }
}
