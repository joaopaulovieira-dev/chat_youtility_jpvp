import 'package:chat_youtility_jpvp/onesignal/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';
import 'package:http/http.dart' as http;

String linkApp =
    'https://play.google.com/store/apps/details?id=dev.joaopaulovieira.chat_youtility_jpvp  \nBaixe agora o App Chat Youtility - Suporte Remoto na Playstore.';
String subText = 'Conheça o App Conversor de Moedas';

int statusURL;

Future<void> getData() async {
  final request = Uri.http('177.207.171.102', 'index.php');
  final response = await http.get(request);
  statusURL = response.statusCode;
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // ignore: type_annotate_public_apis
  var bloc = BlocHome();

  @override
  void initState() {
    bloc.initOneSignal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      // AppBar(
      //   title: const Text('Chat Youtility - Suporte Remoto'),
      // ),
      backgroundColor: Colors.white,
      body: FutureBuilder<void>(
        future: getData(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (statusURL == 200) {
                debugPrint('IP Default: 177.207.171.102');
                return const WebviewScaffold(
                    url: '177.207.171.102', hidden: true);
                // ignore: invariant_booleans
              } else if (statusURL == 200) {
                debugPrint('IP Backup: 177.10.171.38');
                return const WebviewScaffold(
                    url: '177.10.171.38', hidden: true);
              } else {
                return Center(
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: <Widget>[
                        const Icon(
                          Icons.wifi_off,
                          color: Colors.grey,
                          size: 70,
                        ),
                        const SizedBox(height: 10),
                        const Text('Verifique a conexão com sua internet.'),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key key})
      // ignore: avoid_field_initializers_in_const_classes
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Chat Youtility - Suporte Remoto'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.share_outlined),
          color: Colors.white,
          iconSize: 25,
          onPressed: () {
            final RenderBox box = context.findRenderObject();
            Share.share(linkApp,
                subject: subText,
                sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
          },
        ),
      ],
    );
  }
}
