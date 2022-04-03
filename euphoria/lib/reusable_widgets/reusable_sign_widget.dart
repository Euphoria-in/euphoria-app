import 'package:auto_size_text/auto_size_text.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:euphoria/networking/authentication.dart';
import 'package:euphoria/reusable_widgets/reusable_social_login_button.dart';
import 'package:euphoria/screens/home_screen.dart';
import 'package:euphoria/screens/signup_screen.dart';
import 'package:euphoria/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_awesome_alert_box/flutter_awesome_alert_box.dart';
import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// the code below is used to create the reusable widget for the signin screen
class ReusableSignInWidget extends StatefulWidget {
  const ReusableSignInWidget({Key? key}) : super(key: key);

  @override
  _ReusableSignInWidgetState createState() => _ReusableSignInWidgetState();
}
// ignore: non_constant_identifier_names

class _ReusableSignInWidgetState extends State<ReusableSignInWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  // ignore: non_constant_identifier_names
  bool otp_call = false;
  // ignore: non_constant_identifier_names
  bool num_call = false;
  // ignore: non_constant_identifier_names
  bool field_call = true;
  // ignore: non_constant_identifier_names
  String? field_value;
  // ignore: non_constant_identifier_names
  String field_call_value = 'null';
  String error_txt = '';
  String cunt_code = '+91';
  bool _otp_error = false;
  bool showLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String verificationId;

  late TextEditingController _otpController;
  // final _otpController = TextEditingController();

  String _commingSms = '';

  Future<void> initSmsListener() async {
    String commingSms;
    try {
      commingSms = (await AltSmsAutofill().listenForSms)!;
      debugPrint('SMS: $commingSms');
      debugPrint('SMS: $_commingSms');
    } on PlatformException {
      commingSms = 'Failed to get Sms.';
    }
    if (!mounted) return;

    setState(() {
      _commingSms = commingSms;
      debugPrint('Sms: $_commingSms');
      _otpController.text = commingSms.substring(0, 7);
    });
  }

  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
    initSmsListener();
  }

  void _setText() {
    if (field_value != null) {
      setState(() {
        field_call_value = field_value!;
      });
    } else {
      setState(() {
        num_call = true;
        field_call_value = 'Enter a valid number';
      });
    }
  }
