import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    animation = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.white,
    ).animate(controller);

    //Fun Animation stuff
    // animation.addStatusListener((status) {
    //   if(animation.isCompleted){
    //     controller.reverse(from: 1);
    //   }else if(animation.isDismissed){
    //     controller.forward();
    //   }
    // });

    controller.forward();
    controller.addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    height: 60,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                          'Flash Chat',
                          speed: Duration(milliseconds: 200),
                      ),
                    ],
                    isRepeatingAnimation: false,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            CustomMaterialButton(
              color: Colors.lightBlueAccent,
              label: "Log in",
              onPressed: (){
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            CustomMaterialButton(
                color: Colors.blueAccent,
                label: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationScreen.id);
                },
            ),
          ],
        ),
      ),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  final Color color;
  final String label;
  final VoidCallback onPressed;

  const CustomMaterialButton({super.key, required this.color, required this.label, required this.onPressed});




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            label,
          ),
        ),
      ),
    );
  }
}
