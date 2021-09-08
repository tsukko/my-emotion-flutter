import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Map<String, List<String>> dialogStr = {
  'D0000': ['更新確認', '文書の更新確認をしますか', 'OK', 'キャンセル'],
  'D0001': ['検索条件の削除', '検索条件を削除しますか', 'OK', 'キャンセル'],
  'D0002': ['検索条件の保存', '検索条件を保存しますか', 'OK', 'キャンセル'],
  'D0003': ['お気に入りへの登録', '登録しますか', 'OK', 'キャンセル'],
};

enum Answers { yes, no }

Widget _buildSignOutDialogAndroid(BuildContext context, List<String> data) {
  return AlertDialog(
      title: Text(data[0]),
      content: Text(data[1]),
      actions: <Widget>[
        FlatButton(
          child: Text(data[3]),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        FlatButton(
          child: Text(data[2]),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]);
}

Widget _buildSignOutDialogiOS(BuildContext context, List<String> data) {
  return CupertinoAlertDialog(
      title: Text(data[0]),
      content: Text(data[1]),
      actions: <Widget>[
        CupertinoDialogAction(
          child: Text(data[3]),
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        CupertinoDialogAction(
          child: Text(data[2]),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ]);
}

void showBasicDialog(BuildContext context, String dialogKey) {
  final data = dialogStr[dialogKey];

//  StatelessWidget dialog;
  final dialog = (Platform.isIOS
      ? _buildSignOutDialogiOS(context, data)
      : _buildSignOutDialogAndroid(context, data)) as StatelessWidget;

  showDialog<Answers>(
    context: context,
    builder: (context) {
      return dialog;
    },
  ).then(
    (value) {
      switch (value) {
        case Answers.yes:
//        _setValue('Yes');
          break;
        case Answers.no:
//        _setValue('No');
          break;
      }
    },
  );
}
