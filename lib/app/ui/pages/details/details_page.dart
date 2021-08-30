import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.name,
    required this.id,
    required this.gender,
    required this.species,
    required this.status,
    required this.image,
  }) : super(key: key);

  final String name, gender, species, status, image;
  final int id;

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF33A5BD),
        elevation: 0,
        title: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/logo.png',
            width: 150,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF33A5BD),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: RotatedBox(
                quarterTurns: 3,
                child: Row(
                  children: [
                    Container(),
                    const Spacer(),
                    const Text(
                      'ABOUT',
                      style: style,
                    ),
                    const Spacer(),
                    const Text(
                      'NAME',
                      style: style,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 2,
                      width: 150,
                      color: Colors.black,
                    ),
                    const Icon(
                      Icons.more_horiz_outlined,
                      size: 40,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: id,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.contain,
                          placeholder: 'assets/loading.gif',
                          image: image,
                        ),
                      ),
                      radius: 100,
                    ),
                  ),
                  Text(
                    name,
                    style: style.copyWith(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        About(
                          text: 'Genero: ',
                          value: gender,
                        ),
                        About(
                          text: 'Especie: ',
                          value: species,
                        ),
                        About(
                          text: 'status: ',
                          value: status,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final String text, value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: const Color(0xFF665229),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
