import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Profile"),
        hideBack: true,
      ),
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Center(
            child: Text("Profile"),
          )),
    );
  }
}
