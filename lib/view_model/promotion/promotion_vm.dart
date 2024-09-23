import '../../model/promotion/promotion.dart';

class PromotionViewModel{

  List<Promotion>? listPromo = [];

  List<Promotion>? getListPromo(){
    listPromo?.add(Promotion(title: "Diskon 20%", subTitle: "Nonton film terbaru di CGV diskon 20% hingga Rp10.000 dengan BCA Mobile", imagePath: "promo01.jpg"));
    listPromo?.add(Promotion(title: "Promo Seru Dari BRI", subTitle: "Payday promo: Beli 1 dapat 2 pakai kartu debit / kredit BRI", imagePath: "promo02.jpg"));
    listPromo?.add(Promotion(title: "Liburan Nonton Hemat Bareng GoPay", subTitle: "Nonton hemat di CGV pakai GoPay ada cashback 50%", imagePath: "promo03.jpg"));
    listPromo?.add(Promotion(title: "Liburan Asik Bareng GoTix", subTitle: "Liburan asik di GoTix Holideals", imagePath: "promo04.jpg"));
    listPromo?.add(Promotion(title: "Hadiah Ke Teman", subTitle: "Kirim hadiah CGV E-Voucher ke teman kini bisa pakai PAYSGIFT", imagePath: "promo05.jpg"));
    return listPromo;
  }

}