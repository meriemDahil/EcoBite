
// class Tabbar extends StatefulWidget {
//   const Tabbar({super.key});

//   @override
//   State<Tabbar> createState() => _TabbarState();
// }

// class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height, 
//       child: Column(
//         children: [
//           TabBar(
//             controller: _tabController,
//             tabs: const [
//               Tab(icon: Icon(Icons.home)),
//               Tab(icon: Icon(Icons.location_pin)),
//               Tab(icon: Icon(Icons.favorite)),
//               Tab(icon: Icon(Icons.person)),
//             ],
//             labelStyle: const TextStyle(fontWeight: FontWeight.bold),
//             labelColor: Colors.black,
//             unselectedLabelColor: Colors.grey,
//             indicatorColor: Colors.black,
//           ),
//           const SizedBox(height: 10,),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: const [
//               Home(),
//               Home(),
//               Home(),
//               Home(),

//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
