import "package:flutter/material.dart";
import 'package:donation_app/widgets/cards/custom_card.dart';
import 'package:donation_app/constants/app_colors.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final List<String> _categories = const [
    'Kemanusiaan',
    'Pendidikan',
    'Kesehatan',
    'Bencana',
    'Masjid',
    'Pangan',
  ];

  final List<DonationItem> _items = const [
    DonationItem(
      imageUrl: 'https://picsum.photos/seed/donate1/300/200',
      title: 'Donasiku',
      description: 'Bantu program pangan untuk daerah terpencil.',
      progress: 0.7,
    ),
    DonationItem(
      imageUrl: 'https://picsum.photos/seed/donate2/300/200',
      title: 'Pendidikan',
      description: 'Dukung perlengkapan sekolah anak-anak.',
      progress: 0.6,
    ),
    DonationItem(
      imageUrl: 'https://picsum.photos/seed/donate3/300/200',
      title: 'Kesehatan',
      description: 'Bantu biaya pengobatan dan ambulans.',
      progress: 0.5,
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Mari lanjutkan kebaikan hari ini. Pilih program yang ingin kamu dukung.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black87,
                    height: 1.5,
                  ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Total Donasi Bulan Ini',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        const Text(
                          'Rp 2.450.000',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Target: Rp 5.000.000',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.favorite, color: Colors.white),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                _QuickAction(
                  icon: Icons.payments_outlined,
                  label: 'Donasi Cepat',
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 12),
                _QuickAction(
                  icon: Icons.receipt_long_outlined,
                  label: 'Riwayat',
                  color: colorScheme.primary,
                ),
                const SizedBox(width: 12),
                _QuickAction(
                  icon: Icons.volunteer_activism_outlined,
                  label: 'Zakat',
                  color: colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'Kategori',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _categories
                  .map(
                    (category) => Chip(
                      label: Text(category),
                      backgroundColor: const Color(0xFFEFF7F5),
                      side: BorderSide(color: colorScheme.primary),
                      labelStyle: TextStyle(color: colorScheme.primary),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 18),
            Text(
              'Program Mendesak',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF6F9F8),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFDAE8E4)),
              ),
              child: Row(
                children: [
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(Icons.health_and_safety, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Bantuan Medis Darurat',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Butuh dana cepat untuk operasi pasien.',
                          style: TextStyle(color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.black45),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Rekomendasi Program',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 10),
            ListView.separated(
              itemCount: _items.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
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

class _QuickAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _QuickAction({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: const Color(0xFFF6F9F8),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFDAE8E4)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 6),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
