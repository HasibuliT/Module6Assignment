import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); //Application
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const MaterialApp /// const not use for theme
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green),
      darkTheme: ThemeData(primarySwatch: Colors.grey),
      color: Colors.blue,
      debugShowCheckedModeBanner: false,
      home: HomeActvity(),
    );
  }
}



class HomeActvity extends StatelessWidget {
  const HomeActvity({super.key});

  MySnakbar(message,context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message))
    );

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Gallery"),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.cloud_download_rounded),
        backgroundColor: Colors.blue,
        onPressed: () {MySnakbar('Photos Uploaded Successfully!', context);},
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(child: Text('Welcome to My Photo Gallery',style: TextStyle(
                fontSize: 25),),
              alignment: Alignment.center,),

            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',


                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.purple),
                  ),
                ),
              ),
            ),



            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              spacing: 9,
              runSpacing: 9,
              children: [
                for (int k = 1; k <= 6; k++)
                  ElevatedButton(
                    onPressed: () {
                      MySnakbar(context, 'Clicked on photo $k!');
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                    ),
                    child: Stack(
                      children: [
                        Image.network(
                          'https://play-lh.googleusercontent.com/wIf3HtczQDjHzHuu7vezhqNs0zXAG85F7VmP7nhsTxO3OHegrVXlqIh_DWBYi86FTIGk',
                          fit: BoxFit.cover,
                          width: 110,
                          height: 110,
                        ),
                        Positioned(
                          bottom: 0,
                          left: 18,
                          right: 18,
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 9),
                            color: Colors.black.withOpacity(0.4),
                            child: Text(
                              'Caption',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),



            SizedBox(height: 20,),
            ListTile(
              onTap: (){
                print('Tapped');
              },
              title: Text('Sample Photo 1'),
              subtitle: Text('Category 1'),
              leading: Icon(Icons.photo,size: 30,),
              textColor: Colors.black,
            ),

            SizedBox(height: 10,),
            ListTile(
              onTap: (){
                print('Tapped');
              },
              title: Text('Sample Photo 2'),
              subtitle: Text('Category 2'),
              leading: Icon(Icons.photo,size: 30,),
              textColor: Colors.black,
            ),

            SizedBox(height: 10,),
            ListTile(
              onTap: (){
                print('Tapped');
              },
              title: Text('Sample Photo 3'),
              subtitle: Text('Category 3'),
              leading: Icon(Icons.photo,size: 30,),
              textColor: Colors.black,
            ),



          ],
        ),
      ),
    );
  }
}
