import 'package:flutter/material.dart';
import 'package:grosnap/core/di/injection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grosnap/core/utils/color.dart';
import 'package:grosnap/features/account/screens/account_screen.dart';
import 'package:grosnap/features/bottom_nav/presentation/provider/cubit/bottom_nav_cubit.dart';
import 'package:grosnap/features/cart/screens/cart_screen.dart';
import 'package:grosnap/features/home/presentation/screen/home_screen.dart';
import 'package:grosnap/features/my_order/screens/my_order_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      HomeScreen(),
      CartScreen(),
      MyOrderScreen(),
      AccountScreen(),
    ];

    return BlocProvider(
      create: (context) => getIt<BottomNavCubit>(),
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, currentIndex) {
          return Scaffold(
            body: pages[currentIndex],

            bottomNavigationBar: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    offset: const Offset(0, -2),
                    blurRadius: 6,
                  ),
                ],
              ),

              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) => context.read<BottomNavCubit>().changeTab(index),
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/home_icon.png',
                      height: 25,
                      color: currentIndex == 0 ? green: Colors.grey,
                    ),
                    label: 'Home',
                  ),
                   BottomNavigationBarItem(
                    icon: Image.asset(
                      'assets/images/cart_icon.png',
                      height: 25,
                      color: currentIndex == 1 ? green: Colors.grey,
                    ),
                    label: 'cart',
                  ),
                   BottomNavigationBarItem(
                     icon: Image.asset(
                       'assets/images/my_order_icon.png',
                       height: 25,
                       color: currentIndex == 2 ? green: Colors.grey,
                     ),
                    label: 'My order',
                  ),
                   BottomNavigationBarItem(
                     icon: Image.asset(
                       'assets/images/accounts_icon.png',
                       height: 25,
                       color: currentIndex == 3 ? green: Colors.grey,
                     ),
                    label: 'account',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
