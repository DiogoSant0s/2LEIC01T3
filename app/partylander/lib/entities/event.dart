import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:partylander/entities/host.dart';

class Event {
  String name;
  DateTime startDate;
  DateTime endDate;
  String location;
  bool monetization;
  String description;
  String website;
  CachedNetworkImage descriptivePicture = CachedNetworkImage(
      imageUrl: 'https://st.depositphotos.com/1002111/2556/i/950/depositphotos_25565783-stock-photo-young-party-people.jpg',
      placeholder: (context, url) => const CircularProgressIndicator(),
      ); 
  String type;
  Host host;


  Event(
  {
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.location,
    this.monetization = false,
    required this.description,
    descriptivePicture,
    this.website = '',
    required this.type,
    required this.host,
  });

  setWebsite(String site) {
    website = site;
  }

  setMonetization(bool isPaid) {
    monetization = isPaid;
  }
  setDescriptivePicture(String link) {
    descriptivePicture = CachedNetworkImage(imageUrl: link);
  }
}