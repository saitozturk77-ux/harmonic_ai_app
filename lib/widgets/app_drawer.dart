import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            const SizedBox(height: 24),

            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 90,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 12),

            const Center(
              child: Text(
                "FOREX MATRIX",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),

            const SizedBox(height: 6),

            const Center(
              child: Text(
                "AI Trading Intelligence",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 14,
                  letterSpacing: 1,
                ),
              ),
            ),

            const SizedBox(height: 6),

            const Center(
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "FREE PLAN",
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Divider(),
                        _item(
              context,
              Icons.dashboard_outlined,
              "Dashboard",
            ),

            _item(
              context,
              Icons.show_chart,
              "Signals",
            ),

            _item(
              context,
              Icons.psychology_alt_outlined,
              "AI Engines",
            ),

            _item(
              context,
              Icons.calendar_month_outlined,
              "Economic Calendar",
            ),

            const Divider(),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10,
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(18),
                onTap: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Premium page coming soon...",
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF00BCD4),
                        Color(0xFF006064),
                      ],
                    ),
                  ),
                  child: const Row(
                    children: [

                      Icon(
                        Icons.workspace_premium,
                        color: Colors.amber,
                        size: 34,
                      ),

                      SizedBox(width: 14),

                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [

                            Text(
                              "FOREX MATRIX PREMIUM",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Unlock AI Trading Features",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Divider(),

            _item(
              context,
              Icons.settings_outlined,
              "Settings",
            ),

            _item(
              context,
              Icons.help_outline,
              "Help Center",
            ),

            _item(
              context,
              Icons.share_outlined,
              "Share App",
            ),

            _item(
              context,
              Icons.star_outline,
              "Rate App",
            ),

            _item(
              context,
              Icons.info_outline,
              "About",
            ),
                      ],
        ),
      ),
    );
  }

  static Widget _item(
    BuildContext context,
    IconData icon,
    String title,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.pop(context);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("$title coming soon"),
            duration: const Duration(seconds: 1),
          ),
        );
      },
    );
  }
}