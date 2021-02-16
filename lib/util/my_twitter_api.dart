import 'dart:convert';

import 'package:http/http.dart';
import 'package:myemotion/models/my_tweet.dart';
import 'package:twitter_api/twitter_api.dart';

import 'environment.dart';

class MyTwitterApi {
  Future<List<MyTweet>> getTweet(String userName) async {
    var res = await _getTweet(userName);
    if (res == null) {
      return null;
    }

    var tweets = json.decode(res.body);
    if (tweets == null) {
      return null;
    }

    List<MyTweet> newTweetList = [];
    tweets.forEach((tweet) => newTweetList
        .add(MyTweet(tweet['full_text'], "Score:", tweet['created_at'])));
    return newTweetList;
  }

  Future<Response> _getTweet(String userName) async {
    final _twitterOauth = new twitterApi(
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      token: token,
      tokenSecret: tokenSecret,
    );

    if (userName.isEmpty) {
      userName = "default userName";
    }

    Future twitterRequest = _twitterOauth.getTwitterRequest(
      "GET",
      "statuses/user_timeline.json",
      options: {
//        "user_id": "",
        "screen_name": userName,
        "count": "20",
        "include_rts": "true",
        "tweet_mode": "extended", // Used to prevent truncating tweets
      },
    );

    return await twitterRequest;
  }
}
