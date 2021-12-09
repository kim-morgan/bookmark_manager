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

```
As a user,
so that I can add notes to my bookmarks,
I'd like to be able to add comments to bookmarks
```

![screenshot](https://github.com/makersacademy/course/raw/main/bookmark_manager/images/bookmark_manager_1.png)

## Set up databases
```
  CREATE DATABASE bookmark_manager;
  \c bookmark_manager;
  CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(20), url VARCHAR(60));)
```

```
CREATE TABLE comments (
  id SERIAL PRIMARY KEY,
  text VARCHAR(240),
  bookmark_id integer REFERENCES bookmarks(id)
);
```

* CREATE DATABASE bookmark_manager_test;
* \c bookmark_manager;
* CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title VARCHAR(20), url VARCHAR(60));)