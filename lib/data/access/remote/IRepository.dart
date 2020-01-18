abstract class IRepository<T> {

  String getTag();

  /*
   *  HTTP GET
   */
  Future<T> fetch(int id);
  Future<List<T>> fetchAll();

  /*
   *  HTTP POST
   */
  Future<T> post(T item);

  /*
   *  HTTP PUT
   */
  Future<T> put(T item);
}