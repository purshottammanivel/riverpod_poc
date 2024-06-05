import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc/models/customer_details.dart';
import 'package:riverpod_poc/services/network_service.dart';
import 'package:riverpod_poc/repositories/customer_repository.dart';
import 'package:riverpod_poc/use_cases/fetch_customer_details_use_case.dart';

// Base URL of your API
const String baseUrl = 'https://keystone1.intelli.uno';

// Provider for the NetworkService
final networkServiceProvider = Provider<NetworkService>((ref) {
  return NetworkService(baseUrl);
});

// Provider for the CustomerRepository
final customerRepositoryProvider = Provider<CustomerRepository>((ref) {
  final networkService = ref.watch(networkServiceProvider);
  return CustomerRepository(networkService);
});

// Provider for the FetchCustomerDetailsUseCase
final fetchCustomerDetailsUseCaseProvider = Provider<FetchCustomerDetailsUseCase>((ref) {
  final repository = ref.watch(customerRepositoryProvider);
  return FetchCustomerDetailsUseCase(repository);
});

// Provider for fetching customer details
final customerDetailsProvider = FutureProvider<List<CustomerDetails>>((ref) {
  final useCase = ref.watch(fetchCustomerDetailsUseCaseProvider);
  return useCase.execute();
});
