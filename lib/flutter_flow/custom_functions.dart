import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String returnProfileGreeting(DateTime timestamp) {
  // return "morning" if it is morning, "afternoon" if afternoon and "night" if it is night
  var hour = timestamp.hour;
  if (hour >= 0 && hour < 12) {
    return "Good morning,";
  } else if (hour >= 12 && hour < 17) {
    return "Good afternoon,";
  } else {
    return "Goodnight,";
  }
}

dynamic convertAPIStringToJSON(String? response) {
  print('Raw API Response: $response');

  if (response != null && response.isNotEmpty) {
    try {
      return json.decode(response);
    } catch (e) {
      print("Error decoding JSON: $e");
      return {}; // Handle the error or return a default value
    }
  } else {
    print("Received empty or null response.");
    return {}; // Handle the empty response
  }
}

dynamic convertToJSON(String? prompt) {
  // take the prompt and return a JSON with form [{"role": "user", "content": prompt}]
  return json.decode(
      '[{"role": "system", "content": "You are a helpful assistant."},{"role": "user", "content": "$prompt"}]');
}
