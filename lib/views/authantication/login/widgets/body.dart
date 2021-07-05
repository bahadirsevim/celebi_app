import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../_product/_constants/svg_image_path.dart';
import '../../../_product/_widgets/buttons/normal_button.dart';
import '../viewmodel/login_view_model.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
  final LoginViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: context.highValue / 2),
        child: Form(
          key: viewModel.formState,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              buildEmailField(context),
              SizedBox(
                height: context.normalValue,
              ),
              buildPasswordField(context),
              buildForgetPassword(),
              SizedBox(
                height: context.normalValue * 3,
              ),
              buildLoginButton(),
              buildSingUpText(),
            ],
          ),
        ),
      ),
    );
  }

  Row buildSingUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?"),
        TextButton(onPressed: () {}, child: Text('Sign Up'))
      ],
    );
  }

  Widget buildLoginButton() {
    return SizedTextButton(
        text: "Login",
        color: Color(0xFF7BC4B2),
        onPressed: () => viewModel.fetchLoginService());
  }

  Align buildForgetPassword() {
    return Align(
        alignment: Alignment.centerRight,
        child: TextButton(
            onPressed: viewModel.isLaoding ? null : () {},
            child: Text('Forget password')));
  }

  TextFormField buildEmailField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: viewModel.emailController,
      validator: (value) => value!.isValidEmail,
      decoration: InputDecoration(
          labelText: 'Email',
          icon: Container(
              width: context.normalValue,
              height: context.normalValue,
              child: SvgPicture.asset(SVGImagePaths().email))),
    );
  }

  Observer buildPasswordField(BuildContext context) {
    return Observer(builder: (_) {
      return TextFormField(
          keyboardType: TextInputType.visiblePassword,
          controller: viewModel.passwordController,
          obscureText: viewModel.isLockOpen,
          validator: (value) =>
              value!.isNotEmpty ? null : 'This field required',
          decoration: InputDecoration(
            labelText: 'Password',
            icon: Container(
              width: context.normalValue,
              height: context.normalValue,
              child: SvgPicture.asset(SVGImagePaths().password),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  print("pressed");
                  viewModel.isLockStateChange();
                },
                icon: Icon(viewModel.isLockOpen
                    ? Icons.visibility
                    : Icons.visibility_off)),
          ));
    });
  }
}
