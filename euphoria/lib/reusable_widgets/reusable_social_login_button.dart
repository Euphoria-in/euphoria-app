import 'package:euphoria/utils/app_colors.dart';
import 'package:euphoria/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// the code below is used to create a widget for creating a reusable social login button
// for the signup screen
class ReusableSocialLoginButton extends StatelessWidget {
  // the property below is used to get the onTap functionality
  // for the button
  final Function()? onTapFunctionality;

  // the property below is used to get the icon for the button
  final IconData? socialLoginButtonIcon;

  // the property below is used to get the name of the button
  final String? socialLoginButtonName;

  const ReusableSocialLoginButton({
    Key? key,
    required this.onTapFunctionality,
    required this.socialLoginButtonIcon,
    required this.socialLoginButtonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunctionality,
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
        child: Container(
          width: 250,
          height: 50,
          decoration: AppConstants.socialLoginButtonContainerDesign,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(10, 0, 3, 0),
                child: FaIcon(
                  socialLoginButtonIcon,
                  color: kSocialLoginIconColor,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                child: Text(
                  socialLoginButtonName.toString(),
                  style: AppConstants.socialLoginButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
