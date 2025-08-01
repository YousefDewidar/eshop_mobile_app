import 'package:flutter/material.dart';
import 'package:rfaye3/features/checkout/data/models/address.dart';

class UserAddressCard extends StatelessWidget {
  const UserAddressCard({super.key, required this.address});
  final Address address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 10.0),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 250,
          minHeight: 100,
          minWidth: 180,
          maxHeight: 150,
        ),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.surface,
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 6),

            Text(address.fullAddress, overflow: TextOverflow.ellipsis),
            // if (address.notes.isNotEmpty)
            Text(address.notes, overflow: TextOverflow.ellipsis),

            const SizedBox(height: 6),
            Text(address.phoneNumber, overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
}
