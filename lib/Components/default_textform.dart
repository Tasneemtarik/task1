import 'package:flutter/material.dart';

class defaultTextForm extends StatelessWidget {
  defaultTextForm(
      {super.key,
      required this.text,
      required this.icon,
      required this.controllerr,
      required this.func,
      this.onchanged,
      required this.type});
  String? text;
  Icon? icon;
  TextEditingController? controllerr;
  String? Function(String?)? func;
 Function(String)? onchanged;
  TextInputType? type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextFormField(onChanged: onchanged,
        keyboardType: type,
        controller: controllerr,
        validator: func,
        decoration: InputDecoration(
            hintText: text,
            // focusColor: Color(0xffaf164a),

            border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffaf164a), width: 2),
                borderRadius: BorderRadius.circular(20)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffaf164a), width: 2),
                borderRadius: BorderRadius.circular(20)),
            prefixIcon: icon,
            prefixIconColor: Color(0xffaf164a)),
      ),
    );
  }
}
