import '../Data/model/Posts.dart';
import 'package:flutter/material.dart';

import 'Data/DataProviders.dart';

class UpdatePut extends StatefulWidget {
  const UpdatePut({super.key, required this.post});
  final Posts post;

  @override
  State<UpdatePut> createState() => _UpdatePutState();
}

class _UpdatePutState extends State<UpdatePut> {
  DataProviders dataProviders = DataProviders();
  GlobalKey _formkey = GlobalKey<FormState>();
  TextEditingController bodycontr = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController uid = TextEditingController();
  TextEditingController id = TextEditingController();
  @override
  void initState() {
    bodycontr.text = widget.post.body!;
    title.text = widget.post.title!;
    uid.text = widget.post.userId!.toString();
    id.text = widget.post.id!.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: bodycontr,
                    decoration: InputDecoration(hintText: 'body'),
                  ),
                  TextFormField(
                    controller: title,
                    decoration: InputDecoration(hintText: 'title'),
                  ),
                  TextFormField(
                    controller: uid,
                    decoration: InputDecoration(hintText: 'User Id'),
                  ),
                  TextFormField(
                    controller: id,
                    decoration: InputDecoration(hintText: 'id'),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        dataProviders.update_Post_put(Posts(
                            body: bodycontr.text.trim(),
                            id: int.parse(id.text.trim()),
                            title: title.text.trim(),
                            userId: int.parse(uid.text.trim())));
                      },
                      child: Text("update"))
                ],
              ))),
    );
  }
}
