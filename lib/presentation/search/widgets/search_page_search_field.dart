import 'package:ecommerce/core/configs/assets/app_vectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPageSearchField extends StatelessWidget {
  SearchPageSearchField({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (value) {},
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          prefixIcon: SvgPicture.asset(
            AppVectors.search,
            fit: BoxFit.none,
          ),
          hintText: 'search'),
    );
  }
}
