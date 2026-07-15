import 'package:flutter/material.dart';

class PremiumButton extends StatelessWidget {
  const PremiumButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(

          width: double.infinity,

          height: 58,

          child: FilledButton(

            style: FilledButton.styleFrom(

              backgroundColor: const Color(0xFF00BCD4),

              foregroundColor: Colors.white,

              shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(18),

              ),

            ),

            onPressed: () {

              ScaffoldMessenger.of(context).showSnackBar(

                const SnackBar(

                  content: Text(

                    "Google Play Billing will be added in Sprint 3.7",

                  ),

                ),

              );

            },

            child: const Text(

              "START PREMIUM",

              style: TextStyle(

                fontSize: 18,

                fontWeight: FontWeight.bold,

                letterSpacing: 1,

              ),

            ),

          ),

        ),

        const SizedBox(height: 14),

        const Row(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(

              Icons.lock,

              size: 16,

              color: Colors.white54,

            ),

            SizedBox(width: 6),

            Text(

              "Secure payment via Google Play",

              style: TextStyle(

                color: Colors.white54,

                fontSize: 13,

              ),

            ),

          ],

        ),

        const SizedBox(height: 18),

        TextButton(

          onPressed: () {

            ScaffoldMessenger.of(context).showSnackBar(

              const SnackBar(

                content: Text(

                  "Restore Purchase coming soon",

                ),

              ),

            );

          },

          child: const Text(

            "Restore Purchase",

            style: TextStyle(

              color: Color(0xFF00E5FF),

            ),

          ),

        ),

      ],
    );
  }
}