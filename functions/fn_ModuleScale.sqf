private _mode = param [0, "", [""]];
private _input = param [1, [], [[]]];
private _module = _input param [0, objNull, [objNull]];

switch _mode do
{
	case "init":
	{
		private _area = [getPos _module];
		_area append (_module getVariable ["objectarea",[]]);
		_area params ["_pivot", "_a", "_b"];
		private _radius = (_a max _b) * 1.42;

		private _treeScale = _module getVariable ["TreeScale", 1];
		private _bushScale = _module getVariable ["BushScale", 1];
		private _modelReplacements = call compile (_module getVariable ["ModelReplacements", "[]"]);
		private _allTrees = (nearestTerrainObjects[_area#0, ["TREE", "SMALL TREE"], _radius, false]);
		private _allBushes = (nearestTerrainObjects[_area#0, ["BUSH"], _radius, false]);
		[_area, _allTrees, _allBushes, _treeScale, _bushScale, _modelReplacements] call Lushify_fnc_ScaleArea;
	};
	case "attributesChanged3DEN":
	{
		private _size = (_module get3DENAttribute "Size3") select 0;
		private _isRectangle = (_module get3DENAttribute "isRectangle") select 0;

		if (isNil "_size" || {isNil "_isRectangle"}) exitWith {};

		_size params ["_a", "_b"];

		private _radius = (_a max _b) * 1.42;
		private _area = [getPos _module, _a, _b, getDir _module, _isRectangle, -1];

		{_x setObjectScale 1} forEach (_module getVariable ["#objects",[]]);
		private _replaced = _module getVariable ["#replaced",[]];
		if (count _replaced > 0) then {
			{deleteVehicle _x} forEach (_replaced#0);
			{_x hideObjectGlobal false} forEach (_replaced#1);
		};

		private _treeScale = _module getVariable ["TreeScale", 1];
		private _bushScale = _module getVariable ["BushScale", 1];
		private _modelReplacements = parseSimpleArray (_module getVariable ["ModelReplacements", "[]"]);
		private _allTrees = (nearestTerrainObjects[_area#0, ["TREE", "SMALL TREE"], _radius, false]);
		private _allBushes = (nearestTerrainObjects[_area#0, ["BUSH"], _radius, false]);
		private _newAndHidden = [_area, _allTrees, _allBushes, _treeScale, _bushScale, _modelReplacements] call Lushify_fnc_ScaleArea;

		_module setVariable ["#objects", _allTrees + _allBushes];
		_module setVariable ["#replaced", _newAndHidden];
	};
	case "registeredToWorld3DEN": {};
	case "unregisteredFromWorld3DEN":
	{
		{_x setObjectScale 1} forEach (_module getVariable ["#objects",[]]);
		private _replaced = _module getVariable ["#replaced",[]];
		if (count _replaced > 0) then {
			{deleteVehicle _x} forEach (_replaced#0);
			{_x hideObjectGlobal false} forEach (_replaced#1);
		};
	};
	case "connectionChanged3DEN": {};
};