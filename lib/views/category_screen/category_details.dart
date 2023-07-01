import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/controllers/product_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/category_screen/item_details.dart';
import 'package:emart_app/widgets_common/loading_indicator.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatefulWidget {
  final String? title;

  const CategoryDetails({Key? key, required this.title, }) : super(key: key);

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    switchCategory(widget.title);
  }

  switchCategory(title){
    if(controller.subcat.contains(title)){
     productMethod = FirestoreServices.getSubCategoryProducts(title);
    }else {
     productMethod = FirestoreServices.getProducts(title);
    }
  }

  var controller = Get.find<ProductController>();

  dynamic productMethod;

  @override
  Widget build(BuildContext context) {


    return bgWidget(child: Scaffold(
      appBar: AppBar(
        title: widget.title!.text.fontFamily(bold).white.make(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: List.generate(
                  controller.subcat.length,
                      (index) => "${controller.subcat[index]}".text.size(12).fontFamily(semibold).color(darkFontGrey).makeCentered().box.white.roundedSM.size(120, 60).margin(const EdgeInsets.symmetric(horizontal: 4)).make().onTap(() {
                        switchCategory("${controller.subcat[index]}");
                        setState(() {

                        });
                      })),
            ),
          ),
          20.heightBox,
          StreamBuilder(
            stream: productMethod, //FirestoreServices.getProducts(title),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Expanded(
                  child: Center(
                    child: loadingIndicator(),
                  ),
                );
              }else if(snapshot.data!.docs.isEmpty){
                return Expanded(
                  child: "No products found!".text.color(darkFontGrey).makeCentered(),
                );
              }else{
                var data = snapshot.data!.docs;

                return Expanded(
                        child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisExtent: 250, mainAxisSpacing: 8, crossAxisSpacing: 8),
                            itemBuilder: (context, index){
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(
                                    data[index]['p_images'][0],
                                    height: 150, width: 200, fit: BoxFit.cover,
                                  ),
                                  5.heightBox,//.box.roundedSM.clip(Clip.antiAlias).make(),
                                  "${data[index]['p_name']}".text.fontFamily(semibold).color(darkFontGrey).make(),
                                  10.heightBox,
                                  "${data[index]['p_price']}".numCurrency.text.color(redColor).fontFamily(bold).size(16).make(),
                                  10.heightBox,
                                ],
                              ).box.white.margin(const EdgeInsets.symmetric(horizontal: 4)).roundedSM.outerShadowSm.padding(const EdgeInsets.all(12)).color(whiteColor).make()
                                  .onTap(() {
                                controller.checkIfFav(data[index]);
                                Get.to(() => ItemDetails(title: "${data[index]['p_name']}", data: data[index]));
                              });
                            }));


              }
            },
          ),
        ],
      )
    ));
  }
}