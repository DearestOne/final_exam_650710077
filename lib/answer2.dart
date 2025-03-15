import 'package:flutter/material.dart';

class Answer2 extends StatefulWidget {
  const Answer2({super.key});

  @override
  State<Answer2> createState() => _Answer2State();
}

class _Answer2State extends State<Answer2> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _weightController = TextEditingController();
  String? _selectedItem;
  bool _isPackaging = false;
  bool _isInsurance = false;
  String? _speedOption = 'ปกติ';

  double _price = 0.0;

  void calculatePrice() {
    double price = 0.0;
    double weight = double.parse(_weightController.text);
    if (_selectedItem == 'ในเมือง') {
      price = 10 * weight;
    } else if (_selectedItem == 'ต่างจังหวัด') {
      price = 15 * weight;
    } else if (_selectedItem == 'ต่างประเทศ') {
      price = 50 * weight;
    }
    if (_isPackaging) {
      price += 20;
    }
    if (_isInsurance) {
      price += 50;
    }
    if (_speedOption == 'ปกติ') {
      price += 0;
    } else if (_speedOption == 'ด่วน') {
      price += 30;
    } else if (_speedOption == 'ด่วนพิเศษ') {
      price += 50;
    }
    setState(() {
      _price = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('คำนวนค่าจัดส่ง'),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("น้ำหนักสินค้า (กก.):"),
                    TextFormField(
                      controller: _weightController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'กรุณากรอกน้ำหนักสินค้า!';
                        } else if (double.tryParse(value) == null) {
                          return 'กรุณากรอกตัวเลขเท่านั้น!';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    const Text("เลือกระยะทาง:"),
                    SizedBox(
                      width: 150,
                      child: DropdownButtonFormField<String>(
                        value: _selectedItem,
                        items: ['ในเมือง', 'ต่างจังหวัด', 'ต่างประเทศ']
                            .map((item) => DropdownMenuItem(
                                value: item, child: Text(item)))
                            .toList(),
                        onChanged: (value) {
                          _selectedItem = value;
                        },
                        validator: (value) =>
                            value == null ? 'กรุณาเลือกตัวเลือก!' : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text("บริการเสริม:"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("แพ็กกิ้งพิเศษ (+20 บาท)",
                            style: TextStyle(fontSize: 18)),
                        Checkbox(
                            value: _isPackaging,
                            onChanged: (value) {
                              setState(() {
                                _isPackaging = value!;
                              });
                            }),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("ประกันพัศดุ (+50 บาท)",
                            style: TextStyle(fontSize: 18)),
                        Checkbox(
                            value: _isInsurance,
                            onChanged: (value) {
                              setState(() {
                                _isInsurance = value!;
                              });
                            }),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text("เลือกความเร่งด่วน:"),
                    RadioListTile(
                      title: const Text('ปกติ'),
                      value: 'ปกติ',
                      groupValue: _speedOption,
                      onChanged: (value) {
                        setState(() {
                          _speedOption = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('ด่วน'),
                      value: 'ด่วน',
                      groupValue: _speedOption,
                      onChanged: (value) {
                        setState(() {
                          _speedOption = value.toString();
                        });
                      },
                    ),
                    RadioListTile(
                      title: const Text('ด่วนพิเศษ'),
                      value: 'ด่วนพิเศษ',
                      groupValue: _speedOption,
                      onChanged: (value) {
                        setState(() {
                          _speedOption = value.toString();
                        });
                      },
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            calculatePrice();
                          }
                        },
                        child: const Text('คำนวนราคา'),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: double.infinity,
                      color: Colors.blue,
                      child: Text('ค่าจัดส่งทั้งหมด: $_price บาท',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    )
                  ],
                ))));
  }
}
