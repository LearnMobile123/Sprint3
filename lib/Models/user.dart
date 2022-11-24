class User {
  var _uid;
  var _name;
  var _email;
  var _password;
  var _genre;
  var _destinosFavoritos;
  var _bornDate;

  User(this._uid, this._name, this._email, this._password, this._genre,
      this._destinosFavoritos, this._bornDate);

  User.Empty();

  get uid => _uid;

  set uid(value) {
    _uid = value;
  }

  User.fromJson(Map<String,dynamic> json)
      : _uid = json['uid'],
        _name = json['name'],
        _email = json['email'],
        _password = json['password'],
        _genre = json['genre'],
        _destinosFavoritos = json['favoritesGenres'],
        _bornDate = json['bornDate'];

  Map<String,dynamic> toJson() => {
    'uid' : _uid,
    'name' : _name,
    'email' : _email,
    'password' : _password,
    'genre' : _genre,
    'favoritesGenre' : _destinosFavoritos,
    'bornDate' : _bornDate,

  };


  get name => _name;

  set name(value) {
    _name = value;
  }

  get email => _email;

  get bornDate => _bornDate;

  set bornDate(value) {
    _bornDate = value;
  }

  get favoritesGenres => _destinosFavoritos;

  set favoritesGenres(value) {
    _destinosFavoritos = value;
  }

  get genre => _genre;

  set genre(value) {
    _genre = value;
  }

  get password => _password;

  set password(value) {
    _password = value;
  }

  set email(value) {
    _email = value;
  }
}