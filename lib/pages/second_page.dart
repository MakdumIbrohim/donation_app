import "package:flutter/material.dart";
import 'package:donation_app/widgets/cards/custom_card.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
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
            SizedBox(height: 12.0),
            CustomCard(
              imageUrl: 'https://placehold.co/300x200/png',
              title: 'Donasiku',
              description: 'Ini deskripsi',
            ),
          ],
        ),
      ),
    );
  }
}
