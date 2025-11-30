import 'package:ecommerce/common/widgets/appbar/app_bar.dart';
import 'package:ecommerce/presentation/settings/widgets/my_favorties_title.dart';
import 'package:ecommerce/presentation/settings/widgets/my_orders.title.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        title: Text("Settings"),
        hideBack: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            MyFavortiesTitle(),
            SizedBox(
              height: 12,
            ),
            MyOrdersTitle()
          ],
        ),
      ),
    );
  }
}
