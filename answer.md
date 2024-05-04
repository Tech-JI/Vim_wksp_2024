# Practice

## Ex.1-visual mode



将wallpaper.txt如下文本

```
wallpaper_1.jpg
wallpaper_1.jpg
......
wallpaper_1.jpg
```

改成

```
Wallpaper_1.jpg
Wallpaper_1.jpg
......
Wallpaper_1.jpg
```



Answer

```
vim ex1.txt
gg
Ctrl+v
G
c
W
esc
```

或者`:%s/wall/Wall/g`



## Ex.2-键盘宏

在ex2.txt中写入如下文本

```
wallpaper_1.jpg
wallpaper_2.jpg
......
wallpaper_100.jpg
```

*Hint*: `Ctrl+a`整数+1；`Ctrl+x`整数-1



Answer

```
vim ex2.txt
insert "wallpaper_1.jpg"
qm
yy
p
f .
h
Ctrl+a
qm
99@m
```

