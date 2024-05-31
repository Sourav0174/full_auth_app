import 'package:flutter/material.dart';

class uiHelper {
  static customTextField(
      TextEditingController controller, String text, Icon icon) {
    return TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "all field are required";
          }
          return null;
        },
        keyboardType: TextInputType.name,
        controller: controller,
        enableSuggestions: true,
        decoration: InputDecoration(
          labelText: text,
          suffixIcon: icon,
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 104, 104, 104)),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 104, 104, 104)),
              borderRadius: BorderRadius.circular(25)),
        ));
  }

  static customButton(
    String text,
  ) {
    return SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 166, 17, 193)),
            onPressed: () {},
            child: const Text(
              "Sign up",
              style: TextStyle(color: Colors.white, fontSize: 30),
            )));
  }
}
