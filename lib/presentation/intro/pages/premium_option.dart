import 'package:exe02_fe_mobile/common/widget/premium_card.dart';
import 'package:flutter/material.dart';
import 'package:exe02_fe_mobile/common/widget/button.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:exe02_fe_mobile/common/helpers/routes.dart';
import 'package:exe02_fe_mobile/presentation/intro/pages/payment_method.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DonationOption extends StatefulWidget {
  @override
  _DonationOptionState createState() => _DonationOptionState();
}

class _DonationOptionState extends State<DonationOption> {
  // Danh sách gói donate mặc định
  final List<Map<String, String>> donatePackages = [
    {'name': 'Ủng hộ', 'price': '10000'},
    {'name': 'Ủng hộ', 'price': '20000'},
    {'name': 'Ủng hộ', 'price': '50000'},
  ];

  final TextEditingController amountController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  // GlobalKey để validate form
  final _formKey = GlobalKey<FormState>();

  // Lưu trữ index của gói được chọn
  int? selectedIndex;

  // Nút tiếp theo chỉ được bật khi ô nhập số tiền không trống và dữ liệu hợp lệ
  bool get isNextEnabled {
    return amountController.text.trim().isNotEmpty;
  }

  void _selectDonationPackage(int index, String price) {
    setState(() {
      selectedIndex = index;
      amountController.text = price;
    });

    // Hiển thị Toast thông báo
    Fluttertoast.showToast(
      msg: "Bạn đã chọn ủng hộ $price vnd",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );

    // Cuộn đến ô input
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    amountController.dispose();
    descriptionController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text("Hỗ trợ cộng đồng"),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Theme.of(context).colorScheme.primary),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.only(bottom: 80),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image Section
                Container(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Image.asset(
                        AppImages.premiumBg1,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Image.asset(
                        AppImages.premiumBg,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Hỗ trợ cộng đồng',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Bạn có thể chọn gói ủng hộ mặc định hoặc nhập số tiền ủng hộ trực tiếp.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                // Hiển thị danh sách gói donate mặc định với trạng thái chọn theo index
                ...donatePackages.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, String> pkg = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: DonationCard(
                      title: pkg['name']!,
                      amount: pkg['price']!,
                      backgroundColor: Color(0xFF6BB7CD),
                      textColor: Color(0xFF6BB7CD),
                      onTap: () =>
                          _selectDonationPackage(index, pkg['price']!),
                      isSelected: selectedIndex == index,
                    ),
                  );
                }).toList(),
                SizedBox(height: 16),
                // Ô nhập số tiền donate với validate
                TextFormField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Nhập số tiền từ 2,500 vnd',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Vui lòng nhập số tiền ủng hộ';
                    }
                    double? number = double.tryParse(value);
                    if (number == null) {
                      return 'Vui lòng nhập lại số tiền';
                    }
                    if (number < 2500) {
                      return 'Số tiền phải từ 2,500 vnd trở lên';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (selectedIndex != null) {
                      setState(() {
                        selectedIndex = null;
                      });
                    }
                    setState(() {}); // Cập nhật giao diện nếu cần
                  },
                ),
                SizedBox(height: 16),
                // Ô nhập mô tả donate (không bắt buộc)
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Mô tả (tùy chọn)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                // Nút Tiếp theo
                Center(
                  child: Button(
                    text: 'Tiếp theo',
                    buttonSize: Size(double.infinity, 40),
                    backgroundColor: isNextEnabled
                        ? Color(0xFF047099)
                        : Color(0xFF6BB7CD),
                    onPressed: isNextEnabled
                        ? () async {
                      if (_formKey.currentState!.validate()) {
                        // Nếu dữ liệu hợp lệ, điều hướng sang trang PaymentMethods
                        await Routes.navigateToPage(
                          context,
                          PaymentMethods(
                            donationAmount: amountController.text,
                            donationDescription: descriptionController.text,
                          ),
                        );
                      }
                    }
                        : () async {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
