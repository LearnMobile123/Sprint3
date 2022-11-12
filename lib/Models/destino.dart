class Destino{
  var _id;
  var _name;
  var _ciudad;
  var _descripcion;
  var _rating;
  var _genre;

  Destino(this._id, this._name, this._ciudad, this._descripcion, this._rating,
      this._genre);

  Map<String,dynamic> toJson() => {
    'id' : _id,
    'name' : _name,
    'ciudad' : _ciudad,
    'descripcioón' : _descripcion,
    'rating' : _rating,
    'genre' : _genre,
  };

  Destino.fromJson(Map<String,dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _ciudad = json['ciudad'],
        _descripcion = json['descripcioón'],
        _rating = json['rating'],
        _genre = json['genre'];

  get id => _id;

  set id(value) {
    _id = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get pages => _descripcion;

  set pages(value) {
    _descripcion = value;
  }

  get author => _ciudad;

  set author(value) {
    _ciudad = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }
}