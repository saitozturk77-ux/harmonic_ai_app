import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;

    String greeting;
    IconData icon;

    if (hour < 12) {
      greeting = "Good Morning";
      icon = Icons.wb_sunny_rounded;
    } else if (hour < 18) {
      greeting = "Good Afternoon";
      icon = Icons.wb_twilight;
    } else {
      greeting = "Good Evening";
      icon = Icons.nights_stay_rounded;
    }

    return Column(
      children: [

        //--------------------------------------------------
        // ÜST SATIR
        //--------------------------------------------------

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [

                      Icon(
                        icon,
                        color: AppColors.warning,
                        size: 18,
                      ),

                      const SizedBox(width: 8),

                      Text(
                        greeting,
                        style: const TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    "FOREX MATRIX",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 3,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    "AI Trading Intelligence",
                    style: TextStyle(
                      color: AppColors.primary.withOpacity(.85),
                      fontSize: 13,
                      letterSpacing: 2,
                    ),
                  ),
                ],
              ),
            ),

            //--------------------------------------------------

            Column(
              children: [

                _glassIcon(Icons.notifications_none_rounded),

                const SizedBox(height: 12),

                _glassIcon(Icons.person_outline_rounded),
              ],
            ),
          ],
        ),

        const SizedBox(height: 22),

        //--------------------------------------------------
        // MARKET BAR
        //--------------------------------------------------

        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),

          decoration: BoxDecoration(
            gradient: AppColors.cardGradient,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: AppColors.border,
            ),
          ),

          child: Row(
            children: [

              Container(
                width: 10,
                height: 10,

                decoration: BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: AppColors.successGlow,
                      blurRadius: 14,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 10),

              const Text(
                "MARKET OPEN",
                style: TextStyle(
                  color: AppColors.success,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              const Spacer(),

              const Icon(
                Icons.schedule_rounded,
                color: AppColors.primary,
                size: 17,
              ),

              const SizedBox(width: 6),

              Text(
                _time(),
                style: const TextStyle(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //----------------------------------------------------------

  static Widget _glassIcon(IconData icon) {
    return Container(
      width: 46,
      height: 46,

      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.03),

        borderRadius: BorderRadius.circular(14),

        border: Border.all(
          color: AppColors.border,
        ),

        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGlow.withOpacity(.18),
            blurRadius: 10,
          ),
        ],
      ),

      child: Icon(
        icon,
        color: AppColors.primary,
        size: 22,
      ),
    );
  }

  //----------------------------------------------------------

  static String _time() {
    final now = DateTime.now();

    final h = now.hour.toString().padLeft(2, '0');
    final m = now.minute.toString().padLeft(2, '0');

    return "$h:$m UTC+3";
  }
}