import 'package:flutter/material.dart';
import 'package:mindglow/model.dart';

class UserDetails extends StatelessWidget {
  final User user;

  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(user.name!),
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _buildSectionTitle('Personal Information'),
              const SizedBox(height: 10),
              _buildInfoRow('Username', user.username!),
              _buildInfoRow('Email', user.email!),
              _buildInfoRow('Phone', user.phone!),
              _buildInfoRow('Website', user.website!),
              const SizedBox(height: 16),
              _buildSectionTitle('Address'),
              const SizedBox(height: 8),
              _buildInfoRow('Street', user.address!.street!),
              _buildInfoRow('Suite', user.address!.suite!),
              _buildInfoRow('City', user.address!.city!),
              _buildInfoRow('Zipcode', user.address!.zipcode!),
              _buildInfoRow('Geo',
                  '${user.address!.geo!.lat}, ${user.address!.geo!.lng}'),
              const SizedBox(height: 16),
              _buildSectionTitle('Company'),
              const SizedBox(height: 8),
              _buildInfoRow('Name', user.company!.name!),
              _buildInfoRow('BS', user.company!.bs!)
            ])));
  }

  Widget _buildSectionTitle(String title) {
    return Text(title,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black));
  }

  Widget _buildInfoRow(String label, String value) {
    return Card(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Text(label,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700])),
              Text(value,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700]))
            ])));
  }
}
