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
        icon: _getUserIconStack(status),
        onPressed: () {
          _bloc.saveApiKey("T5rmFtnJ2SMhjkhpHPRMGY3A");
        },
      );
    });
  }

  Widget _getUserIconStack(UserState state) {
    var ss = Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 33,
            width: 33,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.person,
            color: Colors.indigo,
          ),
        )
      ],
    );

    if (state is UserLoadedState) {
      if (state.user.profileImage90 != null) {
        ss.children.add(
          Align(
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.network(
                state.user.profileImage90,
                fit: BoxFit.cover,
                height: 30,
                width: 30,
              ),
            ),
          ),
        );
      } else {
        ss.children.add(
          Align(
            alignment: Alignment.center,
            child: Text(
              state.user.name[0],
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
    return ss;
  }

  
}
