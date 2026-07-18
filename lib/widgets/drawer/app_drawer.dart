import 'package:flutter/material.dart';


import 'drawer_header.dart';
import 'drawer_item.dart';
import 'drawer_membership.dart';
import 'drawer_section.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeaderWidget(),

            const Divider(),

            const DrawerSection(
              title: "Trading",
            ),

            DrawerItem(
              icon: Icons.show_chart,
              title: "Signals",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Signals coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            DrawerItem(
              icon: Icons.psychology_alt_outlined,
              title: "AI Engines",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("AI Engines coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            DrawerItem(
              icon: Icons.calendar_month_outlined,
              title: "Economic Calendar",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Economic Calendar coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            const Divider(),

            const DrawerSection(
              title: "Membership",
            ),

            const DrawerMembership(),

            const Divider(),

            const DrawerSection(
              title: "Support",
            ),

            DrawerItem(
              icon: Icons.settings_outlined,
              title: "Settings",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Settings coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            DrawerItem(
              icon: Icons.help_outline,
              title: "Help Center",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Help Center coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            DrawerItem(
              icon: Icons.share_outlined,
              title: "Share App",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Share App coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            DrawerItem(
              icon: Icons.star_outline,
              title: "Rate App",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Rate App coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            DrawerItem(
              icon: Icons.info_outline,
              title: "About",
              onTap: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("About coming soon"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}