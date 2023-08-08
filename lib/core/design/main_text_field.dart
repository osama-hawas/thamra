import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum InputType { phone, pass, normal, editPass }

class MainTextField extends StatefulWidget {
  final String text;
  void Function(String)? onChanged;
  final VoidCallback? onPress;
  final String? prefixIcon;
  final InputType type;
  final int minLines;

  final TextEditingController? controller;
  bool isObscure, isVisable = false, homeInput;

  MainTextField({
    Key? key,
    required this.text,
    this.prefixIcon,
    this.isObscure = false,
    this.onChanged,
    this.homeInput = false,
    this.type = InputType.normal,
    this.minLines = 1,
    this.controller,
    this.onPress,
  }) : super(key: key);

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 16.h),
        child: TextFormField(
          keyboardType: widget.type == InputType.phone
              ? TextInputType.phone
              : TextInputType.text,
          validator: (data) {
            if (data!.isEmpty) {
              return 'Field is empty';
            } else {
              return null;
            }
          },
          controller: widget.controller,
          enabled: widget.onPress == null,
          minLines: widget.minLines,
          maxLines: widget.isObscure ? 1 : null,
          textInputAction: TextInputAction.next,
          obscureText: widget.isObscure,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            filled: true,
            suffixIcon: widget.type == InputType.pass
                ? GestureDetector(
                    onTap: () {
                      widget.isVisable = !widget.isVisable;
                      widget.isObscure = !widget.isObscure;
                      setState(() {});
                    },
                    child: widget.isVisable
                        ? const Icon(Icons.visibility_sharp)
                        : const Icon(Icons.visibility_off_sharp))
                : widget.type == InputType.editPass
                    ? Image.asset(
                        "assets/icons/png/left.png",
                        fit: BoxFit.scaleDown,
                      )
                    : null,
            fillColor: widget.homeInput
                ? const Color(0xffB9C9A8).withOpacity(.13)
                : const Color(0xffFFFFFF),
            labelText: widget.text,
            alignLabelWithHint: true,
            labelStyle: TextStyle(
                color: widget.homeInput
                    ? const Color(0xffB9C9A8)
                    : const Color(0xffAFAFAF)),
            icon: widget.type == InputType.phone
                ? Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xffF3F3F3)),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        Image.asset('assets/icons/png/flag.png'),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          '999+',
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                : null,
            prefixIcon: widget.prefixIcon != null
                ? Image.asset(
                    widget.prefixIcon!,
                    fit: BoxFit.scaleDown,
                    height: 20.h,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Color(0xffF3F3F3))),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),

              borderSide: const BorderSide(
                color: Color(0xffF3F3F3),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
