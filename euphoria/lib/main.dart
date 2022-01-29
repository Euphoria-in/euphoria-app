import 'package:expandable_bottom_sheet/expandable_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Flutter Demo Home Page'),
      // ),

      backgroundColor: Colors.white,
      body: ExpandableBottomSheet(
        background: Container(
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
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: const Color(0x00FFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: const GradientBoxBorder(
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFC179), Color(0x0ffffff1)]),
                    width: 2,
                  ),

                  // Border.all(
                  //   color: const Color(0xFFFFC179),
                  // ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 30),
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0x00EEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [Color(0xFFFFC179), Color(0x0ffffff1)]),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 3, 0),
                              child: FaIcon(
                                FontAwesomeIcons.phoneAlt,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                              child: Text(
                                '+91',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 25, 0),
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 40),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0x00EEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: const GradientBoxBorder(
                            gradient: LinearGradient(
                                colors: [Color(0xFFFFC179), Color(0x0ffffff1)]),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: const [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 3, 0),
                              child: FaIcon(
                                FontAwesomeIcons.google,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: Text(
                                'continue with google',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0x00EEEEEE),
                        borderRadius: BorderRadius.circular(10),
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(
                              colors: [Color(0xFFFFC179), Color(0x0ffffff1)]),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: const [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(10, 0, 3, 0),
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'continue with facebook',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        expandableContent:
        
         Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 400,
                decoration: BoxDecoration(
                  color: Color(0x00FFFFFF),
                  borderRadius: BorderRadius.circular(20),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Color(0xFFFFC179),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFFFC179),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                                  style:const TextStyle(
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
                      padding: EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                      child: Container(
                        width: 250,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Color(0x00EEEEEE),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color(0xFFFFC179),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                                      borderRadius:  BorderRadius.only(
                                        topLeft: Radius.circular(4.0),
                                        topRight: Radius.circular(4.0),
                                      ),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius:  BorderRadius.only(
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
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
                                    hintStyle:
                                        TextStyle(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFFFFC179),
                                          fontSize: 14,
                                        ),
                                        
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white,
                                        width: 1,
                                      ),
                                      borderRadius:  BorderRadius.only(
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
                        color: Color(0x00EEEEEE),
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
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Submit',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color(0xFFFFC179),
                                fontSize: 14,
                              ),
                              )
                            ),
                          
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
      ),
    );
  }
}
