import 'package:flutter/material.dart';

import 'main.dart';
class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class ProfileScreen extends StatelessWidget {
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
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 60.0), // Add bottom padding here
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProfileSection(),
            SizedBox(height: 20),
            _buildProgressSection(),
            SizedBox(height: 20),
            _buildGoalSettingSection(),
            SizedBox(height: 20),
            _buildSleepCycleSection(),
            SizedBox(height: 20),
            _buildOthersSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Row(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage('images/shamim.PNG'), // Replace with actual image
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Md Shamim", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text("Joined 15-06-2024"),
            SizedBox(height: 8),
            Text("180 m • 82 kg • 30 yrs"),
          ],
        ),
        Spacer(),
        ElevatedButton(
          onPressed: () {},
          child: Text("Edit"),
        )
      ],
    );
  }

  Widget _buildProgressSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text("This Week's progress", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        // Add the progress chart or graph here (use any chart package like fl_chart)
        Placeholder(fallbackHeight: 200),
        SizedBox(height: 10),
        Text("You've completed 3 out of 7 daily goals."),
      ],
    );
  }

  Widget _buildGoalSettingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your Goal setting", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.local_fire_department, color: Colors.red),
                SizedBox(width: 10),
                Text("Calories to burn"),
              ],
            ),
            Text("2,000 cal"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.directions_walk, color: Colors.green),
                SizedBox(width: 10),
                Text("Steps to cover"),
              ],
            ),
            Text("20,000 steps"),
          ],
        ),
      ],
    );
  }

  Widget _buildSleepCycleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Your sleep cycle", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.bedtime, color: Colors.purple),
                SizedBox(width: 10),
                Text("Bed time"),
              ],
            ),
            Text("10:00 PM"),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.wb_sunny, color: Colors.orange),
                SizedBox(width: 10),
                Text("Wake-up time"),
              ],
            ),
            Text("6:00 AM"),
          ],
        ),
      ],
    );
  }

  Widget _buildOthersSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Others", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text("My Account"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.notifications),
          title: Text("Notification"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.privacy_tip),
          title: Text("Privacy Policy"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Log out"),
          onTap: () {},
        ),
      ],
    );
  }
}
