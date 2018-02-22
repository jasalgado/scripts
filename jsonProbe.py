#!/usr/bin/python

# Estructura de documento json con python

import json

data = {}
dev=[]
prod=[]

dev.append("server1")
dev.append("server2")

prod.append("server3")
prod.append("server4")

data['desarrollo']=dev
data['produccion']=prod

print json.dumps(data)

