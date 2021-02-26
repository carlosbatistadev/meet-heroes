import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/custom_text_widget.dart';
import 'widgets/information_widget.dart';

class DetailPage extends StatelessWidget {
  final _controller;

  const DetailPage(this._controller, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.network(
                  _controller.character.image.url,
                  fit: BoxFit.cover,
                  frameBuilder: (BuildContext context, Widget child, int frame,
                      bool wasSynchronouslyLoaded) {
                    return child;
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    return Center(child: child);
                  },
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: Get.back,
                      ),
                      const Text(
                        'Detalhes',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Hero',
                          fontSize: 35,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite_border_sharp,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // TODO: FALTA IMPLEMENTAR
                        },
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Text(
                    _controller.character.name,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  informationWidget(
                    'Biography',
                    [
                      customText(
                        title: 'Full Name',
                        content: _controller.character.biography.fullName,
                      ),
                      customText(
                        title: 'Alter Egos',
                        content: _controller.character.biography.alterEgos,
                      ),
                      customText(
                        title: 'Aliases',
                        content:
                            _controller.character.biography.aliases.toString(),
                      ),
                      customText(
                        title: 'Place Of Birth',
                        content: _controller.character.biography.placeOfBirth,
                      ),
                      customText(
                        title: 'First Appearance',
                        content:
                            _controller.character.biography.firstAppearance,
                      ),
                      customText(
                        title: 'Publisher',
                        content: _controller.character.biography.publisher,
                      ),
                      customText(
                        title: 'Alignments',
                        content: _controller.character.biography.alignment,
                      ),
                    ],
                  ),
                  informationWidget(
                    'Appearance',
                    [
                      customText(
                        title: 'Gender',
                        content: _controller.character.appearance.gender,
                      ),
                      customText(
                        title: 'Race',
                        content: _controller.character.appearance.race,
                      ),
                      customText(
                        title: 'Height',
                        content:
                            _controller.character.appearance.height.toString(),
                      ),
                      customText(
                        title: 'Weight',
                        content:
                            _controller.character.appearance.weight.toString(),
                      ),
                      customText(
                        title: 'Eye Color',
                        content: _controller.character.appearance.eyeColor,
                      ),
                      customText(
                        title: 'Hair Color',
                        content: _controller.character.appearance.hairColor,
                      ),
                    ],
                  ),
                  informationWidget(
                    'Work',
                    [
                      customText(
                        title: 'Occupation',
                        content: _controller.character.work.occupation,
                      ),
                      customText(
                        title: 'Base',
                        content: _controller.character.work.base,
                      ),
                    ],
                  ),
                  informationWidget(
                    'Connections',
                    [
                      customText(
                        title: 'Group Affiliation',
                        content:
                            _controller.character.connections.groupAffiliation,
                      ),
                      customText(
                        title: 'Relatives',
                        content: _controller.character.connections.relatives,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
