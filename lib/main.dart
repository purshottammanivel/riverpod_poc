import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_poc/providers/customer_providers.dart';
import 'package:riverpod_poc/models/customer_details.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Customer Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CustomerDetailsScreen(),
    );
  }
}

class CustomerDetailsScreen extends ConsumerWidget {
  const CustomerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerDetailsAsyncValue = ref.watch(customerDetailsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Details'),
      ),
      body: Center(
        child: customerDetailsAsyncValue.when(
          data: (customerDetails) => CustomerDetailsList(customerDetails),
          loading: () => const CircularProgressIndicator(),
          error: (error, stack) => Text('Error: $error'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.refresh(customerDetailsProvider);
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

class CustomerDetailsList extends StatelessWidget {
  final List<CustomerDetails> customerDetails;

  const CustomerDetailsList(this.customerDetails, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: customerDetails.length,
      itemBuilder: (context, index) {
        final customer = customerDetails[index];
        return ListTile(
          leading: Image.network(customer.custImageUrl),
          title: Text(customer.custName),
          subtitle: Text(customer.custUrl),
        );
      },
    );
  }
}
