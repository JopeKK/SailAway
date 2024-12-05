import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

const String pokeDBREF = 'FavoritePokeList';

abstract class Repo {}

class DataRepository implements Repo {}
