import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/home/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tabbar extends StatefulWidget {
  final UserModel? user;
  const Tabbar({super.key, required this.user});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: BlocListener<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Success) {
                  Navigator.pushReplacementNamed(context, '/signin');
                } else if (state is Error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.error)),
                  );
                }
              },
              child: GestureDetector(
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/profile.jpg"),
                    radius: 30,
                  ),
                  onTap: () async {
                    context.read<AuthCubit>().signOut();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                      (route) => false,
                    );
                  }),
            ),
          )
        ],
        centerTitle: true,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.user!.username),
                Icon(Icons.arrow_drop_down_outlined)
              ],
            ),
            Text(
              "cité 1200 El biar, Alger",
              style: TextStyle(fontSize: 14, color: AppColor.primary),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: Image.asset("assets/logo.png"),
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.location_pin)),
          Tab(icon: Icon(Icons.favorite)),
          Tab(icon: Icon(Icons.person)),
        ],
        labelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
        indicatorWeight: 1,
        labelColor: AppColor.primary,
        unselectedLabelColor: AppColor.primary,
        indicatorColor: AppColor.primary,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Home(user: widget.user),
          const Center(child: Text("Location")),
          const Center(child: Text("Favorites")),
          const Center(child: Text("Profile")),
        ],
      ),
    );
  }
}
