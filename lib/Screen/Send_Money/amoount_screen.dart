import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_wallet/Global_Widgets/custom_app_bar.dart';
import 'package:e_wallet/Global_Widgets/custom_button.dart';
import 'package:e_wallet/Global_Widgets/custom_field.dart';
import 'package:e_wallet/Screen/Send_Money/success_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AmoountScreen extends StatelessWidget {
  final Map<String, dynamic> reciverDetails;
  final Map<String, dynamic> senderDetails;

  const AmoountScreen({
    super.key,
    required this.reciverDetails,
    required this.senderDetails,
  });


   // Transaction History
    transactionHistory(amount) {
      FirebaseFirestore.instance.collection("history").add({
        "sender": senderDetails["full_name"],
        "reciver": reciverDetails["full_name"],
        "amount": amount,
        "time": DateTime.now(),
        "type": "send",
        "sender_email": senderDetails["email"],
        "reciver_email": reciverDetails["email"],
      });
    }

  @override
  Widget build(BuildContext context) {
    final amountController = TextEditingController();

    // Transaction
    transferMoney() async {
      // Sender balance -
      // reciver balance +

      final amount = int.parse(amountController.text);

      // sender DB
      await FirebaseFirestore.instance
          .collection("users")
          .doc(senderDetails["email"])
          .update({"balance": senderDetails["balance"] -= amount});

      // receber DB
      await FirebaseFirestore.instance
          .collection("users")
          .doc(reciverDetails["email"])
          .update({"balance": reciverDetails["balance"] += amount});
      
      // Transaction History add
      transactionHistory(amount);

      Get.offAll(
        () => SuccessScreen(
          amount: amount.toString(),
          email: reciverDetails["email"],
        ),
      );
    }

   

    return Scaffold(
      appBar: customAppBar(title: "Send Money"),

      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // Reciver Details
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    backgroundColor: Colors.green.withOpacity(.2),
                  ),
                  title: Text(
                    "To:",
                    style: TextStyle(color: Colors.black.withOpacity(.5)),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        reciverDetails["full_name"],
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black.withOpacity(.8),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        reciverDetails["email"],
                        style: TextStyle(color: Colors.black.withOpacity(.5)),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Amount Filed
                CustomField(
                  title: "Enter Amount",
                  preffixIcon: Icons.attach_money_outlined,
                  keyboardType: TextInputType.phone,
                  controller: amountController,
                ),

                SizedBox(height: 30),

                Text(
                  "Available Balance \$${senderDetails["balance"]}",
                  style: TextStyle(color: Colors.black.withOpacity(.5)),
                ),
              ],
            ),

            Column(
              children: [
                CustomButton(
                  title: "Send",
                  onTap: () {
                    // Get.offAll( () => SuccessScreen());

                    if (amountController.text.trim().isEmpty) {
                      // Show error or default value
                      print("Amount is empty");
                      Get.snackbar("Amount is emty", "Please enter amount");
                    } else {
                      try {
                        final int amount = int.parse(
                          amountController.text.trim(),
                        );

                        final int availableBalance = senderDetails["balance"];

                        if (amount > availableBalance) {
                          Get.snackbar(
                            "not availabe balance",
                            "your balance is ${availableBalance.toString()}",
                          );
                        } else {
                          transferMoney();
                        }
                      } catch (e) {
                        Get.snackbar("Invalid number format", "$e");
                      }
                    }
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
