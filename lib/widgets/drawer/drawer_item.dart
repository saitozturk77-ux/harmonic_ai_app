import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Color? iconColor;
  final Color? textColor;
  final bool enabled;

  const DrawerItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.trailing,
    this.iconColor,
    this.textColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveIconColor =
        enabled ? (iconColor ?? Colors.white70) : Colors.grey;

    final Color effectiveTextColor =
        enabled ? (textColor ?? Colors.white) : Colors.grey;

    return ListTile(
      enabled: enabled,
      leading: Icon(
        icon,
        color: effectiveIconColor,
        size: 24,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: effectiveTextColor,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.chevron_right,
            size: 20,
            color: Colors.white38,
          ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 2,
      ),
      splashColor: Colors.white10,
      hoverColor: Colors.white10,
      onTap: enabled
          ? onTap
          : () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("This feature is currently unavailable."),
                  duration: Duration(seconds: 1),
                ),
              );
            },
    );
  }
}