import 'package:cinewiki/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinewiki/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



// Este repositorio es inmutable
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMoviedbDatasource() );
});