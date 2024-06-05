import 'dart:convert';
import 'package:riverpod_poc/models/customer_details.dart';
import 'package:riverpod_poc/services/network_service.dart';

class CustomerRepository {
  final NetworkService networkService;

  CustomerRepository(this.networkService);

  Future<List<CustomerDetails>> fetchCustomerDetails() async {
    final response = await networkService.get('/upsdinf/jsp/MDMappingNew.html');
    final List<dynamic> data = json.decode(response.data)['CustomerDetails'];
    return data.map((json) => CustomerDetails.fromJson(json)).toList();
  }
}
