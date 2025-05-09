import std/times
now()
echo now()
echo getTime()
getTime()
epochTime()
var t = now()
t.format(yyyy-MM-dd)
t.format("yyyy-MM-dd")
t.format("yyyy-MM-dd-HH-mm-ss")
t
var t = now()
var a = now()
a
a.format("yyyy-MM-dd-HH-mm-ss")
import os
getAppDir()
import marhsal
import marshal
type Neko = object
  name: string
  age: int
var neko = Neko(name:"nacho",age:18)
echo $$neko
var p = $$neko
p.type
echo p.type
import json
var j =  %*{"name":"nacho"}
j.type
echo j.type
