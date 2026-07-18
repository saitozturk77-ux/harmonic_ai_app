import 'dart:ui';

import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_gradients.dart';
import '../../core/theme/app_shadows.dart';

class GlassCard extends StatelessWidget {
  final Widget child;

  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;

  final double? width;
  final double? height;

  final BorderRadius borderRadius;

  final Gradient? gradient;
  final Color? borderColor;
  final List<BoxShadow>? boxShadow;

  final VoidCallback? onTap;
  final bool premium;

  const GlassCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(18),
    this.margin = EdgeInsets.zero,
    this.height,
    this.width,
    this.gradient,
    this.borderColor,
    this.boxShadow,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(22),
    ),
    this.onTap,
    this.premium = false,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 12,
            sigmaY: 12,
          ),
          child: Container(
                   height: height,
                   width: width,
                   margin: margin,
            decoration: BoxDecoration(
              gradient: gradient ?? AppGradients.premiumCard,
              borderRadius: borderRadius,
              border: Border.all(
                color: (this.borderColor ??
                        (premium
                            ? AppColors.gold
                            : AppColors.primaryLight))
                    .withValues(alpha: 0.20),
              ),
              boxShadow: boxShadow ??
                  (premium
                      ? AppShadows.premium
                      : AppShadows.glow),
            ),
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}