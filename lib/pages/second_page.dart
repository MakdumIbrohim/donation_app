import "package:flutter/material.dart";
import 'package:donation_app/widgets/cards/custom_card.dart';
import 'package:donation_app/constants/app_colors.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<DonationItem> _items = const [
    DonationItem(
      imageUrl: 'https://picsum.photos/seed/donate1/300/200',
      title: 'Donasiku',
      description: 'Bantu program pangan untuk daerah terpencil.',
      progress: 0.7
    ),
    DonationItem(
      imageUrl: 'https://picsum.photos/seed/donate2/300/200',
      title: 'Pendidikan',
      description: 'Dukung perlengkapan sekolah anak-anak.',
      progress: 0.6
    ),
    DonationItem(
      imageUrl: 'https://picsum.photos/seed/donate3/300/200',
      title: 'Kesehatan',
      description: 'Bantu biaya pengobatan dan ambulans.',
      progress: 0.5
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'Second Page',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to Donation App',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Halaman ini sudah memiliki AppBar dan siap kamu lanjutkan untuk isi konten berikutnya.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: ListView.separated(
                itemCount: _items.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final item = _items[index];
                  return CustomCard(
                    imageUrl: item.imageUrl,
                    title: item.title,
                    description: item.description,
                    progress: item.progress,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DonationItem {
  final String imageUrl;
  final String title;
  final String description;
  final double? progress;

  const DonationItem({
    required this.imageUrl,
    required this.title,
    required this.description,
    this.progress,
  });
}
