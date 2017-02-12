/*
 * Author: Titan
 * Loops through all map markers and saves to db event buffer
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call FUNC(trackMarkers);
 *
 * Public: No
 */

#include "script_component.hpp"
private _functionLogName = "AAR > trackMarkers";

// Loop through all markers on the map
{

    private _markerType = markerType _x;

    if (_markerType == "Empty") exitWith {};

    private _markerName = (_x splitString """") joinString "";
    private _markerPosition = markerPos _x;
    private _markerText = markerText _x;
    private _markerDirection = markerDir _x;
    private _markerShape = markerShape _x;
    private _markerSize = markerSize _x;
    private _markerColor = markerColor _x;
    private _markerBrush = markerBrush _x;
    private _markerAlpha = markerAlpha _x;

    // Form JSON for saving
    // It sucks we have to use such abbreviated keys but we need to save as much space as pos!
    private _singleMarkerData = format['
        {
            "name": "%1",
            "pos": %2,
            "type": "%3",
            "text": "%4",
            "dir": "%5",
            "shape": "%6",
            "size": %7,
            "color": "%8",
            "brush": "%9",
            "alpha": "%10"
        }',
        _markerName,
        _markerPosition,
        _markerType,
        _markerText call CBA_fnc_trim,
        _markerDirection,
        _markerShape,
        _markerSize,
        _markerColor,
        _markerBrush,
        _markerAlpha
    ];

} forEach allMapMarkers;
