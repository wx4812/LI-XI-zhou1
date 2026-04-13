// 定义学生信息输出函数
void printStudentInfo(String name, {required int age, String major = '未定'}) {
  print('姓名：$name，年龄：$age，专业：$major');
}

void main() {
  // 情况1：姓名 김민수，年龄 21，专业 软件工程
  printStudentInfo('김민수', age: 21, major: '软件工程');

  // 情况2：姓名 이지은，年龄 19，省略专业（使用默认值"未定"）
  printStudentInfo('이지은', age: 19);
}