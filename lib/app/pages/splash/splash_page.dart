import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  final _controller;

  const SplashPage(this._controller, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: _controller.checkHasToken(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Você não tem um token de acesso!'),
                const SizedBox(height: 12),
                const Text('Acesse o site: https://www.superheroapi.com/'),
                const SizedBox(height: 12),
                const Text('Cole o seu Token abaixo e clique PRONTO',
                    style: TextStyle(letterSpacing: 3.0)),
                const SizedBox(height: 12),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Seu Token',
                  ),
                  onChanged: _controller.changeTokenText,
                ),
                const SizedBox(height: 12),
                RaisedButton(
                  child: const Text('PRONTO'),
                  onPressed: _controller.checkIfTheTokenIsValid,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
