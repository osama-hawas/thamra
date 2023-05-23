import 'package:flutter/material.dart';

enum InputType { phone, pass, normal }

class Input extends StatefulWidget {
  final String text;
  void Function(String)? onChanged;
  final String? prefixIcon;
  final InputType type;
  final int minLines;
  final TextEditingController? controller;
  bool isObscure, isVisable = false, homeInput;


  Input(
      {Key? key,
      required this.text,
      this.prefixIcon,
      this.isObscure = false,
      this.onChanged,
      this.homeInput = false,
      this.type = InputType.normal,
      this.minLines = 1,  this.controller})
      : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16, end: 16, bottom: 16),
      child: TextFormField(
        validator: (data) {
          if (data!.isEmpty) {
            return 'Field is empty';
          } else {
            return null;
          }
        },
        controller: widget.controller,
        minLines: widget.minLines,
        maxLines: 7,
        textInputAction: TextInputAction.next,
        obscureText:widget.minLines>1? widget.isObscure:false,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
          filled: true,
          suffixIcon: widget.type == InputType.pass
              ? IconButton(
                  onPressed: () {
                    widget.isObscure = !widget.isObscure;
                    widget.isVisable = !widget.isVisable;
                    setState(() {});
                  },
                  icon: widget.isVisable
                      ? Icon(Icons.visibility_sharp)
                      : Icon(Icons.visibility_off_sharp),
                )
              : null,
          fillColor: widget.homeInput
              ? Color(0xffB9C9A8).withOpacity(.13)
              : Color(0xffFFFFFF),
          labelText: widget.text,

          alignLabelWithHint: true,
          labelStyle: TextStyle(
              color: widget.homeInput ? Color(0xffB9C9A8) : Color(0xffAFAFAF)),
          icon: widget.type == InputType.phone
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xffF3F3F3)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Image.asset('assets/icons/flag.png'),
                      const SizedBox(
                        height: 2,
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
              ? Image.asset(widget.prefixIcon!)
              : null,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xffF3F3F3))),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Color(0xffF3F3F3)),
          ),
        ),
      ),
    );
  }
}