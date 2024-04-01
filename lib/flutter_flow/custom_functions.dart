import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

double updateTotal(List<TicketStruct> tickets) {
  double total = 0;
  for (var ticket in tickets) {
    total += (ticket.amount * ticket.totalItems);
  }
  return total;
}

bool isInCart(
  int productId,
  List<TicketStruct> cart,
) {
  for (var product in cart) {
    if (product.id == productId) {
      return true;
    }
  }

  return false;
}
