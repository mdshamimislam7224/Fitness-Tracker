import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/shamim.PNG'), // Placeholder
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello! Md Shamim',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            Text(
              '02 July 2024',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Circular border
              border: Border.all(
                color: Colors.grey, // Border color
                width: 1, // Border width
              ),
            ),
            child:  IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {},
            ),
          ),

        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(

          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,  // Light background color
                    borderRadius: BorderRadius.circular(25), // Rounded border
                    border: Border.all(
                      color: Colors.grey, // Border color
                      width: 1, // Border width
                    ),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),

                SizedBox(height: 25),

                // Your Statistics Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Your Statistics',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'See all',
                      style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 16),

                // In-Progress
            Container(
              decoration: BoxDecoration(
                color: Colors.white,  // Light background color
                borderRadius: BorderRadius.circular(10), // Rounded border
                border: Border.all(
                  color: Colors.grey, // Border color
                  width: 1, // Border width
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row with "In-Progress", "56%", and Arrow Icon on the same line
                    Row(
                      children: [
                        Text(
                          'In-Progress',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 8), // A small space between the texts
                        Text(
                          '56%',
                          style: TextStyle(
                            fontSize: 20,  // Larger font size for percentage
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Spacer(), // Pushes the arrow icon to the right
                        Container(
                          padding: EdgeInsets.all(4), // Space inside the container
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            shape: BoxShape.circle, // Circular border
                            border: Border.all(
                              color: Colors.grey, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          child: Icon(
                            Icons.arrow_forward, // Using a different arrow icon for variety
                            size: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),  // Space between the row and the progress bar

                    // Progress bar on the next line
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: 0.56,
                        backgroundColor: Colors.grey.shade700,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red.shade300),
                        minHeight: 5,  // Height of the progress bar
                      ),
                    ),
                    SizedBox(height: 16),  // Space between progress bar and descriptive text
                    // Descriptive text on the next line
                    Row(
                      children: [
                        Text(
                          'You\'ve burned ',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],  // Slightly muted text color
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(4), // Space inside the container
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                          ),
                          child: Icon(
                            Icons.local_fire_department_sharp, // Using a different arrow icon for variety
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          '1,116.5',
                          style: TextStyle(
                            fontSize: 14,  // Larger font size for percentage
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 2),
                        Text(
                          'out of 2,000 cal.',
                          style: TextStyle(
                            fontSize:14,  // Larger font size for percentage
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            SizedBox(height: 30),
                // Steps, Heart Rate, Sleep Card
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start of the column
                        children: [
                          _buildStatCardWithProgress(
                            title: 'Steps',
                            value: '19,124',
                            progressValue: 0.8,  // Example progress value
                            progressColor: Colors.green,
                            icon: Icons.directions_walk,  // Steps icon
                            iconColor: Colors.green,  // Color for the steps icon
                          ),
                          SizedBox(height: 10), // Adjust spacing between cards
                          _buildStatCardWithProgress(
                            title: 'Sleep',
                            value: '7h 34m',
                            progressValue: 0.6,  // Example progress value
                            progressColor: Colors.purple,
                            icon: Icons.nights_stay,  // Sleep icon
                            iconColor: Colors.purple,  // Color for the sleep icon
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end, // Aligns content from top to bottom
                        crossAxisAlignment: CrossAxisAlignment.stretch,  // Stretches the content to take up full width
                        children: [
                          _buildHeartRateCard(
                            title: 'Heart rate',
                            value: '88 bpm',
                            iconColor: Colors.orange,  // Color for the heart icon
                          ),
                        ],
                      ),
                    ),

                  ],
                ),

                SizedBox(height: 20),

                // Daily Activities Section
                // Row for "Daily Activities" title and "See all" button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center, // Aligns both texts vertically
                  children: [
                    Text(
                      'Daily Activities',
                      style: TextStyle(
                        fontSize: 18, // Adjusted font size
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B2C47), // Dark color for title
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Add your "See all" button's functionality here
                      },
                      child: Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFFFF784E), // Orange color for "See all"
                          fontWeight: FontWeight.w600,
                          fontSize: 16, // Adjusted font size for "See all"
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16), // Spacing between title row and list of activities
                Container(
                  height: 150,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2, // Number of activity cards
                    separatorBuilder: (context, index) => SizedBox(width: 12), // Spacing between cards
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return _buildActivityCard('Jogging', '2.32/5.00 miles', '238.2 cal', Icons.directions_run);
                      } else {
                        return _buildActivityCard('Cycling', '10.00/10.00 miles', '563.4 cal', Icons.directions_bike);
                      }
                    },
                  ),
                ),
                SizedBox(height: 20),

                // Goals Section
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Goals',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'View All',
                          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    _buildGoalCard('ABS & Stretch', 'Saturday, April 14 | 08:00 AM', '30 Min/day'),
                    SizedBox(height: 8),
                    _buildGoalCard('Push Up', 'Sunday, April 15 | 08:00 AM', '50 Sets/day'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard(
      String activity, String distance, String calories, IconData icon) {
    return Container(
      width: 200, // Adjust the width according to your design
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top text for time and calories
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Today 8:10 AM',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
              Row(
                children: [
                  Icon(Icons.local_fire_department,
                      color: Colors.red, size: 16),
                  SizedBox(width: 2),
                  Text(
                    calories,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8), // Spacing between top text and activity details

          // Activity details (icon and distance)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Icon(icon, color: Colors.lightBlue, size: 30),
                SizedBox(width: 10),
                Text(
                  distance,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Spacer(), // Pushes the activity name to the bottom

          // Activity name at the bottom
          Center(
            child: Text(
              activity,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGoalCard(String title, String schedule, String target) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  schedule,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                target,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCardWithProgress({
    required String title,
    required String value,
    required double progressValue,
    required Color progressColor,
    required IconData icon,  // Icon for the card
    required Color iconColor, // Color for the icon
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),  // Increased padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 24),  // Adjusted icon size
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,  // Align text to the end
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.grey[300],  // Light grey for the background
                valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                minHeight: 4,  // Height of the progress bar
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeartRateCard({
    required String title,
    required String value,
    required Color iconColor, // Color for the icon
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),  // Increased padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.monitor_heart, color: iconColor, size: 24),  // Adjusted icon size
                SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey[700]),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,  // Align text to the end
              children: [
                Text(
                  value,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 16),  // Adjust spacing between text and graph
            Container(
              height: 50,  // Height for heart rate graph
              width: double.maxFinite,
              child: Image.asset(
                'images/hartgraphic.png',  // Path to the image in your assets folder
                fit: BoxFit.cover,  // Ensures the image covers the entire container
              ),
            ),
          ],
        ),
      ),
    );
  }
}
