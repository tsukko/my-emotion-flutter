// Tweetの情報
class MyTweet {
  MyTweet(this.tweet, this.sentiment, this.time);

  final String tweet;
  String sentiment;
  final String time;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tweet': tweet,
      'sentiment': sentiment,
      'time': time,
    };
  }

  void updateSentiment(String sentiment) {
    this.sentiment = sentiment;
  }
}
