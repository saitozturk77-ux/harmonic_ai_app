import 'package:flutter/material.dart';

class SubscriptionCards extends StatefulWidget {
  const SubscriptionCards({super.key});

  @override
  State<SubscriptionCards> createState() => _SubscriptionCardsState();
}

class _SubscriptionCardsState extends State<SubscriptionCards> {

  int selectedPlan = 1;

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Choose Your Plan",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 18),

        _planCard(
          index: 0,
          title: "MONTHLY",
          subtitle: "Perfect for beginners",
          badge: "",
        ),

        const SizedBox(height: 14),

        _planCard(
          index: 1,
          title: "YEARLY",
          subtitle: "Save up to 35%",
          badge: "BEST VALUE",
        ),

      ],
    );
  }

  Widget _planCard({
    required int index,
    required String title,
    required String subtitle,
    required String badge,
  }) {

    final bool selected = selectedPlan == index;

    return GestureDetector(

      onTap: () {

        setState(() {

          selectedPlan = index;

        });

      },

      child: AnimatedContainer(

        duration: const Duration(milliseconds: 250),

        padding: const EdgeInsets.all(18),

        decoration: BoxDecoration(

          color: selected
              ? const Color(0xFF00BCD4).withValues(alpha: 0.12)
              : const Color(0xFF111C28),

          borderRadius: BorderRadius.circular(18),

          border: Border.all(

            color: selected
                ? const Color(0xFF00E5FF)
                : Colors.white10,

            width: selected ? 2 : 1,

          ),

        ),

        child: Row(

          children: [

            Expanded(

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(

                    title,

                    style: const TextStyle(

                      color: Colors.white,

                      fontSize: 20,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                  const SizedBox(height: 4),

                  Text(

                    subtitle,

                    style: const TextStyle(

                      color: Colors.white70,

                    ),

                  ),

                ],

              ),

            ),

            if (badge.isNotEmpty)

              Container(

                padding: const EdgeInsets.symmetric(

                  horizontal: 12,

                  vertical: 6,

                ),

                decoration: BoxDecoration(

                  color: Colors.orange,

                  borderRadius: BorderRadius.circular(20),

                ),

                child: Text(

                  badge,

                  style: const TextStyle(

                    color: Colors.black,

                    fontWeight: FontWeight.bold,

                    fontSize: 11,

                  ),

                ),

              ),

          ],

        ),

      ),

    );

  }

}