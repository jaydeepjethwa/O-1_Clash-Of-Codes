import 'package:coc/presentation/view/authentication/login_screen.dart';
import 'package:coc/presentation/view/authentication/otp_screen.dart';
import 'package:coc/presentation/view/authentication/register_screen.dart';
import 'package:coc/presentation/view/bottom_navigation/bottom_navigation_scrren.dart';
import 'package:coc/presentation/view/chat/chat_screen.dart';
import 'package:coc/presentation/view/connect/hotel_screen.dart';
import 'package:coc/presentation/view/event_meet/event_connect_screen.dart';
import 'package:coc/presentation/view/prefrences/prefrences1.dart';
import 'package:coc/presentation/view/prefrences/prefrences2.dart';
import 'package:coc/presentation/view/profile/booking_history.dart';
import 'package:coc/presentation/view/profile/profile.dart';
import 'package:coc/presentation/view/profile/rewards.dart';
import 'package:get/get.dart';

List<GetPage> routesList = [
  GetPage(
    name: "/login",
    page: () => const LoginScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/otp",
    page: () => const OTPScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/register",
    page: () => const RegisterScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/preference1",
    page: () => const PreferenceScreen1(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/preference2",
    page: () => const PreferenceScreen2(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/bottomNavBar",
    page: () => const BottomNavigationScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/chat",
    page: () => const ChatScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/bookingHistory",
    page: () => BookingHistory(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/reward",
    page: () => const Rewards(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/profile",
    page: () => const Profile(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/hotel",
    page: () => const HotelScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
  GetPage(
    name: "/eventConnectMeet",
    page: () => const EventConnectScreen(),
    transitionDuration: const Duration(milliseconds: 500),
    transition: Transition.rightToLeftWithFade,
  ),
];
