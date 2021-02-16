import 'package:flutter/material.dart';

import '../models/my_tweet.dart';
import '../util/environment.dart';
import '../util/my_twitter_api.dart';
import '../util/sentiment_analysis.dart';
import '../util/shared_preferences_util.dart';

// ツイート文から感情分析した結果を一覧表示する画面
class TweetEmotionView extends StatefulWidget {
  @override
  _TweetEmotionViewState createState() => _TweetEmotionViewState();
}

// ここを参考にする
// https://qiita.com/ysato5654/items/22681aba209168f53a53
class _TweetEmotionViewState extends State<TweetEmotionView> {
  String _userName = '';
  List<MyTweet> tweetDataList;

  Future<void> _readUserName() async {
    _userName = await SharedPreferencesUtil().getDefaultUserName();
    setState(() {});
  }

  Future<void> _sentimentAnalysis(MyTweet tweet) async {
    String res = await SentimentAnalysis().sentimentAnalysis(tweet.tweet);
    setState(() {
      tweet.updateSentiment(res);
      print("tweet sentiment:  $res");
    });
  }

  Future<void> _getTweet() async {
    List<MyTweet> list = await MyTwitterApi().getTweet(_userName);
    setState(() {
      tweetDataList = list;
      list.asMap().forEach((index, tweet) => _sentimentAnalysis(tweet));
    });
  }

  @override
  void initState() {
    super.initState();
    _readUserName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(envTitle('Tweet Sentiment Analysis')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(_userName),
          RaisedButton(
            child: new Text('Get latest tweet'),
            onPressed: _getTweet,
          ),
          const Divider(height: 4.0, thickness: 2.0),
          Expanded(child: _docList()),
        ],
      ),
    );
  }

  Widget _docList() {
    return tweetDataList == null
        ? Container()
        : ListView.builder(
            itemCount: tweetDataList.length,
            itemBuilder: (context, index) {
              final item = tweetDataList[index];
              return Column(
                children: <Widget>[
                  ListTile(
                    trailing: Text(item.sentiment),
                    title: Text(item.tweet),
                    subtitle: Text(item.time),
                    onTap: () {},
                  ),
                  const Divider(height: 4.0, thickness: 1.0),
                ],
              );
            },
          );
  }
}
