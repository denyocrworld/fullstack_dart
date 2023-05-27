import 'package:dart_frog/dart_frog.dart';
import '../../shared/util/db.dart';

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final method = request.method;
  if (method == HttpMethod.get) return getRequest(context);
  if (method == HttpMethod.post) return postRequest(context);
  return Response.json(body: {
    "message": "Invalid route",
  });
}

Future<Response> getRequest(RequestContext context) async {
  final products = await DB.select('products');
  return Response.json(
    body: {
      "count": products.length,
      "data": products,
    },
  );
}

Future<Response> postRequest(RequestContext context) async {
  final request = context.request;
  final data = await request.json();
  await DB.insert('products', data as Map<String, dynamic>);
  return Response.json(
    body: {
      "message": "Success",
    },
  );
}
