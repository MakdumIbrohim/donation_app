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
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ListTile(
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
                    child: Icon(Icons.image, color: Colors.black54),
                  ),
            title: Text(title),
            subtitle: Text(description),
          ),
          const SizedBox(height: 5.0,)
        ],
      ),
    );
  }
}
