abstract class ICache<T> {

  T get(int id);
  List<T> getAll();

  // TODO: save, update, delete
}