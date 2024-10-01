import 'package:cubit_practise/cubit/users_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersInitial) {
            return Center(
              child: ElevatedButton(
                  child: const Text("Get Users"),
                  onPressed: () => context.read<UsersCubit>().fetchUsers()),
            );
          }
          else if (state is UsersSucces) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(state.users[index].name),
                subtitle: Text(state.users[index].email),
              ),
            );
          }
          else if(state is UsersLoading){
            return const Center(child: CircularProgressIndicator(),);
          }else if (state is UsersError){
            return Center(child: Text(state.errorMessage));
          }else
            return const Text("NO DATA");
        },
      ),
    );
  }
}
