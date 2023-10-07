import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){}, icon: Icon(Icons.home)),
          centerTitle: true,
          title: Text('About us'),
          backgroundColor: Colors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                    height: MediaQuery.sizeOf(context).height *0.86,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage('asset/images/download.jpeg')),
                        Flexible(
                            child: Text(
                          'Founder & Director, Symbiosis Centre \nfor Management & Human Resource Development (SCMHRD) & \nSadhna Centre for Management & Leadership Development (SCMLD)',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        )),
                        Text(
                          'OUR VISION',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                              color: Colors.orange),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Consistently deliver ingenious, comprehensive, efficient, cost-effective business solutions through IT for the global market by creating a professionally stimulating and happy environment for our team where professionals thrive alongside the growth of our company.',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image(
                                image: AssetImage(
                                    'asset/images/Rectangle 10217.png')),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateColor.resolveWith(
                                            (states) => Colors.orange)),
                                onPressed: () {},
                                child: Text('See More'))
                          ],
                        )
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
