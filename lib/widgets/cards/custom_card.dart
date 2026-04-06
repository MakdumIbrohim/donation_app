import 'package:flutter/material.dart';
import 'package:donation_app/constants/app_colors.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  const CustomCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        leading: imageUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(14.0),
                child: Image.network(
                  imageUrl,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              )
            : CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.black54),
              ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(description),
            const SizedBox(height: 8.0),
            CircleAvatar(
              radius: 15.0,
              backgroundColor: Colors.white,
              child: const Icon(Icons.money, color: AppColors.primary, size: 20.0,),
            ),
          ],
        ),
      ),
    );
  }
}
