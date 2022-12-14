// Only run this on the server machine
if !(isServer) exitWith {};

params[["_treeScale", Lushify_TreeScale, [0]], ["_bushScale", Lushify_BushScale, [0]], ["_modelReplacements", parseSimpleArray Lushify_ModelReplacements, [[]]]];

private _new = [];
private _hidden = [];

{
	private _model = (getModelInfo _x)#1;
	private _modelIndex = _modelReplacements findIf {_x#0 isEqualTo _model};
	if (_modelIndex != -1) then {
		_hidden pushBack _x;
		_x = [_x, (_modelReplacements#_modelIndex)#1] call Lushify_fnc_ReplaceModel;
		_new pushBack _x;
	};
	_x setObjectScale (random [Lushify_MinScaleMult * _treeScale, _treeScale, Lushify_MaxScaleMult * _treeScale]);
} forEach (nearestTerrainObjects[[worldSize / 2, worldSize / 2], ["TREE", "SMALL TREE"], worldSize * sqrt 2 / 2, false]);

{
	private _model = (getModelInfo _x)#1;
	private _modelIndex = _modelReplacements findIf {_x#0 isEqualTo _model};
	if (_modelIndex != -1) then {
		_hidden pushBack _x;
		_x = [_x, (_modelReplacements#_modelIndex)#1] call Lushify_fnc_ReplaceModel;
		_new pushBack _x;
	};
	_x setObjectScale (random [Lushify_MinScaleMult * _bushScale, _bushScale, Lushify_MaxScaleMult * _bushScale]);
} forEach (nearestTerrainObjects[[worldSize / 2, worldSize / 2], ["BUSH"], worldSize * sqrt 2 / 2, false]);

{
	(_x + [false]) call Lushify_fnc_ScaleArea;
} forEach LUSHIFY_3DEN_AREAS;

[_new, _hidden];