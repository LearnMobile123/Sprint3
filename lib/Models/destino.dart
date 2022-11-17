class Destino{
  var _id;
  var _name;
  var _ciudad;
  var _departamento;
  var _temperatura;
  var _descripcion;
  var _rating;
  var _genre;
  var _urlimagen;


  Destino(this._id, this._name, this._ciudad, this._departamento, this._temperatura, this._descripcion, this._rating,
      this._genre, this._urlimagen);

  Map<String,dynamic> toJson() => {
    'id' : _id,
    'name' : _name,
    'ciudad' : _ciudad,
    'departamento' : _departamento,
    'temperatura' : _temperatura,
    'descripción' : _descripcion,
    'rating' : _rating,
    'genre' : _genre,
    'urlimagen' : _urlimagen,

  };

  Destino.fromJson(Map<String,dynamic> json)
      : _id = json['id'],
        _name = json['name'],
        _ciudad = json['ciudad'],
        _departamento = json['departamento'],
        _temperatura = json['temperatura'],
        _descripcion = json['descripción'],
        _rating = json['rating'],
        _genre = json['genre'],
        _urlimagen = json['urlimagen'];

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get rating => _rating;

  set rating(value) {
    _rating = value;
  }

  get urlimagen => _urlimagen;

  set urlimagen(value) {
    _urlimagen = value;
  }

  get descripcion => _descripcion;

  set descripcion(value) {
    _descripcion = value;
  }

  get ciudad => _ciudad;

  set ciudad(value) {
    _ciudad = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }
}