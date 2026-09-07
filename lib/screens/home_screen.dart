import 'package:flutter/material.dart';
import 'package:my_first_app/models/service_model.dart';
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              CustomSearchBar(hintText: "Cari di sini..."),
              PageHeader(
                title: "Layanan Kami",
                subTitle: "Eksplor daftar layanan kami",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  ...services.map((service) {
                    return ProductCard(service: service);
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
