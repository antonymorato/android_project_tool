import 'dart:io';

class ParseXml {
  static readFileAsync() async {
    const String subPath = '\\android\\main\\src\\';
    try {
      String res = await File('test.xml').readAsString();
      RegExp regExp = RegExp('package="\.\+"');
      var packageRes = regExp.firstMatch(res);
      var package =
          res.substring(packageRes.start + 'package='.length, packageRes.end);
      print('package:::$package');
      res = res.replaceFirst(package, '"com.de.pa.ckage"');
      print('res:' + res);
      await File('test.xml').writeAsString(res);
    } catch (e) {
      print('error read');
    }
  }
}
