import 'package:flutter/material.dart';
import 'package:simple_rsa2/simple_rsa2.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Simple RSA Encryption',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final publicKey =
      "MIIBITANBgkqhkiG9w0BAQEFAAOCAQ4AMIIBCQKCAQBuAGGBgg9nuf6D2c5AIHc8vZ6KoVwd0imeFVYbpMdgv4yYi5obtB/VYqLryLsucZLFeko+q1fi871ZzGjFtYXY9Hh1Q5e10E5hwN1Tx6nIlIztrh5S9uV4uzAR47k2nng7hh6vuZ33kak2hY940RSLH5l9E5cKoUXuQNtrIKTS4kPZ5IOUSxZ5xfWBXWoldhe+Nk7VIxxL97Tk0BjM0fJ38rBwv3++eAZxwZoLNmHx9wF92XKG+26I+gVGKKagyToU/xEjIqlpuZ90zesYdjV+u0iQjowgbzt3ASOnvJSpJu/oJ6XrWR3egPoTSx+HyX1dKv9+q7uLl6pXqGVVNs+/AgMBAAE=";

  final privateKey =
      "MIIEoQIBAAKCAQBuAGGBgg9nuf6D2c5AIHc8vZ6KoVwd0imeFVYbpMdgv4yYi5obtB/VYqLryLsucZLFeko+q1fi871ZzGjFtYXY9Hh1Q5e10E5hwN1Tx6nIlIztrh5S9uV4uzAR47k2nng7hh6vuZ33kak2hY940RSLH5l9E5cKoUXuQNtrIKTS4kPZ5IOUSxZ5xfWBXWoldhe+Nk7VIxxL97Tk0BjM0fJ38rBwv3++eAZxwZoLNmHx9wF92XKG+26I+gVGKKagyToU/xEjIqlpuZ90zesYdjV+u0iQjowgbzt3ASOnvJSpJu/oJ6XrWR3egPoTSx+HyX1dKv9+q7uLl6pXqGVVNs+/AgMBAAECggEANG9qC1n8De3TLPa+IkNXk1SwJlUUnAJ6ZCi3iyXZBH1Kf8zMATizk/wYvVxKHbF1zTyl94mls0GMmSmfJ9+Hlguy//LgdoJ9Wouc9TrP7BUjuIivW8zlRc+08lIjD64qkfU0238XldORXbP82BKSQF8nwz97WE3YD+JKtZ4x83PX7hqC9zabLFIwFIbmJ4boeXzj4zl8B7tjuAPqR3JNxxKfvhpqPcGFE2Gd67KJrhcH5FIja4H/cNKjatKFcP6qNfCA7e+bua6bL0CyDzmmNSgz6rx6bthcJ65IKUVrJK6Y0sBcNQCAjqZDA0Bs/7ShGDL28REuCS1/udQzXyB7gQKBgQCrgy2pvqLREaOjdds6s1gbkeEsYo7wYlF4vFPg4sLIYeAt+ed0kn4NdSmtp4FXgGyNwg7WJEveKEW7IEAMQBSN0KthZU4sK9NEu2lW5ip9Mj0uzyUzU4lhB+zwKzZCorip/LIiOocFWtz9jwGZPCKC8expUEbMuU1PzlxrytHJaQKBgQCkMEciEHL0KF5mcZbQVeLaRuecQGI5JS4KcCRab24dGDt+EOKYchdzNdXdM8gCHNXb8RKYNYnHbCjheXHxV9Jo1is/Qi9nND5sT54gjfrHMKTWAtWKAaX55qKG0CEyBB87WqJMYdn7i4Rf0rsRNa1lbxQ+btX14d0xol9313VC5wKBgERD6Rfn9dwrHivAjCq4GXiXvr0w2V3adD0PEH+xIgAp3NXP4w0mBaALozQoOLYAOrTNqaQYPE5HT0Hk2zlFBClSBfS1IsE4DFYOFiZtZDoClhGch1z/ge2p/ue0+1rYc5HNL4WqL/W0rcMKeYNpSP8/lW5xckyn8Jq0M1sAFjIJAoGAQJvS0f/BDHz6MLvQCelSHGy8ZUscm7oatPbOB1xD62UGvCPu1uhGfAqaPrJKqTIpoaPqmkSvE+9m4tsEUGErph9o4zqrJqRzT/HAmrTkEw/8PU7eMrFVW9I68GvkNCdVFukiZoY23fpXu9FT1YDW28xrHepFfb1EamynvqPlO88CgYAvzzSt+d4FG03jwObhdZrmZxaJk0jkKu3JkxUmav9Zav3fDTX1hYxDNTLidazvUFfqN7wqSSPqajQmMoTySxmLI8gI4qC0QskB4lT1A8OfmjcDwbUzQGam5KpzymmKJA9DgQpPgEIjHAnw2dUDR+wI/Loywb0AGLIbszseCOlc2Q==";

  final myController = TextEditingController();
  String _stringEncoded = '';

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple RSA Encryption"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: myController,
                decoration: const InputDecoration(
                  hintText: "Write the text to be encrypted",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.yellow,
                  ),
                  onPressed: () async {
                    String tmp = "";
                    try {
                      if (_stringEncoded.isEmpty) {
                        final text = myController.text;
                        if (text.isNotEmpty) {
                          final tmp =
                              await encryptString(myController.text, publicKey);
                          setState(() {
                            _stringEncoded = tmp;
                            myController.clear();
                          });
                        }
                      } else {
                        tmp = await decryptString(_stringEncoded, privateKey);
                        setState(() {
                          _stringEncoded = "";
                          myController.text = tmp;
                        });
                      }
                    } catch (e) {
                      debugPrint('$e');
                    }
                  },
                  child: _stringEncoded.isEmpty
                      ? const Text("ENCODE")
                      : const Text("DECODE"),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: () async {
                      String tmp = "";
                      if (_stringEncoded.isNotEmpty) {
                        try {
                          tmp = await decryptString(_stringEncoded, privateKey);
                          setState(() {
                            _stringEncoded = "";
                            myController.text = tmp;
                          });
                        } catch (e) {
                          debugPrint('$e');
                        }
                      }
                    },
                    child: const Text("DECODE")),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() {
                      _stringEncoded = "";
                      myController.clear();
                    });
                  },
                  child: const Text("RESET"),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.orangeAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      const Text("STRING ENCODED"),
                      const Divider(),
                      Text(_stringEncoded),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
