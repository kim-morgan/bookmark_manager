# bookmark_manager

```
As a user ,
so that I can keep a track of my favourite website,
I'd like to see a list of bookmarks
```

![screenshot](https://github.com/makersacademy/course/raw/main/bookmark_manager/images/bookmark_manager_1.png)

* CREATE DATABASE bookmakr_manager;
* \c bookmark_manager;
* CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60));)

* INSERT INTO bookmarks (url)
  VALUES ('http://www.makersacademy.com')
* INSERT INTO bookmarks (url)
  VALUES ('http://www.google.com')
* INSERT INTO bookmarks (url)
  VALUES ('http://www.destroyallsoftware.com')
* INSERT INTO bookmarks (url)
  VALUES ('www.github.com')