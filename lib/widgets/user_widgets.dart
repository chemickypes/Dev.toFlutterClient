import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:devtoclient/blocs/user_bloc/bloc.dart';
import 'package:devtoclient/blocs/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, status) {
      UserBloc _bloc = BlocProvider.of<UserBloc>(context);

      return IconButton(
        icon: ClipOval(
          child: _getUserIcon(status),
        ),
        onPressed: () {
          _bloc.saveApiKey("");
        },
      );
    });
  }

  Widget _getUserIcon(UserState state) {
    if (state is UserLoadedState && state.user.profileImage90 != null) {
      return Image.network(
        state.user.profileImage90,
        fit: BoxFit.cover,
        height: 30,
        width: 30,
      );
    } else {
      return Container(
        color: Colors.white,
        child: SizedBox(
          child:  Icon(
            Icons.person,
            color: Colors.indigo,
          ),
          height: 30,
          width: 30,
        ),
      );
    }
  }

 
}
