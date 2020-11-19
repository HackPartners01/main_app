class Product {
  int id;
  String category = '';
  String name = '';
  String description = '';
  int sellerId;
  String networkImageAddress = "";
  int price;
  static int count=0;



  Product({
    this.id,
    this.name,
    this.category,
    this.sellerId,
    this.networkImageAddress,
    this.description,
    this.price,
  }){
    count++;
    this.id = count;
  }

  save() {
    print('Product Saved');
  }

}
