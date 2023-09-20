import 'package:blocapi/Data/DataProviders.dart';
import 'package:blocapi/Data/model/Posts.dart';
import 'package:blocapi/bloc/add_dellete_post_bloc.dart';
import 'package:blocapi/update_With_patch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPost extends StatelessWidget {
  AddPost({super.key});
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController bodycontr = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController uid = TextEditingController();
  TextEditingController id = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings_applications_outlined))
        ],
        title: Text('Add Post'),
      ),
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
                    validator: (value) {
                      if (value!.length < 1) {
                        return "invalid input";
                      }
                    },
                    decoration: InputDecoration(hintText: 'User Id'),
                  ),
                  TextFormField(
                    controller: id,
                    decoration: InputDecoration(hintText: 'id'),
                  ),
                  BlocListener<AddDelletePostBloc, AddDelletePostState>(
                    listener: (context, state) {
                      if (state is SuccessfullyState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Container(
                          color: Colors.green,
                          child: Text('Added Successfully'),
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          width: MediaQuery.sizeOf(context).width,
                        )));
                      }
                      if (state is ErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Container(
                          color: Colors.red,
                          child: Text('Somthing Went wrong'),
                          height: MediaQuery.sizeOf(context).height * 0.1,
                          width: MediaQuery.sizeOf(context).width,
                        )));
                      }
                    },
                    child: ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            context.read<AddDelletePostBloc>().add(AddPostEvent(
                                post: Posts(
                                    body: bodycontr.text,
                                    title: title.text,
                                    id: int.parse(id.text),
                                    userId: int.parse(uid.text))));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Container(
                              child: Text('Invalid inputs'),
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              width: MediaQuery.sizeOf(context).width,
                            )));
                          }
                        },
                        child: Text("update")),
                  )
                ],
              ))),
    );
  }
}
