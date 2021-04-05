import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_render.dart';
import 'package:flutter_html/style.dart';


class ShowRegularPost extends StatefulWidget {
  final String postContent;
  ShowRegularPost({this.postContent});
  @override
  _ShowRegularPostState createState() => _ShowRegularPostState();
}

class _ShowRegularPostState extends State<ShowRegularPost> {
  @override
  Widget build(BuildContext context) {
    String htmlData = widget.postContent;
    return Container(
      child: SingleChildScrollView(
        child: Html(
          style: {"p":Style(color: Colors.white)},
          data: htmlData,
          //Optional parameters:
          customImageRenders: {
            networkSourceMatcher(domains: ["techzombie.gr"]):
                (context, attributes, element) {
              return FlutterLogo(size: 36);
            },
            networkSourceMatcher(domains: ["techzombie.gr"]): networkImageRender(
              headers: {"Custom-Header": "some-value"},
              altWidget: (alt) => Text(alt),
              loadingWidget: () => Text("Loading..."),
            ),
            // On relative paths starting with /wiki, prefix with a base url
                (attr, _) => attr["src"] != null && attr["src"].startsWith("/wiki"):
            networkImageRender(
                mapUrl: (url) => "https://upload.wikimedia.org" + url),
            // Custom placeholder image for broken links
            networkSourceMatcher(): networkImageRender(altWidget: (_) => FlutterLogo()),
          },
          onLinkTap: (url) {
            print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
      ),
    );
  }
}
