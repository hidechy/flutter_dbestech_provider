import 'package:flutter/services.dart' as the_bundle;

import '../models/sneaker.dart';

class Helper {
  // Male
  Future<List<Sneaker>> getMaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');

    final maleList = sneakersFromJson(data);

    return maleList;
  }

// Female
  Future<List<Sneaker>> getFemaleSneakers() async {
    final data = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');

    final femaleList = sneakersFromJson(data);

    return femaleList;
  }

// Kids
  Future<List<Sneaker>> getKidsSneakers() async {
    final data = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');

    final kidsList = sneakersFromJson(data);

    return kidsList;
  }

  // Single Male
  Future<Sneaker> getMaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString('assets/json/men_shoes.json');

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Male
  Future<Sneaker> getFemaleSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString('assets/json/women_shoes.json');

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }

  // Single Kids
  Future<Sneaker> getKidsSneakersById(String id) async {
    final data = await the_bundle.rootBundle.loadString('assets/json/kids_shoes.json');

    final maleList = sneakersFromJson(data);

    final sneaker = maleList.firstWhere((sneaker) => sneaker.id == id);

    return sneaker;
  }
}
