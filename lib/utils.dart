///Create a function written in dart language that takes to, subject, content as parameters. This function sends an email to azadderdogan@gmail.com with smtp.
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

Future<void> sendMail(String to, String subject, String content) async {
  String username = '';
  String password = '';

  final smtpServer = gmailSaslXoauth2(username, password);
  final message = Message()
    ..from = Address(username, 'Azad')
    ..recipients.add(to)
    ..subject = subject
    ..text = content;

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}
