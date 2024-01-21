import 'package:flutter/material.dart';
import 'package:my_workshop/model/product.dart';
import 'package:my_workshop/provider/product_provider.dart';
import 'package:provider/provider.dart';

class InputFormView extends StatefulWidget {
  const InputFormView({super.key});

  @override
  State<InputFormView> createState() => _InputFormViewState();
}

class _InputFormViewState extends State<InputFormView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  Product? product;

  @override
  void initState() {
    product = context.read<ProductProvider>().productSelected;
    if (product != null) {
      nameController.text = product!.name ?? "";
      imageController.text = product!.imageUrl ?? "";
      descriptionController.text = product!.description ?? "";
      priceController.text = product!.price ?? "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              maxLines: null,
              minLines: 2,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Product Name",
                  labelText: "Product Name"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: imageController,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Product Image",
                  labelText: "Product Image"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: descriptionController,
              maxLines: null,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Product Description",
                  labelText: "Product Description"),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    borderSide: BorderSide(color: Colors.orange),
                  ),
                  hintText: "Product Price",
                  labelText: "Product Price"),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () {
                  context
                      .read<ProductProvider>()
                      .updateProducts(
                        id: product!.id!,
                        name: nameController.text,
                        imageUrl: imageController.text,
                        description: descriptionController.text,
                        price: priceController.text,
                      )
                      .then(
                        (value) => Navigator.pop(context),
                      );
                },
                child: Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
