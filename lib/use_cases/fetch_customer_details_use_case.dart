import 'package:riverpod_poc/models/customer_details.dart';
import 'package:riverpod_poc/repositories/customer_repository.dart';

class FetchCustomerDetailsUseCase {
  final CustomerRepository repository;

  FetchCustomerDetailsUseCase(this.repository);

  Future<List<CustomerDetails>> execute() {
    return repository.fetchCustomerDetails();
  }
}
