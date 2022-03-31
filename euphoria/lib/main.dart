import 'package:euphoria/screens/signin.dart';
import 'package:euphoria/screens/signup.dart';
import 'package:euphoria/screens/test_new.dart';
import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Euphoria App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  //   with TickerProviderStateMixin {
  // TextEditingController textController;
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  // final animationsMap = {
  //   'containerOnPageLoadAnimation': AnimationInfo(
  //     trigger: AnimationTrigger.onPageLoad,
  //     duration: 600,
  //     fadeIn: true,
  //     initialState: AnimationState(
  //       offset: Offset(0, 0),
  //       scale: 1,
  //       opacity: 0,
  //     ),
  //     finalState: AnimationState(
  //       offset: Offset(0, 0),
  //       scale: 1,
  //       opacity: 1,
  //     ),
  //   ),
  // };

  // @override
  // void initState() {
  //   super.initState();
  //   startPageLoadAnimations(
  //     animationsMap.values
  //         .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
  //     this,
  //   );

  //   textController = TextEditingController();
  // }
  // ignore: non_constant_identifier_names
  bool vis_value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter Demo Home Page'),
      // ),

      backgroundColor: Colors.transparent,
      body:Signin(),
        
          
     
    );
  }
}
 

Widget _signup() {
  return Visibility(
    visible: true,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        // image: DecorationImage(
        //   fit: BoxFit.cover,
        //   image: Image.asset(
        //     'assets/images/bg.png',
        //   ).image,
        // ),
        shape: BoxShape.rectangle,
      ),
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                shape: BoxShape.rectangle,
                border: const GradientBoxBorder(
                  gradient: LinearGradient(
                      colors: [Color(0xFFFFC179), Color(0x0ffffff1)]),
                  width: 1,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x00EEEEEE),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 1,
                            color: Color(0xE32B2A2A),
                          )
                        ],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFFC179),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                              'First Name',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFC179),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 25, 10),
                              child: TextFormField(
                                // controller: textController1,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
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
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),

                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x00EEEEEE),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFFC179),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                              'Last Name',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFC179),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded( 
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 25, 10),
                              child: TextFormField(
                                // controller: textController2,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
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
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),

                                keyboardType: TextInputType.phone,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 40),
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x00EEEEEE),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFFC179),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFC179),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  10, 0, 25, 0),
                              child: TextFormField(
                                // controller: textController3,
                                obscureText: false,
                                decoration: const InputDecoration(
                                  isDense: true,
                                  hintText: 'test@123.com',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFFFFC179),
                                    fontSize: 14,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                      width: 1,
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
                                          0, 0, 0, 3),
                                ),
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.start,
                                keyboardType: TextInputType.emailAddress,
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return '@ .com';
                                  }

                                  return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0x00EEEEEE),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color(0xFFFFC179),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 20),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFC179),
                                fontSize: 14,
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ]),
    ),
  );
}
