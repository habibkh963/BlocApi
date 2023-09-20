import 'package:blocapi/bloc/get_and_update_post_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Data/model/Posts.dart';
import 'package:flutter/material.dart';

import 'Data/DataProviders.dart';

class UpdatePatch extends StatefulWidget {
  const UpdatePatch({
    super.key,
  });

  @override
  State<UpdatePatch> createState() => _UpdatePatchState();
}

class _UpdatePatchState extends State<UpdatePatch> {
  DataProviders dataProviders = DataProviders();
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController bodycontr = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController uid = TextEditingController();
  TextEditingController id = TextEditingController();
  // @override
  // void initState() {
  //   bodycontr.text = widget.post.body!;
  //   title.text = widget.post.title!;
  //   uid.text = widget.post.userId!.toString();
  //   id.text = widget.post.id!.toString();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: BlocListener<GetAndUpdatePostBloc, GetAndUpdatePostState>(
        listener: (context, state) {
          if (state is UpdatedState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              color: Colors.amber,
              child: Text('Updated Sucesfully '),
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width,
            )));
          }
          if (state is ErrorGetState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Container(
              color: Colors.red,
              child: Text('Somthing went wrong ${state.msg}'),
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width,
            )));
          }
        },
        child: SafeArea(
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
                    ElevatedButton(
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            context
                                .read<GetAndUpdatePostBloc>()
                                .add(UpdatePostEvent(
                                    post: Posts(
                                  userId: int.parse(uid.text.trim()),
                                  id: int.parse(id.text.trim()),
                                  title: title.text.trim(),
                                  body: bodycontr.text.trim(),
                                )));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Container(
                              child: Text('Invalid inputs'),
                              height: MediaQuery.sizeOf(context).height * 0.1,
                              width: MediaQuery.sizeOf(context).width,
                            )));
                          }
                        },
                        child: Text("update"))
                  ],
                ))),
      ),
    );
  }
}
