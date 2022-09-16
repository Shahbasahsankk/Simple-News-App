import 'dart:developer';

import 'package:api_news_sample/models/person_data.dart';
import 'package:api_news_sample/services/person_services.dart';
import 'package:flutter/material.dart';

class PersonHome extends StatefulWidget {
  const PersonHome({super.key});

  @override
  State<PersonHome> createState() => _PersonHomeState();
}

class _PersonHomeState extends State<PersonHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: PersonService().getPersonData(),
          builder: (BuildContext context, AsyncSnapshot<PersonData> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: IconButton(
                onPressed: () async {
                  try {
                    await PersonService().getPersonData();
                  } catch (e) {
                    log(e.toString());
                  }
                  setState(() {});
                },
                icon: const Icon(Icons.refresh),
              ));
            }
            if (snapshot.hasData) {
              final data = snapshot.data;
              return ListView(
                children: List.generate(
                  data!.data.length,
                  (index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data.data[index].avatar),
                      ),
                      title: Text(data.data[index].firstName),
                      subtitle: Text(data.data[index].lastName),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('error'),
              );
            }
          },
        ),
      ),
    );
  }
}
