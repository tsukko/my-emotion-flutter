import 'package:flutter/material.dart';
import 'package:flutter_twitter/flutter_twitter.dart';

import '../util/environment.dart';
import '../util/shared_preferences_util.dart';

// Twitterのログイン・ログアウトを行う画面
class TwitterLoginView extends StatefulWidget {
  @override
  _TwitterLoginViewState createState() => _TwitterLoginViewState();
}

class _TwitterLoginViewState extends State<TwitterLoginView> {
  static final TwitterLogin twitterLogin = new TwitterLogin(
    consumerKey: consumerKey,
    consumerSecret: consumerSecret,
  );

  String _message = 'Logged out.';
  String _userName = '';
  String _user_Id = '';

  void _login() async {
    final TwitterLoginResult result = await twitterLogin.authorize();
    String newMessage;

    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        _userName = result.session.username;
        newMessage = 'Login! username: $_userName';
        await SharedPreferencesUtil().saveDefaultUserName(_userName);
        break;
      case TwitterLoginStatus.cancelledByUser:
        newMessage = 'Login cancelled by user.';
        break;
      case TwitterLoginStatus.error:
        newMessage = 'Login error: ${result.errorMessage}';
        break;
    }

    setState(() {
      _message = newMessage;
    });
  }

  void _logout() async {
    await twitterLogin.logOut();

    setState(() {
      _message = 'log out.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(envTitle('Twitter login sample')),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(_message),
              new RaisedButton(
                child: new Text('Log in'),
                onPressed: _login,
              ),
              new RaisedButton(
                child: new Text('Log out'),
                onPressed: _logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
