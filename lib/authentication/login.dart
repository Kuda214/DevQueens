import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:hackathon_project/ask.dart';
import 'package:hackathon_project/home.dart';
// import 'package:stem_wiz/src/authentication/phone_number_auth.dart';
// import 'package:stem_wiz/src/home_page/home_page.dart';

// import '../../services/user_services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late bool isTextInvalid;
  bool isValidating = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
         
                const Image(
                    image: AssetImage(
                        'assets/Pictures/undraw_happy_women_day_fbjt (1).png')),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
                const Text(
                  'Welcome back!!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Information';
                            } else if (isTextInvalid) {
                              return 'Enter correct information';
                            } else {}
                            return null;
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Email'),
                        ),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Password'),
                        ),
                      )),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isValidating = true;
                      });
                      Future.delayed(
                        const Duration(milliseconds: 1500),
                        () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const Home()));
                          setState(() {
                            isValidating = false;
                          });
                        },
                      );
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        )),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFFEF9CAF)),
                        fixedSize: MaterialStateProperty.all<Size>(Size(
                            MediaQuery.of(context).size.width * 0.8,
                            MediaQuery.of(context).size.width * 0.12))),
                    child: isValidating
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            'Login',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          )),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("No account?"),
                    TextButton(onPressed: () {}, child: const Text('Sign up'))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      'Or sign in using',
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                    const Expanded(child: Divider())
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(MaterialPageRoute(
                    //     builder: (context) => const PhoneNumberAuth()));
                  },
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.height * 0.2,
                      decoration:
                          BoxDecoration(color: Colors.yellow.withOpacity(0.4)),
                      child: SignInButton(
                        Buttons.Google,
                        text: "Google",
                        onPressed: () {},
                      )
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: const [
                      //     Icon(
                      //       FontAws,
                      //     ),
                      //     Text('Phone Number')
                      //   ],
                      // ),
                      ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
