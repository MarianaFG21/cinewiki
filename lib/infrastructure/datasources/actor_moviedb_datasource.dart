import 'package:cinewiki/config/constants/environment.dart';
import 'package:cinewiki/domain/datasources/actors_datasources.dart';
import 'package:cinewiki/domain/entities/actor.dart';
import 'package:cinewiki/infrastructure/mappers/actor_mapper.dart';
import 'package:dio/dio.dart';

import '../models/moviedb/credits_response.dart';

class ActorMoviedbDatasource extends ActorsDatasources {


  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.theMovieDbKey,
      'language': 'es-MX'
    }
  ));  

  @override
  Future<List<Actor>> getActorsByMovie( String movieId ) async{

    final response = await dio.get('/movie/$movieId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();


    return actors;
  }
}