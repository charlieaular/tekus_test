import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String title, String subTitle, {dynamic data}) {
  Get.snackbar(
    "",
    "",
    snackPosition: SnackPosition.TOP,
    titleText: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(width: 16),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
    messageText: Row(
      children: [
        Flexible(
          child: Text(
            subTitle,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
    borderRadius: 8.0,
    borderWidth: 1,
  );
}
