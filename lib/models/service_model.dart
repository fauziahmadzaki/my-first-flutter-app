const List<String> benefits = [
  "Desain responsif dan menarik",
  "Fungsionalitas yang lengkap",
  "Dukungan teknis yang handal",
  "Harga terjangkau dan kompetitif",
];

class Service {
  final String name;
  final String description;
  final String? imgUrl;
  final List<String> benefits;
  final double price;
  final double? rating;
  final int? viewCount;
  final int? comments;
  final bool? isPromo;

  Service({
    required this.name,
    required this.description,
    this.imgUrl,
    required this.benefits,
    required this.price,
    this.rating,
    this.comments,
    this.viewCount,
    this.isPromo,
  });
}

final List<Service> services = [
  Service(
    name: "Web Development",
    description: "Membuat website yang responsif dan menarik",
    imgUrl: "assets/images/webdev.jpg",
    benefits: benefits,
    price: 1000000,
    rating: 4.5,
    viewCount: 1500,
    comments: 25,
    isPromo: true,
  ),
  Service(
    name: "Mobile App Development",
    description: "Membuat aplikasi mobile untuk Android dan iOS",
    imgUrl: "assets/images/webdev.jpg",
    benefits: benefits,
    price: 2000000,
    rating: 4.7,
    viewCount: 1200,
    comments: 30,
    isPromo: true,
  ),
  Service(
    name: "UI/UX Design",
    description: "Merancang tampilan aplikasi yang intuitif",
    imgUrl: "assets/images/webdev.jpg",
    benefits: benefits,
    price: 1500000,
    rating: 4.8,
    viewCount: 900,
    comments: 18,
    isPromo: false,
  ),
  Service(
    name: "Digital Marketing",
    description: "Strategi pemasaran digital untuk bisnis Anda",
    imgUrl: "assets/images/webdev.jpg",
    benefits: benefits,
    price: 800000,
    rating: 4.3,
    viewCount: 700,
    comments: 12,
    isPromo: true,
  ),
  Service(
    name: "SEO Optimization",
    description: "Optimasi mesin pencari untuk website Anda",
    imgUrl: "assets/images/webdev.jpg",
    benefits: benefits,
    price: 500000,
    rating: 4.6,
    viewCount: 600,
    comments: 9,
    isPromo: false,
  ),
];