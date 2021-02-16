import 'package:googleapis/language/v1.dart';
import 'package:googleapis_auth/auth_io.dart';

import 'environment.dart';

// ツイート文から感情分析を行うためのクラス
class SentimentAnalysis {
  Future<String> sentimentAnalysis(String message) async {
    AutoRefreshingAuthClient client =
        await clientViaServiceAccount(credentials, scopes);
    LanguageApi lang = LanguageApi(client);
    Document doc = Document();
    doc.content = message;
    doc.type = 'PLAIN_TEXT';
    AnalyzeSentimentRequest request = AnalyzeSentimentRequest();
    request.document = doc;
    AnalyzeSentimentResponse res =
        await lang.documents.analyzeSentiment(request);
    return "Score:\n" +
        res.documentSentiment.score.toString() +
        "\n" +
        emojiArray[(res.documentSentiment.score * 10).toInt() + 10];
//    return "Score ([-1.0, 1.0]) :\t" +
//        res.documentSentiment.score.toString() +
//        " : " +
//        emojiArray[(res.documentSentiment.score * 10).toInt() + 10] +
//        "\nMagnitude ([0, +inf)) :\t" +
//        res.documentSentiment.magnitude.toString();
  }
}
