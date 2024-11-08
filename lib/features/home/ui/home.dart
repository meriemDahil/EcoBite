import 'package:eco_bite/core/app_color.dart';
import 'package:eco_bite/core/search.dart';
import 'package:eco_bite/features/home/ui/carousel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  final List<String> chips =["All","Bakery","fast food"];
  late List<bool> isSelectedList;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelectedList = List.generate(chips.length, (index) => false);
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: 
            CircleAvatar(backgroundImage: AssetImage("assets/profile.jpg"), radius: 30,),
          )
        ],
        centerTitle: true,
        title:const Column(
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Livrez à "),
                Icon( Icons.arrow_drop_down_outlined)
              ],
            ),
            Text("cité 1200 El biar, Alger",style: TextStyle(fontSize: 14,color: AppColor.primary),),
        ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10, top: 8),
          child: Image.asset("assets/logo.png"),
        ),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(8.0),
        child: ListView(children: [
          const Text('les produits disponibles\naujourd’hui ?',
            style: TextStyle(fontSize: 26,fontWeight: FontWeight.w900,color: Colors.black),
            ),
            const SizedBox(height: 5,),
            const SearchWidget(
              hintText:'Chercher des produits...'
            ),
            const SizedBox(height: 5,),
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: chips.asMap().entries.map((entry) {
                  int index = entry.key;
                  String chip = entry.value;
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: FilterChip(
                      label: Text(chip),
                      onSelected: (value) {
                        setState(() {
                          isSelectedList[index] = value;  
                        });
                      },
                      selected: isSelectedList[index],  
                      backgroundColor: Colors.white,
                      selectedColor: AppColor.primary,
                      showCheckmark: false,
                      elevation: 5,
                      pressElevation: 5,
                      labelStyle:isSelectedList[index]? const TextStyle(color: Colors.white):const TextStyle(color: Colors.black),
                      //shadowColor: AppColor.primary,
                    ),
                  );
                }).toList(),
              ),
            const SizedBox(height: 5,),
            GestureDetector(child: const Row(
              children: [
                Text("View more", 
                  style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400,color: AppColor.primary),
                  ),
                Icon(Icons.arrow_right_alt,color: AppColor.primary,)
              ],
            ),),
            CarouselSlide(),
           
            
        ],
        ),
      ),
      backgroundColor: Colors.white,
    );
    
  }
}