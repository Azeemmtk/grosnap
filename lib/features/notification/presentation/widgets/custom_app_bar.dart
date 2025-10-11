import 'package:flutter/material.dart';
import 'package:grosnap/core/utils/color.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Green circular back button
            GestureDetector(
              onTap: onBack ?? () => Navigator.pop(context),
              child: Container(
                height: 35,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: green,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 22,),
              ),
            ),
            const SizedBox(width: 12),

            // Title
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 👇 Increase the height slightly more than the normal AppBar
  @override
  Size get preferredSize => const Size.fromHeight(110);
}
