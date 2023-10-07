import 'package:personalmeetingschedulingplatform/utils/flutter_toast_message.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  static launchSource() async {
    const githubUrl =
        "https://github.com/sabin6969/Personal-Meeting-Scheduling-Platform";
    if (await canLaunchUrl(Uri.parse(githubUrl))) {
      await launchUrl(Uri.parse(githubUrl));
    } else {
      ToastMessage.showToastMessage("Failed to load source code");
    }
  }
}
