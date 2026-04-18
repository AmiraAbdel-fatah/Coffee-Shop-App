import 'package:coffe_shop/screens/delivery_screen.dart';
import 'package:coffe_shop/utils/AppColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderScreen extends StatefulWidget {
  final Map<String, dynamic> item;

  const OrderScreen({super.key, required this.item});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  int _orderTypeIndex = 0; // 0 for Deliver, 1 for Pick Up
  int _quantity = 1;

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
          "Order",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              // Deliver / Pick Up Toggle
              Container(
                height: 48.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2F2F2),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _orderTypeIndex = 0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _orderTypeIndex == 0
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Deliver",
                            style: TextStyle(
                              color: _orderTypeIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _orderTypeIndex = 1),
                        child: Container(
                          decoration: BoxDecoration(
                            color: _orderTypeIndex == 1
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Pick Up",
                            style: TextStyle(
                              color: _orderTypeIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Delivery Address
              Text(
                "Delivery Address",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              SizedBox(height: 16.h),
              Text(
                "Jl. Kpg Sutoyo",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              Text(
                "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xFF9B9B9B),
                ),
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  _buildAddressAction(
                    "assets/icons/Edit Square",
                    "Edit Address",
                  ),
                  SizedBox(width: 8.w),
                  _buildAddressAction("assets/icons/Document.png", "Add Note"),
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(color: Color(0xFFEAEAEA)),
              SizedBox(height: 20.h),
              // Item Info
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      item["image"],
                      height: 54.h,
                      width: 54.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item["name"],
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                        Text(
                          item["type"],
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: const Color(0xFF9B9B9B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (_quantity > 1) setState(() => _quantity--);
                        },
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.w),
                        child: Text(
                          _quantity.toString(),
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _quantity++),
                        child: Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: const Color(0xFFEAEAEA)),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 16.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              const Divider(thickness: 4, color: Color(0xFFF4F4F4)),
              SizedBox(height: 20.h),
              // Discount Banner
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFEAEAEA)),
                  borderRadius: BorderRadius.circular(14.r),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/icons/Discount.png",
                      height: 24.h,
                      width: 24.w,
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Text(
                        "1 Discount is Applies",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF2F2D2C),
                        ),
                      ),
                    ),
                    Image.asset(
                      "assets/icons/Arrow-Right.png",
                      height: 20.h,
                      width: 20.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              // Payment Summary
              Text(
                "Payment Summary",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF2F2D2C),
                ),
              ),
              SizedBox(height: 16.h),
              _buildPriceRow("Price", "\$ ${item["price"]}"),
              SizedBox(height: 8.h),
              _buildDeliveryFeeRow(),
              SizedBox(height: 20.h),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/icons/Bag.png",
                      height: 24.h,
                      width: 24.w,
                      color: AppColors.primary,
                    ),
                    SizedBox(width: 12.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Cash/Wallet",
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF2F2D2C),
                          ),
                        ),
                        Text(
                          "\$ 5.53",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Image.asset(
                  "assets/icons/ArrowDown.png",
                  height: 20.h,
                  width: 20.w,
                ),
              ],
            ),
            SizedBox(height: 16.h),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeliveryScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                minimumSize: Size(double.infinity, 62.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),
              child: Text(
                "Order",
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

  Widget _buildAddressAction(String iconPath, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFEAEAEA)),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        children: [
          Image.asset(
            iconPath,
            height: 16.h,
            width: 16.w,
            errorBuilder: (context, error, stackTrace) =>
                Icon(Icons.edit, size: 16.sp),
          ),
          SizedBox(width: 4.w),
          Text(
            label,
            style: TextStyle(fontSize: 12.sp, color: const Color(0xFF2F2D2C)),
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: const Color(0xFF2F2D2C)),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2F2D2C),
          ),
        ),
      ],
    );
  }

  Widget _buildDeliveryFeeRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Delivery Fee",
          style: TextStyle(fontSize: 14.sp, color: const Color(0xFF2F2D2C)),
        ),
        Row(
          children: [
            Text(
              "\$ 2.0",
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xFF2F2D2C),
                decoration: TextDecoration.lineThrough,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              "\$ 1.0",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF2F2D2C),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
