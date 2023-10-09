import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class SocialIcon extends StatefulWidget {
  final String path;
  final String url;

  const SocialIcon({super.key, required this.path, required this.url});

  @override
  State<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<SocialIcon> {
  bool isHover = false;

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.url))) {
      throw Exception('Could not launch ${widget.url}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isHover ? 0 : 4.0),
      child: InkWell(
        onHover: (action) {
          setState(() {
            isHover = action;
          });
        },
        onTap: _launchUrl,
        child: Image.asset(widget.path,width: 50,height: 50,),
      ),
    );
  }
}