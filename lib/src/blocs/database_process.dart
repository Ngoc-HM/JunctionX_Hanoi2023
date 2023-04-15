import 'package:fintechdemo/src/blocs/user_information.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DatabaseProcess {
  DatabaseProcess();
  // Kiểm tra user có đăng nhập đúng không
  Future<bool> checkUser(String username, String password) async {
    bool res;
    try {
      res = false;
      DatabaseEvent event = await FirebaseDatabase.instance.ref().child('user').once();
      DataSnapshot dataSnapshot = event.snapshot;
      Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;

      values.forEach((key, value) {
        print("${value['name'].toString()} == ${username} and ${value['password'].toString()} == ${password}");
        if (value['name'] == username && value['password'] == password) {
          res = true;
        }
      });
      print(res);
      return res;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
  // check login information valid or not
  // Future<String> signIn(String email, String password) async {
  //   try {
  //     DatabaseEvent event = await FirebaseDatabase.instance.ref().child('user').once();
  //     DataSnapshot dataSnapshot = event.snapshot;
  //     UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
  //         email: email,
  //         password: password
  //     );
  //     return userCredential.user!.uid;
  //     // Đăng nhập thành công, userCredential.user sẽ chứa thông tin người dùng đã đăng nhập
  //   } on FirebaseAuthException catch (e) {
  //     // Xử lý lỗi nếu có
  //    /* showDialog(
  //         context: context,
  //         builder: (context) {
  //           return AlertDialog(
  //             title: Text("Lỗi"),
  //             content: Text(e.message!),
  //             actions: [
  //               TextButton(
  //                 child: Text("OK"),
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //               )
  //             ],
  //           );
  //         }
  //     );*/
  //     return "";
  //   }
  // }
  // //Lấy id của user


  // Truy vấn tên child node trong Realtime Database dựa trên 2 thuộc tính
  Future<Map<dynamic, Map<dynamic, dynamic>> > getUserInfo(String attribute1, String value1) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    RemainUser curr = RemainUser("");
    bool isFound = false;

    try {
      // Sử dụng phương thức orderByChild và equalTo để lọc các child node có giá trị trường dữ liệu của 2 thuộc tính trùng khớp với tham số được cung cấp
      Query query = databaseReference.child('user')
          .orderByChild(attribute1).equalTo(value1);
      DatabaseEvent event = await query.once();
      DataSnapshot dataSnapshot = await event.snapshot;
      Map<dynamic, dynamic> list = dataSnapshot.value as Map<dynamic, dynamic>;
      print(list.toString());
      Map<dynamic, Map<dynamic, dynamic>> list2 = {};
      list.forEach((key, value) {list2[key] = value as Map<dynamic, dynamic>;});
      return list2;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      // if (list != null) {
      //   isFound = true;
      // }
      // if (isFound == true) {
      //   print("Boo");
      //   curr.USER_ID = list.keys.first.toString();
      //   curr.user.accountName = list[curr.USER_ID]['name'].toString();
      //   curr.user.name = list[curr.USER_ID]['HoTen'].toString();
      //   curr.user.money = list[curr.USER_ID]['money'];
      // } else {
      //   print('Không tìm thấy dữ liệu với $attribute1: $value1');
      // }
      // return Future.value(curr);
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
      return {};
    }

  }

  Future<Map<dynamic, Map<dynamic, dynamic>> > getAllUserInfo() async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    RemainUser curr = RemainUser("");
    bool isFound = false;

    try {
      // Sử dụng phương thức orderByChild và equalTo để lọc các child node có giá trị trường dữ liệu của 2 thuộc tính trùng khớp với tham số được cung cấp
      Query query = databaseReference.child('user');
      DatabaseEvent event = await query.once();
      DataSnapshot dataSnapshot = await event.snapshot;
      Map<dynamic, dynamic> list = dataSnapshot.value as Map<dynamic, dynamic>;
      print(list.toString());
      Map<dynamic, Map<dynamic, dynamic>> list2 = {};
      list.forEach((key, value) {list2[key] = value as Map<dynamic, dynamic>;});
      return list2;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      // if (list != null) {
      //   isFound = true;
      // }
      // if (isFound == true) {
      //   print("Boo");
      //   curr.USER_ID = list.keys.first.toString();
      //   curr.user.accountName = list[curr.USER_ID]['name'].toString();
      //   curr.user.name = list[curr.USER_ID]['HoTen'].toString();
      //   curr.user.money = list[curr.USER_ID]['money'];
      // } else {
      //   print('Không tìm thấy dữ liệu với $attribute1: $value1');
      // }
      // return Future.value(curr);
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
      return {};
    }

  }

  // Truy vấn tên child node trong Realtime Database dựa trên 1 thuộc tính
  Future<String> getChildNameByAttribute(String attribute, String value) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    String childName = '';

    try {
      // Sử dụng phương thức orderByChild và equalTo để lọc các child node có giá trị trường dữ liệu của thuộc tính trùng khớp với tham số được cung cấp
      Query query = databaseReference.child('your_parent_node_name')
          .orderByChild(attribute).equalTo(value);
      DatabaseEvent event = await query.once();
      DataSnapshot dataSnapshot = await event.snapshot;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      Map<String, Object> list = dataSnapshot.value as Map<String, Object>;
      if (dataSnapshot.value != null) {
        // Lặp qua tất cả các child node tìm được (chỉ lấy child đầu tiên trong danh sách)
        list.forEach((nodeId, nodeData) {
          childName = nodeId;
          return; // Để thoát khỏi vòng lặp sau khi tìm thấy child đầu tiên
        });
      } else {
        print('Không tìm thấy dữ liệu với $attribute: $value');
      }
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
    }

    return childName;
  }
  // Rút giá trị của một hàng trong Realtime Database
  Future<Map<String,String?> > getDataFromDatabase(String nodeId) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    Map<String,String?> data = {"name": "", "HoTen": "", "money": "0"};
    try {
      DatabaseEvent event = await databaseReference.child('user').child(nodeId).once();
      DataSnapshot dataSnapshot = event.snapshot;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      Map<dynamic, dynamic> list = dataSnapshot.value as Map<dynamic, dynamic>;
      if (dataSnapshot.value != null) {
        // Lấy giá trị của dữ liệu từ DataSnapshot
        for (var key in data.keys) {
          data[key] = list[key].toString();
        }
        return data;
      } else {
        print('Không tìm thấy dữ liệu với nodeId: $nodeId');
        return data;
      }
    } catch (e) {
      print('Lỗi khi rút giá trị dữ liệu: $e');
      return data;
    }
  }

