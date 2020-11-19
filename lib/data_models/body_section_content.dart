import 'package:main_app/data_models/product.dart';

class BodySectionContent {
  final String sectionTitle;
  final List<Product> productList;

  const BodySectionContent(
    this.sectionTitle,
    this.productList,
  );
}
