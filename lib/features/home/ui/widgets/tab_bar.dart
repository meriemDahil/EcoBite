import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/features/Authentification/data/user_model.dart';
import 'package:eco_bite/features/Authentification/logic/cubit/auth_cubit.dart';
import 'package:eco_bite/features/Authentification/ui/sign_in.dart';
import 'package:eco_bite/features/create_offre/data/offer_model.dart';
import 'package:eco_bite/features/home/ui/home.dart';
import 'package:eco_bite/features/panier/ui/panier.dart';
import 'package:eco_bite/features/profile/ui/profile.dart';
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

  // Panier state
  List<OfferModel> panier = [];
  final PanierCacheService _panierCacheService = PanierCacheService();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadPanierFromCache(); // Load panier from cache on app startup
  }

  // Load panier from cache
  Future<void> _loadPanierFromCache() async {
    panier = await _panierCacheService.loadPanier();
    setState(() {});
  }

  // Add item to panier
  void addToPanier(OfferModel offer) async {
    setState(() {
      panier.add(offer);
    });
    await _panierCacheService
        .savePanier(panier); // Save updated panier to cache
  }

  // Remove item from panier
  void removeFromPanier(OfferModel offer) async {
    setState(() {
      panier.remove(offer);
    });
    await _panierCacheService
        .savePanier(panier); // Save updated panier to cache
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
            child: GestureDetector(
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpg"),
                radius: 30,
              ),
              onTap: () async {},
            ),
          ),
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
          Tab(icon: Icon(Icons.shopping_cart)),
          Tab(icon: Icon(Icons.person)),
        ],
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        indicatorWeight: 1,
        labelColor: AppColor.primary,
        unselectedLabelColor: AppColor.primary,
        indicatorColor: AppColor.primary,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Home(user: widget.user),
          PanierScreen(),
          Profile(user: widget.user),
        ],
      ),
    );
  }
}
