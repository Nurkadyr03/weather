import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: const IconButton(
            onPressed: null,
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            )),
        actions: const [
          IconButton(
              onPressed: null,
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              ))
        ],
      ),
      body: _buildBody(),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: [
        _headerImage(),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _weatherDescription(),
                const SizedBox(
                  height: 10.0,
                ),
                _temperature(),
                const Divider(),
                _temperatureForeCast(),
                const Divider(),
                _footerRatings(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Image _headerImage() {
  return const Image(
    fit: BoxFit.cover,
    image: NetworkImage(
        'https://www.bigcountryhomepage.com/wp-content/uploads/sites/56/2020/01/Weather-v2.jpg?w=640&h=360&crop=1'),
  );
}

Column _weatherDescription() {
  return const Column(
    children: [
      Text(
        'Tuesday - May 22',
        style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
          'Osh Thu 27th Jun Min 14C, Max 25C 6am Mostly Sunny, strong NW wind Noon Mostly Cloudy '),
    ],
  );
}

Row _temperature() {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.sunny, color: Colors.yellow,size: 40.0,),
      SizedBox(
        width: 16.0,
      ),
      Column(
        children: [
          Row(
            children: [
              Text(
                '15° Clear ',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Osh oblasty , Ozgon rayonu ',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
        ],
      )
    ],
  );
}

Wrap _temperatureForeCast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(
      8,
      (int index) {
        return Chip(
          label: Text(
            '${index + 20}°C',
            style: const TextStyle(fontSize: 15.0),
          ),
          avatar: Icon(
            Icons.wb_cloudy,
            color: Colors.blue.shade300,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: const BorderSide(color: Colors.grey),
          ),
          backgroundColor: Colors.grey.shade100,
        );
      },
    ),
  );
}

Row _footerRatings() {
  return Row(
    children: [
      const Text('Open weth openweathermap.org',
          style: TextStyle(fontSize: 15.0)),
      SizedBox(width: 15.0),
      Icon(Icons.star, size: 15, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15, color: Colors.yellow[600]),
      Icon(Icons.star, size: 15, color: Colors.yellow[600]),
      const Icon(Icons.star, size: 15, color: Colors.yellow),
      const Icon(Icons.star, size: 15, color: Colors.yellow),
    ],
  );
}
