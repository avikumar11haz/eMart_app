import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/applog_widget.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
         body: Center(
          child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,
            Column(
              children: [
                customTextField(hint: emailHint, title: email),
                customTextField(hint: passwordHint, title: password),
                Align(
                  alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: forgetPass.text.make())),
                5.heightBox,
                //ourButton().box.width(context.screenWidth - 50).make(),
                ourButton(color: redColor, title: login, textColor: whiteColor, onPress: (){}).box.width(context.screenWidth - 50).make(),
                5.heightBox,
                createNewAccount.text.color(fontGrey).make(),
                5.heightBox,
              ],
            ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).make(),


          ],
        ),
      ),
    ));
  }
}
