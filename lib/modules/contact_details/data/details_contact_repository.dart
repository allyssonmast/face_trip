import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:facetrip/core/error/login/failure.dart';
import 'package:facetrip/modules/contact_details/domain/repository/details_contact_repository.dart';
import 'package:facetrip/modules/trip/domain/entities/trip.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DetailsContactRepository)
class DetailsContactRepositoryImpl implements DetailsContactRepository {
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;

  DetailsContactRepositoryImpl(this._firestore, this._auth);
  @override
  Future<Either<Failure, bool>> updateContact(List<String> list) async {
    try {
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .update({'listContact': list});
      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Trip>>> getTrips() async {
    try {
      List<Trip> list = List.from(tripList.map((e) => Trip.fromJson(e)));
      return Right(list);
    } catch (e) {
      return Left(Failure.serverError());
    }
  }
}

List<Map<String, dynamic>> tripList = [
  {
    'id': '1',
    'place': 'Rio de Janeiro',
    'comment': 'Lugar incrível, recomendo muito!',
    'url':
        'https://media.istockphoto.com/id/608540602/pt/foto/aerial-panorama-of-botafogo-bay-rio-de-janeiro.jpg?s=612x612&w=0&k=20&c=-ABPKnNReviA_zMhTN3-m1_4RjSqBVaTtbHPI4kUBpc=',
  },
  {
    'id': '2',
    'place': 'Nova York',
    'comment': 'Cidade que nunca dorme, adorei a experiência!',
    'url':
        'https://descubraeua.com.br/wp-content/uploads/2020/06/manhattan-nova-york-1024x576.jpg',
  },
  {
    'id': '3',
    'place': 'Paris',
    'comment': 'Romance no ar, excelente para casais!',
    'url':
        'https://cdn.americachip.com/wp-content/uploads/2022/08/o-que-fazer-em-paris.png',
  },
  {
    'id': '4',
    'place': 'Tóquio',
    'comment': 'Cultura riquíssima, muito diferente do Brasil!',
    'url':
        'https://www.melhoresdestinos.com.br/wp-content/uploads/2019/02/passagens-aereas-tokyo-capa2019-01.jpg',
  },
];
