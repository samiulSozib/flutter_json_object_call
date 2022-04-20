import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rajib_demo/HttpService.dart';
import 'package:rajib_demo/Note.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  HttpService httpService = HttpService();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rest API Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder(
          future: httpService.getNotes(),
          builder: (BuildContext context,
              AsyncSnapshot<List<NoteElement>> snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text("${snapshot.data![index].id}"),
                      subtitle: Text("${snapshot.data![index].title}"),
                    ),
                  );
                },
              ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
