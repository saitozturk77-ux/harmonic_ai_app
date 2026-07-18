import 'package:flutter/material.dart';

import '../../screens/premium/premium_screen.dart';

class PremiumDialog {
  const PremiumDialog._();

  static Future<void> show(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (_) => const _PremiumDialogWidget(),
    );
  }
}

class _PremiumDialogWidget extends StatelessWidget {
  const _PremiumDialogWidget();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: const Color(0xFF101722),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0xFFFFC107),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.workspace_premium,
                color: Colors.black,
                size: 42,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Premium Required",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Text(
              "This feature is available only for Premium members.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 15,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 24),

            Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFFFFC107),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Unlimited AI Signals",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFFFFC107),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Advanced Market Analysis",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  color: Color(0xFFFFC107),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Premium Trading Tools",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.workspace_premium),
                label: const Text(
                  "GO PREMIUM",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00BCD4),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const PremiumScreen(),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                "Maybe Later",
                style: TextStyle(
                  color: Colors.white70,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}