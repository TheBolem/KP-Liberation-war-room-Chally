params ["_vehicle"];

private _grp = createGroup [GRLIB_side_enemy, true];
private _vehcrew = [];
while {count units _grp < 3} do {
	[selectRandom militia_squad, getPos _vehicle, _grp] call F_createManagedUnit;
};
((units _grp) select 0) moveInDriver _vehicle;
((units _grp) select 1) moveInGunner _vehicle;
((units _grp) select 2) moveInCommander _vehicle;
{
	if (vehicle _x == _x) then {
		deleteVehicle _x;
	};
} foreach (units _grp);
