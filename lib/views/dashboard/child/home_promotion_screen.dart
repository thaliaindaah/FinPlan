import 'package:flutter/material.dart';
import 'package:test_drive/res/app_context_extension.dart';
import 'package:test_drive/view_model/promotion/promotion_vm.dart';

import '../../../model/promotion/promotion.dart';

class HomePromotionScreen extends StatefulWidget{
  const HomePromotionScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePromotionScreen();

}

class _HomePromotionScreen extends State<HomePromotionScreen>{

  final PromotionViewModel viewModel = PromotionViewModel();
  late List<Promotion> listOfPromo;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 265,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          _titlePromotion(),
          Expanded(child: _bodyPromotion())
        ],
      )
    );
  }

  @override
  void initState(){
    if(viewModel.getListPromo() != null){
      listOfPromo = viewModel.getListPromo()!;
    }else{
      listOfPromo = [];
    }
    super.initState();
  }

  Widget _titlePromotion(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(child: Container(
          padding: const EdgeInsets.only(left: 10),
          child: const Text(
            "Promosi",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
        const Text("Lihat Semua"),
        const Icon(Icons.arrow_right, color: Colors.red,)
      ],
    );
  }

  Widget _bodyPromotion(){
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listOfPromo.take(5).length,
      itemBuilder: (context, position){
        return _promoItem(listOfPromo[position]);
      },
    );
  }

  Widget _promoItem(Promotion? item){
    return Container(
      margin: const EdgeInsets.only(right: 5),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(
              width: context.resources.dimension.size250,
              height: context.resources.dimension.size150,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                child: Image.asset("lib/res/images/${item?.imagePath}", fit: BoxFit.fill,),
              ),
            ),
            Container(
              width: 250,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(left: 5, right: 5),
              alignment: Alignment.centerLeft,
              child: Text("${item?.title}",
                style: const TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              width: context.resources.dimension.size250,
              margin: const EdgeInsets.only(top: 5),
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Text("${item?.subTitle}",
                style: const TextStyle(fontWeight: FontWeight.normal),
                textAlign: TextAlign.left,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      )
    );
  }

}
