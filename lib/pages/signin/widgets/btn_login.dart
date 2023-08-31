import 'package:flutter/material.dart';

Widget buttonLoginWidgets(
    {required VoidCallback onPressed, required BuildContext context}) {
  return SizedBox(
    width: 200,
    height: 45,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          )),
          backgroundColor:
              MaterialStatePropertyAll(Theme.of(context).colorScheme.primary)),
      child: Text("Google Login!",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 15)),
    ),
  );
}
