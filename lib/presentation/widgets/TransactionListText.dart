import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/app_colors.dart';

TextField getTransactionListText({
  required String label,
  required TextEditingController value,
}) =>
    TextField(
      controller: value,
      enabled: false,
      style: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.blackColor),
      decoration: InputDecoration(
        /// Set label text
        label: Text(
          label,
          style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.labelColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.separaterColor,
          ),
        ),
      ),
    );