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

      return _getIcon(status, (){
        _bloc.saveApiKey('');
      });
    });
  }

  Widget _getIcon(UserState state, Function action) {
    Widget icon = Container();
    if (state is UserLoadedState) {
      icon = CircularProfileAvatar(
        state.user.profileImage,
        radius: 20,
        backgroundColor: Colors.transparent,
        borderWidth: 1,
        borderColor: Colors.white,
        cacheImage: true,
        initialsText: Text(state.user.name[0], style: TextStyle(color: Colors.white, fontSize: 18),),
        onTap: () {
          print("image tap");
         // action();
        },
      );
    } else {
      icon = IconButton(
        icon: Icon(
        Icons.person,
      ),
        onPressed: () {
          print('click');
           action();
        },
      );
    }

    return icon;
  }
}