// on verification complete
// _onVerificationCompleted(PhoneAuthCredential authCredential) async {
//     print("verification completed ${authCredential.smsCode}");
//     User? user = FirebaseAuth.instance.currentUser;
//     // setState(() {
//     //       this.otpCode.text = authCredential.smsCode!;
//     //     });
//     if (authCredential.smsCode != null) {
//       try{
//       UserCredential credential =
//           await user!.linkWithCredential(authCredential);
//       }on FirebaseAuthException catch(e){
//           if(e.code == 'provider-already-linked'){
//             await _auth.signInWithCredential(authCredential);
//           }
//       }
//       setState(() {
//         isLoading = false;
//       });
//       Navigator.pushNamedAndRemoveUntil(
//           context, Constants.homeNavigate, (route) => false);
//     }
//   }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });
    // _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      // UserCredential credential =
      //     await user!.linkWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
        WarningAlertBox(
          context: context,
          title: 'OTP Verification Failed',
          messageText: 'Please enter the correct OTP ${e.message}',
        );
        _otp_error = true;
      });
    }
  }
  // Widget

  @override
  void dispose() {
    AltSmsAutofill().unregisterListener();
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final iskeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: showLoading
          ? Lottie.asset(
              "assets/lottie/pizza.json",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            )
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: const Color(0xFFEEEEEE),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: Image.asset(
                    'assets/images/bg.png',
                  ).image,
                ),
                shape: BoxShape.rectangle,
              ),
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(),
                    GlassContainer(
                      blur: 2,
                      shadowStrength: 10,
                      opacity: 0.1,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 300,
                        height: 400,
                        decoration: BoxDecoration(
                          color: const Color(0x00FFFFFF),
                          borderRadius: BorderRadius.circular(20),
                          shape: BoxShape.rectangle,
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [Color(0xFFFFC172), Color(0x0ffffff1)]),
                            width: 2,
                          ),

                          // Border.all(
                          //   color: const Color(0xFFFFC179),
                          // ),
                        ),
                        child:
                            Column(mainAxisSize: MainAxisSize.max, children: [
                          const Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Visibility(
                            visible: num_call,
                            child: Align(
                              alignment: const AlignmentDirectional(-0.7, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                child: Container(
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 5),
                                    child: InkWell(
                                      //numer show
                                      onTap: () {
                                        setState(() {
                                          field_call = true;
                                          num_call = false;
                                          otp_call = false;
                                        });
                                      },
                                      child: AutoSizeText(
                                        field_call_value,
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: _otp_error,
                            child: Align(
                              alignment: const AlignmentDirectional(-0.7, 0),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                child: Container(
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 5),
                                    child: InkWell(
                                      //numer show
                                      onTap: () {
                                        setState(() {
                                          _otp_error = false;
                                        });
                                      },
                                      child: AutoSizeText(
                                        "check the otp",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.getFont(
                                          'Roboto',
                                          color: Colors.white,
                                          fontStyle: FontStyle.normal,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: otp_call,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 40),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0x00EEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFFFC179),
                                      Color(0x0ffffff1)
                                    ]),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10, 0, 3, 0),
                                      child: FaIcon(
                                        FontAwesomeIcons.lock,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8, 0, 0, 0),
                                      child: Text(
                                        'OTP',
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(10, 0, 18, 0),
                                        child: TextFormField(
                                          controller: _otpController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 1),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                          keyboardType: TextInputType.phone,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(6),

                                            /// here char limit is 5
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 15, 0),
                                      child: InkWell(
                                        onTap: () {
                                          debugPrint(otp_call.toString());
                                          if (otp_call == true) {
                                            debugPrint('otp true');
                                            debugPrint(_otpController.text);
                                            // ignore: unused_local_variable
                                            PhoneAuthCredential
                                                phoneAuthCredential =
                                                PhoneAuthProvider.credential(
                                                    verificationId:
                                                        verificationId,
                                                    smsCode:
                                                        _otpController.text);

                                            signInWithPhoneAuthCredential(
                                                phoneAuthCredential);
                                          }
                                          setState(() {
                                            num_call = true; //arrow on click
                                          });
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.arrowCircleRight,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: field_call,
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 0, 40),
                              child: Container(
                                width: 250,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: const Color(0x00EEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                  border: const GradientBoxBorder(
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFFFC179),
                                      Color(0x0ffffff1)
                                    ]),
                                    width: 1,
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    // const Padding(
                                    //   padding:
                                    //       EdgeInsetsDirectional.fromSTEB(10, 0, 3, 0),
                                    //   child: FaIcon(
                                    //     FontAwesomeIcons.phoneAlt,
                                    //     color: Colors.white,
                                    //     size: 20,
                                    //   ),
                                    // ),

                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 0, 0),
                                      child: Center(
                                        child: CountryCodePicker(
                                          onChanged: (value) {
                                            debugPrint(value.dialCode);
                                            setState(() {
                                              cunt_code = value.dialCode!;
                                            });
                                          },
                                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                          initialSelection: 'IN',
                                          favorite: const ['+91', 'IN'],
                                          // languageCodes: const ['en', 'it'],

                                          // optional. Shows only country name and flag
                                          showCountryOnly: false,
                                          // optional. Shows only country name and flag when popup is closed.
                                          showOnlyCountryWhenClosed: false,
                                          // showDropDownButton: true,
                                          barrierColor:
                                              Colors.black.withOpacity(0.5),
                                          // optional. aligns the flag and the Text left
                                          //  showFlagDialog: false,
                                          alignLeft: false,
                                          dialogBackgroundColor:
                                              const Color.fromARGB(
                                                  243, 255, 255, 255),
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(3, 0, 0, 0),
                                          textStyle: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.white,
                                            //  decoration: TextDecoration.underline,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 0, 18, 0),
                                        child: TextFormField(
                                          // controller: textController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            isDense: true,
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                                width: 1,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 0, 1),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                          ),
                                          keyboardType: TextInputType.phone,
                                          onChanged: (value) =>
                                              field_value = value,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                            LengthLimitingTextInputFormatter(
                                                10),

                                            /// here char limit is 5
                                          ],
                                          autofillHints: const [
                                            AutofillHints.telephoneNumber
                                          ],
                                        ),
                                      ),
                                    ),

                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 0, 15, 0),
                                      child: InkWell(
                                        onTap: () async {
                                          // initSmsListener;
                                          _setText();
                                          debugPrint(otp_call.toString());

                                          if (field_call_value.length == 10) {
                                            setState(() {
                                              num_call = true;
                                              field_call = false;
                                              otp_call = true;
                                              showLoading = true;
                                              // _otpController.text = "1234";
                                            });
                                            await _auth.verifyPhoneNumber(
                                              phoneNumber:
                                                  cunt_code + field_call_value,
                                              verificationCompleted:
                                                  // _onVerificationCompleted,
                                                  (phoneAuthCredential) async {
                                                setState(() {
                                                  showLoading = false;
                                                });
                                                // signInWithPhoneAuthCredential(phoneAuthCredential);
                                              },
                                              verificationFailed:
                                                  (verificationFailed) async {
                                                setState(() {
                                                  showLoading = false;
                                                });
                                                debugPrint(
                                                    '${verificationFailed.message}faile otp ni mila');
                                              },
                                              codeSent: (verificationId,
                                                  resendingToken) async {
                                                setState(() {
                                                  showLoading = false;
                                                  // currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                                                  this.verificationId =
                                                      verificationId;
                                                });
                                                debugPrint(
                                                    verificationId.toString());
                                              },
                                              codeAutoRetrievalTimeout:
                                                  (verificationId) async {},
                                            );

                                            //  verificationCompleted: null,
                                            //  verificationFailed: null,
                                            //   codeSent: null,
                                            //   codeAutoRetrievalTimeout: null)

                                          } else {
                                            debugPrint(
                                                '${field_call_value.length}');

                                            setState(() {
                                              num_call = true;
                                              field_call_value =
                                                  'Enter a valid number';
                                            });
                                          }

                                          // setState(() {
                                          //   //arrow on click
                                          //   num_call = true;
                                          //   field_call = false;
                                          //   otp_call = true; //arrow on click
                                          // });
                                        },
                                        child: const FaIcon(
                                          FontAwesomeIcons.arrowCircleRight,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),

                          // Button for google login
                          ReusableSocialLoginButton(
                            onTapFunctionality: () {
                              // calling the function to signin the user into the app
                              // using google and then taking the user to the home screen of the
                              // app
                              Authentication.signInWithGoogle().then(
                                (value) => Navigator.of(context).pushNamed(
                                  HomeScreen.homeScreenRoute,
                                ),
                              );
                            },
                            socialLoginButtonIcon: FontAwesomeIcons.google,
                            socialLoginButtonName: AppLocalizations.of(context)
                                .continueWithGoogleText,
                          ),

                          // Button for facebook login
                          ReusableSocialLoginButton(
                            onTapFunctionality: () {
                              Navigator.of(context).pushNamed(
                                HomeScreen.homeScreenRoute,
                              );
                            },
                            socialLoginButtonIcon: FontAwesomeIcons.facebook,
                            socialLoginButtonName: AppLocalizations.of(context)
                                .continueWithFacebookText,
                          ),
                        ]),
                      ),
                    ),
                    const Spacer(),
                    if (!iskeyboard)
                      InkWell(
                        onTap: () {
                          // sign up screen route
                          Navigator.of(context)
                              .pushNamed(SignUpScreen.signupRoute);
                        },
                        child: Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Color(0x00EEEEEE),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:  [
                              Align(
                                alignment: const AlignmentDirectional(0, -0.2),
                                child: AutoSizeText(
                                  AppLocalizations.of(context).dontHaveAccountYetText,
                                  textAlign: TextAlign.start,
                                  style: AppConstants.singinScreenSignupButtonTextStyle,
                                ),
                              ),
                              Align(
                                alignment: const AlignmentDirectional(0, -0.2),
                                child: AutoSizeText(
                                  AppLocalizations.of(context).signupText,
                                  textAlign: TextAlign.start,
                                  style: AppConstants.socialLoginButtonTextStyle,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]),
            ),
    );
  }
}
