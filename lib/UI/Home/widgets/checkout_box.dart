import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CheckoutBox extends StatelessWidget {
  const CheckoutBox({
    super.key,
    this.totalPrice,
  });
  final int? totalPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.12,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Text(
                  'Total Price',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              Expanded(
                child: Text(
                  '$totalPrice Rs',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              )
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(170, 40),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Checkout',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ))
        ],
      ),
    );
  }
}
