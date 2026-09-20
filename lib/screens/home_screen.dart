import 'package:flutter/material.dart';
import 'package:my_first_app/models/service_model.dart';
import 'package:my_first_app/screens/detail_screen.dart';
import 'package:my_first_app/widgets/page_header.dart';
import 'package:my_first_app/widgets/product_card.dart';
import 'package:my_first_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext c) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hai Budi👋",
          style: TextStyle(
            fontSize: 24,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(c).copyWith(overscroll: false),
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: const ClampingScrollPhysics(),
          children: [
            CustomSearchBar(hintText: "Cari di sini..."),
            const SizedBox(height: 20),
            PageHeader(
              title: "Layanan Kami",
              subTitle: "Eksplor daftar layanan kami",
            ),
            const SizedBox(height: 20),
            ...services.take(3).map((service) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: ProductCard(
                  service: service,
                  onTap: () {
                    Navigator.push(
                      c,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(service: service),
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
