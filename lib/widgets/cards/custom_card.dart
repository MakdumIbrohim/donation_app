import 'package:flutter/material.dart';
import 'package:donation_app/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final double? progress;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
      ),
      child: ListTile(
        // leading: imageUrl.isNotEmpty
        //     ? ClipRRect(
        //         borderRadius: BorderRadius.circular(14.0),
        //         child: Image.network(
        //           imageUrl,
        //           width: 56,
        //           height: 56,
        //           fit: BoxFit.cover,
        //         ),
        //       )
        //     : CircleAvatar(
        //         radius: 25,
        //         backgroundColor: Colors.grey[300],
        //         child: const Icon(Icons.image, color: Colors.black54),
        //       ),
        leading: Container(
          width: 100.0,
          height: 100.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: AppColors.primary,
          ),
          child: Icon(Icons.image, color: Colors.white),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(description),
            const SizedBox(height: 8.0),
            Row(
              children: [
                CircleAvatar(
                  radius: 12.0,
                  backgroundColor: AppColors.primary,
                  child: const Icon(
                    Icons.attach_money,
                    color: Colors.white,
                    size: 20.0,
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: LinearProgressIndicator(
                    value: (progress ?? 0.0).clamp(0.0, 1.0),
                    valueColor: const AlwaysStoppedAnimation<Color>(AppColors.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
