import 'package:fitness_tracker/main.dart';
import 'package:flutter/material.dart';

class DailyActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavBar()),
            ); // This pops the current route off the navigation stack
          },
        ),
        title: Text('Daily Activity'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60.0), // Add bottom padding here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildTodayActivities(),
              SizedBox(height: 10),
              _buildDateSelection(),
              SizedBox(height: 20),
              _buildYouveBurned(),
              SizedBox(height: 10),
              _buildDistance(),
              SizedBox(height: 20),
              _buildActivities(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelection() {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildDateItem('Fri', '28'),
          _buildDateItem('Sat', '29'),
          _buildDateItem('Sun', '30'),
          _buildDateItem('Mon', '01', isSelected: true),
          _buildDateItem('Tue', '02'),
          _buildDateItem('Wed', '03'),
          _buildDateItem('Thu', '04'),
        ],
      ),
    );
  }

  Widget _buildDateItem(String day, String date, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        width: 45,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              date,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTodayActivities() {
    return Text(
      'Today your activities',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );
  }

  Widget _buildYouveBurned() {
    return Container(
      padding: EdgeInsets.all(16),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // "You've burned" Text
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "You've burned",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Row(
                children: [
                  Icon(Icons.local_fire_department, color: Colors.red),
                  SizedBox(width: 4),
                  Text(
                    '1,116.5 cal',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),

          // Burned Activity List
          _buildBurnedActivity(
              'Jogging', 22, Colors.orange, Icons.directions_run),
          _buildBurnedActivity(
              'Cycling', 50, Colors.blue, Icons.directions_bike),
          _buildBurnedActivity('Yoga', 13, Colors.red, Icons.self_improvement),
          _buildBurnedActivity('Others', 15, Colors.black, Icons.more_horiz),
        ],
      ),
    );
  }

  Widget _buildBurnedActivity(String title, int percentage, Color color,
      IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: LinearProgressIndicator(
                value: percentage / 100,
                color: color,
                backgroundColor: color.withOpacity(0.1),
              ),
            ),
          ),
          Text(
            '$percentage%',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        SizedBox(height: 10),
        _buildActivityItem(
            'Today, 08:10 AM', 'Jogging', '2.32/5.00 miles', '238.2 cal'),
        _buildActivityItem(
            'Today, 08:10 AM', 'Cycling', '10.00/10.00 miles', '563.4 cal'),
        _buildActivityItem('Today, 06:00 AM', 'Yoga', '30/30 min', '151.0 cal'),
      ],
    );
  }

  Widget _buildActivityItem(String time, String activity, String progress,
      String calories) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 4,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(Icons.directions_run, size: 40),
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                time,
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                activity,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(progress),
              Text(
                calories,
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildDistance() {
    return // Distance, Steps, Time Summary
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildSummaryCards(),

          ],
        ),
      );
  }

  Widget _buildSummaryCards() {
    return Column(
      children: [
        // Full Width Distance Card
        Card(

          margin: EdgeInsets.symmetric(horizontal: 0, vertical:5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.location_on, color: Colors.grey, size: 30),
                SizedBox(width: 50),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Distance',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      '14.8 mi',
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
        ),

        // Row with Two Smaller Cards (Steps and Time)
        Row(
          children: [
            // Steps Card
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Column(
                    children: [
                      Icon(Icons.directions_walk, color: Colors.green, size: 20),
                      SizedBox(height: 1),
                      Text(
                        'Steps',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        '19,124',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

              ),
            ),

            // Time Card
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Icon(Icons.access_time, color: Colors.blue, size: 20),
                      SizedBox(height: 1),
                      Text(
                        'Time',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                      Text(
                        '2h 14m',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

}
