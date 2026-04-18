import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:coffe_shop/screens/order_screen.dart';
import 'package:coffe_shop/utils/AppColors.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const DetailScreen({super.key, required this.item});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String selectedSize = 'M';

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/Arrow - Left .png",
            height: 24.h,
            width: 24.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Detail",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/icons/Heart.png",
              height: 24.h,
              width: 24.w,
            ),
            onPressed: () {
              // Handle favorite toggle
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  item["image"],
                  height: 226.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                item["name"],
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ice/Hot",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: const Color(0xFF9B9B9B),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 20.sp),
                          SizedBox(width: 4.w),
                          Text(
                            item["rating"].toString(),
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF2F2D2C),
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "(230)",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xFF9B9B9B),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      _buildIconContainer("assets/icons/delivery.png"),
                      SizedBox(width: 12.w),
                      _buildIconContainer("assets/icons/bean.png"),
                      SizedBox(width: 12.w),
                      _buildIconContainer("assets/icons/milk.png"),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(color: Color(0xFFEAEAEA)),
              SizedBox(height: 20.h),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              SizedBox(height: 12.h),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF9B9B9B),
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(
                      text:
                          "A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the fo.. ",
                    ),
                    TextSpan(
                      text: "Read More",
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                "Size",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              SizedBox(height: 12.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSizeButton('S'),
                  _buildSizeButton('M'),
                  _buildSizeButton('L'),
                ],
              ),
              SizedBox(height: 100.h), // Space for bottom bar
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Price",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xFF9B9B9B),
                  ),
                ),
                Text(
                  "\$ ${item["price"]}",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OrderScreen(item: item),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(217.w, 62.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                "Buy Now",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIconContainer(String iconPath) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Image.asset(
        iconPath,
        height: 24.h,
        width: 24.w,
        errorBuilder: (context, error, stackTrace) =>
            Icon(Icons.category, size: 24.sp, color: AppColors.primary),
      ),
    );
  }

  Widget _buildSizeButton(String size) {
    bool isSelected = selectedSize == size;
    return GestureDetector(
      onTap: () => setState(() => selectedSize = size),
      child: Container(
        width: 96.w,
        height: 43.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFF5EE) : Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected ? AppColors.primary : const Color(0xFFEAEAEA),
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            fontSize: 14.sp,
            color: isSelected ? AppColors.primary : const Color(0xFF2F2D2C),
          ),
        ),
      ),
    );
  }
}