// Cập nhật dữ liệu của một cột trong Realtime Database
  Future<void> updateDataInDatabase(String childNode, String columnName, String columnValue) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      // Sử dụng phương thức orderByChild và equalTo để lọc các child node có giá trị trường dữ liệu trùng khớp với tham số được cung cấp
      Query query = databaseReference.child(childNode).orderByChild(columnName).equalTo(columnValue);
      DatabaseEvent event = await query.once();
      DataSnapshot dataSnapshot = await event.snapshot;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      Map<String, Object> list = dataSnapshot.value as Map<String, Object>;
      if (dataSnapshot.value != null) {
        // Lặp qua tất cả các child node tìm được
        list.forEach((nodeId, nodeData) {
          // Cập nhật dữ liệu cho child node có nodeId tương ứng
          databaseReference.child(childNode).child(nodeId).update({columnName: columnValue});
        });
      } else {
        print('Không tìm thấy dữ liệu với $columnName: $columnValue');
      }
    } catch (e) {
      print('Lỗi khi cập nhật dữ liệu: $e');
    }
  }

  // Kiểm tra receiver Name có tồn tại hay không
  Future<bool> checkReceiverName(String receiverName) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    try {
      DatabaseEvent event = await databaseReference.child('user').orderByChild('name').equalTo(receiverName).once();
      DataSnapshot dataSnapshot = event.snapshot;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      if (dataSnapshot.value != null) {
        return true;
      } else {
        print('Không tìm thấy dữ liệu với receiverName: $receiverName');
        return false;
      }
    } catch (e) {
      print('Lỗi khi rút giá trị dữ liệu: $e');
      return false;
    }
  }

  // Thêm dòng mới vào child tương ứng trong Realtime Database
  Future<void> addNewRowToDatabase(String childNode, Map<String, dynamic> data) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();

    try {
      // Thêm dữ liệu mới vào child node
      databaseReference.child(childNode).push().set(data);
    } catch (e) {
      print('Lỗi khi thêm dữ liệu: $e');
    }
  }

  //Trả về list 100 dòng thỏa mãn 1 value bằng 1 trong 2 giá trị cột nào đó


  //Trả về list 100 dòng thỏa mãn bằng giá trị cột nào đó được sắp xếp theo thứ tự giảm dần
  Future<List<Map<String, dynamic>>> getTop100Rows(String childNode, String columnName, String columnValue, String columnName2, String columnValue2, String cmp) async {
    DatabaseReference databaseReference = FirebaseDatabase.instance.ref();
    List<Map<String, dynamic>> data = [];
    try {
      // Sử dụng phương thức orderByChild và equalTo để lọc các child node có giá trị trường dữ liệu trùng khớp với tham số được cung cấp
      Query query1 = databaseReference.child(childNode).orderByChild(columnName).equalTo(columnValue).orderByChild(cmp).limitToLast(100);
      Query query2 = databaseReference.child(childNode).orderByChild(columnName2).equalTo(columnValue2).orderByChild(cmp).limitToLast(100);
      //Ghép 2 query lại và sắp xếp
      DatabaseEvent event1 = await query1.once();
      DatabaseEvent event2 = await query2.once();
      DataSnapshot dataSnapshot1 = await event1.snapshot;
      DataSnapshot dataSnapshot2 = await event2.snapshot;
      // Kiểm tra xem dữ liệu có tồn tại hay không
      Map<String, Object> list1 = dataSnapshot1.value as Map<String, Object>;
      Map<String, Object> list2 = dataSnapshot2.value as Map<String, Object>;
      if (dataSnapshot1.value != null && dataSnapshot2.value != null) {
        // Lặp qua tất cả các child node tìm được
        int i = 0, j =0;
        while(i < list1.length && j < list2.length){
          Map<String, dynamic> temp1 = list1.values.elementAt(i) as Map<String, dynamic>;
          Map<String, dynamic> temp2 = list2.values.elementAt(j) as Map<String, dynamic>;
          if(temp1[cmp] > temp2[cmp]){
            data.add(temp1);
            i++;
          }
          else{
            data.add(temp2);
            j++;
          }
        }
        return data;
      } else {
        print('Không tìm thấy dữ liệu với $columnName: $columnName');
      }
    } catch (e) {
      print('Lỗi khi truy vấn dữ liệu: $e');
    }

    return data;
  }
}