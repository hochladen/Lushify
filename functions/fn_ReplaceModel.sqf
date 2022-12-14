params[["_object", objNull, [objNull]], ["_newModelPath", "", [""]]];

private _posAGLS = getPos _object;
_object hideObjectGlobal true;
private _newObj = createSimpleObject [_newModelPath, _posAGLS];
private _bbr = boundingBoxReal _newObj;
_posAGLS set [2, abs (((_bbr#1)#2) - ((_bbr#0)#2))];
_newObj setPos _posAGLS;
_newObj
