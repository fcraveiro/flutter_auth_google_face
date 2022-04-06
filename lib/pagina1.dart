import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  @override
  Widget build(BuildContext context) {
    GoogleSignInAccount? user = _googleSignIn.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('aa'),
        centerTitle: true,
        actions: [
          user == null
              ? SizedBox(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    child: Image.asset(
                      'assets/imagens/profile.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              : SizedBox(
                  width: 30,
                  height: 30,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.photoUrl.toString(),
                      scale: 5,
                    ),
                  ),
                ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
                child: const Text('Sign In'),
                onPressed: user != null
                    ? null
                    : () async {
                        await _googleSignIn.signIn();
                        setState(() {});
                      }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                child: const Text('Sign Out'),
                onPressed: user == null
                    ? null
                    : () async {
                        await _googleSignIn.signOut();
                        setState(() {});
                      }),
          ],
        ),
      ),
    );
  }
}
