import 'package:coffe_shop/CustomWidgets/coffee_item_card.dart';
import 'package:coffe_shop/screens/detail_screen.dart';
import 'package:coffe_shop/utils/AppColors.dart';
import 'package:coffe_shop/utils/AppStyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<String> _categories = [
    "All Coffee",
    "Machiato",
    "Latte",
    "Americano"
  ];

  // 1. List of Coffee items with their specific data
  final List<Map<String, dynamic>> _coffeeItems = [
    {
      "image": "assets/images/caffe-mocha.png",
      "name": "Caffe Mocha",
      "type": "Deep Foam",
      "price": "4.53",
      "rating": 4.8,
    },
    {
      "image": "assets/images/flate-white.png",
      "name": "Flat White",
      "type": "Espresso",
      "price": "3.53",
      "rating": 4.8,
    },
    {
      "image": "assets/images/CAPPUCCINO.png",
      "name": "Cappuccino",
      "type": "With Milk",
      "price": "4.12",
      "rating": 4.9,
    },
    {
      "image": "assets/images/CAFFÈ LATTE.png",
      "name": "Caffe Latte",
      "type": "Deep Foam",
      "price": "3.90",
      "rating": 4.7,
    },
    {
      "image": "assets/images/Macchiato.png",
      "name": "Macchiato",
      "type": "Sora Coffee",
      "price": "4.53",
      "rating": 4.8,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Stack(
        children: [
          Column(
            children: [
              _buildHeader(),
              SizedBox(height: 120.h),
              _buildCategories(),
              SizedBox(height: 16.h),
              Expanded(
                child: _buildCoffeeGrid(),
              ),
            ],
          ),
          _buildOverlappingPromo(),
          Align(
            alignment: Alignment.bottomCenter,
            child: _buildBottomNavBar(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.fromLTRB(30.w, 60.h, 30.w, 100.h),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF131313), Color(0xFF313131)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Location", style: AppStyles.regular14LightGrey),
          SizedBox(height: 4.h),
          Row(
            children: [
              Text("Bilzen, Tanjungbalai",
                  style: AppStyles.semiBold14White.copyWith(fontSize: 14.sp)),
              SizedBox(width: 4.w),
              Image.asset(
                  "assets/icons/Arrow_down.png", height: 14.h, width: 14.w),
            ],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12.w),
                      child: Image.asset(
                          "assets/icons/Search_Icon.png", height: 20.h,
                          width: 20.w),
                    ),
                    hintText: "Search coffee",
                    hintStyle: AppStyles.regular14LightGrey,
                    filled: true,
                    fillColor: const Color(0xFF313131),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Container(
                padding: EdgeInsets.all(12.w),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Image.asset(
                    "assets/icons/Filter.png", height: 24.h, width: 24.w),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverlappingPromo() {
    return Positioned(
      top: 220.h,
      left: 30.w,
      right: 30.w,
      child: Container(
        height: 145.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: const DecorationImage(
            image: AssetImage("assets/images/Banner.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFED5151),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Text("Promo",
                    style: AppStyles.semiBold14White.copyWith(fontSize: 12.sp)),
              ),
              SizedBox(height: 8.h),
              Text(
                "Buy one get\none FREE",
                style: AppStyles.semiBold32White.copyWith(
                  fontSize: 24.sp,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 38.h,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        scrollDirection: Axis.horizontal,
        itemCount: _categories.length,
        separatorBuilder: (context, index) => SizedBox(width: 8.w),
        itemBuilder: (context, index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () => setState(() => _selectedIndex = index),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Text(
                _categories[index],
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF2F4B4E),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14.sp,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCoffeeGrid() {
    return GridView.builder(
      // Padding ensures the last items clear the bottom navigation bar
      padding: EdgeInsets.fromLTRB(30.w, 0, 30.w, 100.h),
      physics: const BouncingScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 16.w,
        childAspectRatio: 0.68,
      ),
      itemCount: _coffeeItems.length,
      itemBuilder: (context, index) {
        final item = _coffeeItems[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(item: item),
              ),
            );
          },
          child: CoffeeItemCard(
            image: item["image"],
            name: item["name"],
            type: item["type"],
            price: item["price"],
            rating: item["rating"],
          ),
        );
      },
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      height: 70.h,
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _navItem(const AssetImage("assets/icons/Home.png"), true),
          _navItem(const AssetImage("assets/icons/Heart.png"), false),
          _navItem(const AssetImage("assets/icons/Bag.png"), false),
          _navItem(const AssetImage("assets/icons/Notification.png"), false),
        ],
      ),
    );
  }

  Widget _navItem(ImageProvider image, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: image,
          height: 24.h,
          width: 24.w,
          color: isActive ? AppColors.primary : const Color(0xFF8D8D8D),
        ),
        if (isActive) ...[
          SizedBox(height: 4.h),
          Container(
            width: 10.w,
            height: 5.h,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ],
      ],
    );
  }
}