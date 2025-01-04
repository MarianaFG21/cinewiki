import 'package:cinewiki/domain/datasources/actors_datasources.dart';
import 'package:cinewiki/domain/entities/actor.dart';
import '../../domain/repositories/actors_repository.dart';



class ActorRepositoryImpl extends ActorsRepository {

  final ActorsDatasources datasource;
  
  ActorRepositoryImpl(this.datasource); 
  
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return datasource.getActorsByMovie(movieId);
  }

}