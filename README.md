# bookmark_manager

```
As a user ,
so that I can keep a track of my favourite website,
I'd like to see a list of bookmarks
```

```
As a user, 
so that I can store my bookmarks,
I'd like to be able to add bookmarks
```

```
As a user,
so that I can delete my bookmarks,
I'd like to be able to remove bookmarks
```

```
As a user,
so that I can update my bookmarks,
I'd like to be able to update bookmarks
```

![screenshot](https://github.com/makersacademy/course/raw/main/bookmark_manager/images/bookmark_manager_1.png)

## Set up databases

* CREATE DATABASE bookmark_manager;
* \c bookmark_manager;
* CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(20), url VARCHAR(60));)

* INSERT INTO bookmarks (url)
  VALUES ('http://www.makersacademy.com')
* INSERT INTO bookmarks (url)
  VALUES ('http://www.google.com')
* INSERT INTO bookmarks (url)
  VALUES ('http://www.destroyallsoftware.com')
* INSERT INTO bookmarks (url)
  VALUES ('www.github.com')

* CREATE DATABASE bookmark_manager_test;
* \c bookmark_manager;
* CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(20), url VARCHAR(60));)