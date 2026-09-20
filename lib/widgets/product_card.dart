import 'package:flutter/material.dart';
import 'package:my_first_app/models/service_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.service, this.onTap});
  final Service service;
  final VoidCallback? onTap;

  String formatPrice(double price) {
    return "Rp ${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}";
  }

  @override
  Widget build(BuildContext c) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                clipBehavior: Clip.hardEdge,
                child: Image.asset(
                  service.imgUrl ?? 'assets/images/webdev.jpg',
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 5,
                      children: [
                        Text(
                          service.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          formatPrice(service.price),
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        StatsSection(
                          rating: service.rating,
                          views: service.viewCount,
                          comments: service.comments,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              Text(
                                "Keunggulan:",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                spacing: 10,
                                children: [
                                  ...service.benefits.map((benefit) {
                                    return Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                        ),
                                        Text(
                                          benefit,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: onTap,
                        style: FilledButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: const Text(
                          "Pesan Sekarang",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (service.isPromo == true)
            Positioned(
              top: 10,
              right: 10,

              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  "Promo",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class StatsSection extends StatelessWidget {
  const StatsSection({super.key, this.rating, this.views, this.comments});
  final double? rating;
  final int? views;
  final int? comments;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      children: [
        Row(
          spacing: 5,
          children: [
            Icon(Icons.star, color: Colors.yellow),
            Text(
              rating?.toStringAsFixed(1) ?? 'N/A',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        Row(
          spacing: 5,
          children: [
            Icon(Icons.energy_savings_leaf, color: Colors.black),
            Text(
              views?.toString() ?? 'N/A',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
        Row(
          spacing: 5,
          children: [
            Icon(Icons.comment, color: Colors.black),
            Text(
              comments?.toString() ?? 'N/A',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }
}
