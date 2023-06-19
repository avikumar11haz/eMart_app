import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/consts/strings.dart';
import 'package:emart_app/consts/styles.dart';
import 'package:emart_app/widgets_common/applog_widget.dart';
import 'package:emart_app/widgets_common/bg_widgets.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight * 0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Join the $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,
                Column(
                  children: [
                    customTextField(hint: nameHint, title: name),
                    customTextField(hint: emailHint, title: email),
                    customTextField(hint: passwordHint, title: password),
                    customTextField(hint: passwordHint, title: retypePassword),
                    Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){}, child: forgetPass.text.make())),

                    Row(
                      children: [
                        Checkbox(
                          checkColor: redColor,
                            value: false,
                            onChanged: (newValue){},
                        ),
                        10.heightBox,
                        Expanded(
                          child: RichText(
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                      fontFamily: bold,
                                      color: fontGrey,
                                    )),
                                  TextSpan(
                                      text: termAndCond,
                                      style: TextStyle(
                                        fontFamily: bold,
                                        color: redColor,
                                      )),
                                  TextSpan(
                                      text: " & ",
                                      style: TextStyle(
                                        fontFamily: bold,
                                        color: fontGrey,
                                      )),
                                  TextSpan(
                                      text: privacyPolicy,
                                      style: TextStyle(
                                        fontFamily: bold,
                                        color: redColor,
                                      )),
                                ]
                              )),
                        )
                      ],
                    ),
                    5.heightBox,
                    //ourButton().box.width(context.screenWidth - 50).make(),
                    ourButton(color: redColor, title: signup, textColor: whiteColor, onPress: (){})
                        .box
                        .width(context.screenWidth - 50)
                        .make(),
                    5.heightBox,
                    RichText(text: const TextSpan(
                      children: [
                        TextSpan(
                          text: alreadyHaveAccount,
                          style: TextStyle(fontFamily: bold, color: fontGrey),
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(fontFamily: bold, color: redColor),
                        )
                      ]
                    )).onTap(() {
                      Get.back();
                    }),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth - 70).shadowSm.make(),


              ],
            ),
          ),
        ));
  }
}
