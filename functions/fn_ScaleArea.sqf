// Only run this on the server machine
if !(isServer) exitWith {};

params[
	["_area", objNull], 
	["_allTrees", [], [[]]], 
	["_allBushes", [], [[]]], 
	["_treeScale", Lushify_TreeScale, [0]], 
	["_bushScale", Lushify_BushScale, [0]], 
	["_modelReplacements", parseSimpleArray Lushify_ModelReplacements],
	["_calledFromEditor", true]
];

private _new = [];
private _hidden = [];

if (isNil "LUSHIFY_3DEN_AREAS") then {
	LUSHIFY_3DEN_AREAS = [];
};

if (_calledFromEditor) then {
	LUSHIFY_3DEN_AREAS pushBackUnique _this; 
};

{
	private _model = (getModelInfo _x)#1;
	private _modelIndex = _modelReplacements findIf {_x#0 isEqualTo _model};
	if (_modelIndex != -1) then {
		_hidden pushBack _x;
		_x = [_x, (_modelReplacements#_modelIndex)#1] call Lushify_fnc_ReplaceModel;
		_new pushBack _x;
	};
	_x setObjectScale (random [Lushify_MinScaleMult * _treeScale, _treeScale, Lushify_MaxScaleMult * _treeScale]);
} forEach (_allTrees inAreaArray _area);
{
	private _model = (getModelInfo _x)#1;
	private _modelIndex = _modelReplacements findIf {_x#0 isEqualTo _model};
	if (_modelIndex != -1) then {
		_hidden pushBack _x;
		_x = [_x, (_modelReplacements#_modelIndex)#1] call Lushify_fnc_ReplaceModel;
		_new pushBack _x;
	};
	_x setObjectScale (random [Lushify_MinScaleMult * _bushScale, _bushScale, Lushify_MaxScaleMult * _bushScale]);
} forEach (_allBushes inAreaArray _area);

[_new, _hidden];