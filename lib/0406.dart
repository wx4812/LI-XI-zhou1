import 'dart:io';

void main() {
  String? nickname;
  late String displayName;

  print('닉네임을 입력하세요 (엔터만 누르면 기본값):');
  nickname = stdin.readLineSync();

  if (nickname == null || nickname.isEmpty) {
    displayName = '손님'; // 当用户未输入时，默认显示"손님"
  } else {
    displayName = nickname;
  }

  print('환영합니다. $displayName 님!');
}