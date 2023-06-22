import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_cart.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(child: Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.edit, color: whiteColor,),
              ).onTap(() { }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover,).box.roundedFull.clip(Clip.antiAlias).make(),
                  10.widthBox,
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Dummy User".text.fontFamily(semibold).white.make(),
                    "customer@example.com".text.white.make(),
                  ],)),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: whiteColor,
                      )),
                      onPressed: ()async{
                      await Get.put(AuthController()).signoutMethod(context);
                      Get.offAll(()=> const LoginScreen());
                      },
                    //error here logout
                      child: logout.text.fontFamily(semibold).white.make(),
                  )
                ],
              ),
            ),

            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                detailsCard(width: context.screenWidth/3.4, count: "00", title: "in your cart"),
                detailsCard(width: context.screenWidth/3.4, count: "32", title: "in your wishlist"),
                detailsCard(width: context.screenWidth/3.4, count: "675", title: "your orders"),
              ],
            ),

            //buttons section
            //20.heightBox,
            ListView.separated(
              shrinkWrap: true,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    leading: Image.asset(
                      profileButtonsIcon[index],
                      width: 22,
                    ),
                    title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                  );
                },
                separatorBuilder: (context, index){
                  return const Divider(color: lightGrey,);
                },
                itemCount: profileButtonsList.length,
            ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make().box.color(redColor).make(),
          ],
        ),
      ),
    ));
  }
}
