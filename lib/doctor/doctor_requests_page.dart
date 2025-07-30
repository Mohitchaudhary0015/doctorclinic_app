import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'model/booking.dart';

class DoctorRequestsPage extends StatefulWidget {
  const DoctorRequestsPage({super.key});

  @override
  State<DoctorRequestsPage> createState() => _DoctorRequestsPageState();
}

class _DoctorRequestsPageState extends State<DoctorRequestsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _requestDatabase =
      FirebaseDatabase.instance.ref().child('Requests');
  List<Booking> _bookings = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchBookings();
  }

  Future<void> _fetchBookings() async {
    String? currentUserId = _auth.currentUser?.uid;

    if (currentUserId == null) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final DatabaseEvent event = await _requestDatabase
          .orderByChild('receiver')
          .equalTo(currentUserId)
          .once();

      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> bookingMap =
            event.snapshot.value as Map<dynamic, dynamic>;
        _bookings = bookingMap.entries.map((entry) {
          return Booking.fromMap(Map<String, dynamic>.from(entry.value));
        }).toList();
      }
    } catch (e) {
      print('Error fetching bookings: $e');
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _showStatusDialog(String requestId, String currentStatus) {
    List<String> statuses = ['Accepted', 'Rejected', 'Completed'];
    String selectedStatus = currentStatus;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text('Update Request Status'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Please select the status for this request.'),
                  SizedBox(height: 16.0),
                  Column(
                    children: statuses.map((status) {
                      return RadioListTile<String>(
                        title: Text(status),
                        value: status,
                        groupValue: selectedStatus,
                        onChanged: (value) {
                          setDialogState(() {
                            selectedStatus = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    await _updateRequestStatus(requestId, selectedStatus);
                    Navigator.pop(context);
                  },
                  child: Text('Update Status'),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Future<void> _updateRequestStatus(String requestId, String status) async {
    await _requestDatabase.child(requestId).update({'status': status});
    await _fetchBookings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Requests'),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _bookings.isEmpty
              ? Center(child: Text('No booking available'))
              : ListView.builder(
                  itemCount: _bookings.length,
                  itemBuilder: (context, index) {
                    final booking = _bookings[index];
                    return ListTile(
                      title: Text(booking.description),
                      subtitle: Text('Date: ${booking.date} Time: ${booking.time}'),
                      trailing: Text(booking.status),
                      onTap: () => _showStatusDialog(booking.id, booking.status),
                    );
                  },
                ),
    );
  }
}
