


import 'package:groupe/models/customer.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class SendMail{

  Future<void> sendEmail(Message message) async {
    String username = '751f1ec2-2909-4af8-9887-3acf1ace307e';
    String password = '751f1ec2-2909-4af8-9887-3acf1ace307e';

    final smtpServer = SmtpServer(
        'smtp.postmarkapp.com',
        port: 587,
        ignoreBadCertificate: false,
        ssl: false,
        allowInsecure: false,
        xoauth2Token: username,
        username: username,
        password: password
    );

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent. ' + e.message);
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

}