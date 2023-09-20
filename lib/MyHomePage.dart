import 'package:blocapi/AddPostScreen.dart';
import 'package:blocapi/bloc/add_dellete_post_bloc.dart';
import 'package:blocapi/bloc/get_and_update_post_bloc.dart';
import 'package:blocapi/update_With_patch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocListener<AddDelletePostBloc, AddDelletePostState>(
            listener: (context, state) {
              if (state is SuccessfullyState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Container(
                  color: Colors.green,
                  child: Text('Deleted Succesfully'),
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
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddPost(),
                  ));
                },
                icon: Icon(Icons.navigate_next_sharp)),
          )
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<GetAndUpdatePostBloc, GetAndUpdatePostState>(
        bloc: context.read<GetAndUpdatePostBloc>()..add(GetAllPostEvent()),
        builder: (context, state) {
          if (state is GetAndUpdatePostInitial) {}
          if (state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.amber),
            );
          }
          if (state is LoadedgState) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.8,
              child: ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      title: Text(state.posts[index].title!),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          context
                              .read<AddDelletePostBloc>()
                              .add(DeletePost(id: state.posts[index].id!));
                        },
                      ),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    )
                  ],
                ),
              ),
            );
          }
          if (state is ErrorGetState) {
            return Center(
              child: Text(
                state.msg,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }
          return SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => UpdatePatch(),
          ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
