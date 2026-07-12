import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class AlertCard extends StatefulWidget {
  const AlertCard({
    super.key,
    required this.items,
  });

  final List<String> items;

  @override
  State<AlertCard> createState() => _AlertCardState();
}

class _AlertCardState extends State<AlertCard> {
  late List<bool> values;

  @override
  void initState() {
    super.initState();

    values = List.generate(
      widget.items.length,
      (_) => true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.cardGradient,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          const Row(
            children: [

              Icon(
                Icons.notifications_active,
                color: Colors.amber,
              ),

              SizedBox(width: 10),

              Text(
                "ALERT SETTINGS",
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ...List.generate(
            widget.items.length,
            (index) {
              return CheckboxListTile(
                value: values[index],
                activeColor: AppColors.primary,
                checkColor: Colors.white,
                controlAffinity:
                    ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  widget.items[index],
                  style: const TextStyle(
                    color: AppColors.textPrimary,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    values[index] = value ?? false;
                  });
                },
              );
            },
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.save),
              label: const Text("SAVE ALERT"),
            ),
          ),
        ],
      ),
    );
  }
}