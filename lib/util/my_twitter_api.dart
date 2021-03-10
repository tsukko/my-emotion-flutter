import 'dart:convert';

import 'package:dart_twitter_api/twitter_api.dart';
import 'package:http/http.dart';

import '../models/my_tweet.dart';
import 'environment.dart';

class MyTwitterApi {
  final twitterApi = TwitterApi(
    client: TwitterClient(
      consumerKey: consumerKey,
      consumerSecret: consumerSecret,
      token: token,
      secret: tokenSecret,
    ),
  );

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
    if (userName.isEmpty) {
      userName = "default userName";
    }

    Future twitterRequest = twitterApi.timelineService.userTimeline();
//     .getTwitterRequest(
//       "GET",
//       "statuses/user_timeline.json",
//       options: {
// //        "user_id": "",
//         "screen_name": userName,
//         "count": "20",
//         "include_rts": "true",
//         "tweet_mode": "extended", // Used to prevent truncating tweets
//       },
//     );

    return await twitterRequest;
  }
}
