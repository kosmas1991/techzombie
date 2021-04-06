import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/image_render.dart';
import 'package:flutter_html/style.dart';
import 'package:url_launcher/url_launcher.dart';

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
          style: {
            "p": Style(color: Colors.white),
            "li": Style(color: Colors.white),
            "em": Style(fontWeight: FontWeight.bold),
            "blockquote": Style(fontWeight: FontWeight.bold),
            "a": Style(color: Colors.red)
          },
          data: htmlData,
          //Optional parameters:
          customImageRenders: {
            networkSourceMatcher(domains: ["techzombie.gr"]):
                (context, attributes, element) {
              return Image.network(getImageUrl(element.outerHtml.toString()),);
              //return FlutterLogo(size: 80);
            },
            networkSourceMatcher(domains: ["techzombie.gr"]):
                networkImageRender(
              headers: {"Custom-Header": "some-value"},
              altWidget: (alt) => Text(alt),
              loadingWidget: () => Text("Loading..."),
            ),
            // On relative paths starting with /wiki, prefix with a base url
            (attr, _) => attr["src"] != null && attr["src"].startsWith("/wiki"):
                networkImageRender(
                    mapUrl: (url) => "https://upload.wikimedia.org" + url),
            // Custom placeholder image for broken links
            networkSourceMatcher():
                networkImageRender(altWidget: (_) => FlutterLogo()),
          },
          onLinkTap: (url) async{
            print("Opening $url...");
            if (await canLaunch(url)) {
            await launch(
            url,
            forceSafariVC: false,
            forceWebView: false,
            headers: <String, String>{'my_header_key': 'my_header_value'},
            );
            } else {
            throw 'Could not launch $url';
            }
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
  String getImageUrl(String linkData){
    List<String> lista = linkData.split(RegExp('src=\"'));
    List<String> lista2 = lista[1].split(RegExp('\"'));
    return lista2[0];
  }
}
