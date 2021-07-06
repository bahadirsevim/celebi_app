import 'package:celebi_app/views/authantication/sign_up/viewmodel/sing_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/extension/context_extension.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../_product/_constants/svg_image_path.dart';
import '../../../_product/_widgets/buttons/normal_button.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.viewModel,
  }) : super(key: key);
  final SingUpViewModel viewModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: context.highValue / 2),
        child: Form(
          // key: viewModel.formState,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: <Widget>[
              buildNameField(context),
              SizedBox(
                height: context.normalValue,
              ),
              buildEmailField(context),
              SizedBox(
                height: context.normalValue,
              ),
              buildPasswordField(context),
              SizedBox(
                height: context.normalValue * 2,
              ),
              buildLoginButton(),
              buildSingUpText(),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildNameField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.name,
      // controller: viewModel.emailController,
      validator: (value) => value!.isNotEmpty ? null : 'This field required',
      decoration: InputDecoration(
        labelText: 'Name',
        icon: Container(
          width: context.normalValue,
          height: context.normalValue,
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  Row buildSingUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),
        TextButton(onPressed: () {}, child: Text('Sign In'))
      ],
    );
  }

  Widget buildLoginButton() {
    return SizedTextButton(
      text: "Register",
      color: Color(0xFF7BC4B2),
      onPressed: () {},
      // onPressed: () => viewModel.fetchLoginService(),
    );
  }

  Align buildForgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        // onPressed: viewModel.isLaoding ? null : () {},
        child: Text('Forget password'),
      ),
    );
  }

  TextFormField buildEmailField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // controller: viewModel.emailController,
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
    return Observer(
      builder: (_) {
        return TextFormField(
          keyboardType: TextInputType.visiblePassword,
          // controller: viewModel.passwordController,
          // obscureText: viewModel.isLockOpen,
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
                // viewModel.isLockStateChange();
              },
              icon: Icon(Icons.remove_red_eye),
              /* icon: Icon(viewModel.isLockOpen
                    ? Icons.visibility
                    : Icons.visibility_off),*/
            ),
          ),
        );
      },
    );
  }
}
