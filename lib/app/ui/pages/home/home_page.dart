import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';

import 'package:flutter_meedu/state.dart';
import 'package:rickandmorty/app/ui/pages/details/details_page.dart';

import 'controller/home_controller.dart';

final homeProvider = SimpleProvider(
  (_) => HomeController(),
);

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, watch) {
    final prueba = watch(homeProvider);
    prueba.fetchData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Hero(
          tag: 'logo',
          child: Image.asset(
            'assets/logo.png',
            width: 150,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed:()=> prueba.decrement(),
            icon: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.black54,
            ),
          ),
        ],
        leading: IconButton(
          onPressed:()=> prueba.increment(),
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black54,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              thickness: 1.5,
            ),
            itemCount: prueba.datosList.length,
            itemBuilder: (context, index) {
              final data = prueba.datosList[index];
              return ListTile(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsPage(
                      name: data.name,
                      id: data.id,
                      gender: data.gender,
                      species: data.species,
                      status: data.status,
                      image: data.image,
                    ),
                  ),
                ),
                leading: Hero(
                  tag: data.id,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image: data.image,
                      ),
                    ),
                  ),
                ),
                title: Text(data.name),
                subtitle: Text(data.species),
              );
            },
          ),
        ),
      ),
    );
  }
}

// PageView(
//             scrollDirection: Axis.vertical,
//             children: List.generate(
//               prueba.datosList.length,
//               (index) {
//                 final data = prueba.datosList[index];
//                 const style =
//                     TextStyle(fontSize: 20, fontWeight: FontWeight.w300);
//                 return 
