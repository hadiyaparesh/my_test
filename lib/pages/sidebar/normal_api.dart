
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NormalPage extends StatefulWidget {
  const NormalPage({super.key});

  @override
  State<NormalPage> createState() => _NormalPageState();
}

class _NormalPageState extends State<NormalPage> {
  List<Photos> photosList = [];
  bool isLoading = false;

  Future<void> getphotos() async {
    setState(() {
      isLoading = true;
    });

    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      photosList.clear(); // Clear the existing list before adding new data
      for (Map<String, dynamic> i in data) {
        Photos photos = Photos(
            title: i["title"], thumbnailUrl: i["thumbnailUrl"], id: i["id"]);
        photosList.add(photos);
      }
    } else {
      print("error is generated");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getphotos();
        },
        child: Icon(Icons.add_a_photo),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text("API Calling List View"),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : photosList.isEmpty
              ? Center(child: Text('Press the button to load Api Details'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: photosList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                photosList[index].thumbnailUrl,
                              ),
                            ),
                            title: Text(
                                "Photo ID: " + photosList[index].id.toString()),
                            subtitle: Text(photosList[index].title),
                          );
                        },
                      ),
                    )
                  ],
                ),
    );
  }
}

class Photos {
  String title, thumbnailUrl;
  int id;

  Photos({required this.title, required this.thumbnailUrl, required this.id});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
      id: json['id'],
    );
  }
}
