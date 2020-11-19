class SellerInfo{

  String sellerName='';
  String phoneNumber='';
  String productCategory='';
  String productName='';
  String productDescription='';
  String shopName='';
  String shopAddress='';
  String cityName='';
  String stateName='';
  SellerInfo({this.sellerName,this.phoneNumber,this.productCategory,this.productName,
    this.productDescription,this.shopName,this.shopAddress,this.cityName,this.stateName});
  save() {
    print('saving seller using a web service');
  }
}