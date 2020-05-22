function [listMarkers,nameMarkers] = fun_createVector_listMarkers()

%% CREO IL VETTORE CON IL NUMERO DEI MARKERS
% Per aggiungere un markers basta inserirlo in listMarkers nella posizione
% desiderata, poi ANCHE in nameMarkers nella stessa posizione

% ST:       5
% tank:    39, 30, 36, 31, 50, 51, 53, 54
% pipe:     34, 35, 29, 27, 7, 8
% column:   16, 42, 61, 26, 47, 66

listMarkers = {5 39 30 36 31 50 51 53 54 34 35 29 27 8 7 16 42 61 26 47 66};
nameMarkers = {'maxDispl_M5', 'maxDispl_M39', 'maxDispl_M30', 'maxDispl_M36', 'maxDispl_M31', 'maxDispl_M50', 'maxDispl_M51', 'maxDispl_M53', 'maxDispl_M54', 'maxDispl_M34', 'maxDispl_M35', 'maxDispl_M29', 'maxDispl_M27', 'maxDispl_M8', 'maxDispl_M7', 'maxDispl_M16', 'maxDispl_M42', 'maxDispl_M61', 'maxDispl_M26', 'maxDispl_M47', 'maxDispl_M66', 'maxDispl_M39_M30', 'maxDispl_M36_M31', 'maxDispl_M50_M43', 'maxDispl_M51_M44', 'maxDispl_M53_M45', 'maxDispl_M54_M47', 'maxDispl_M29_M7', 'maxDispl_M66_M47', 'maxDispl_M47_M26', 'maxDispl_M26_M2', 'maxDispl_M66_M2', 'maxDispl_M61_M42', 'maxDispl_M42_M16', 'maxDispl_M16_M2', 'maxDispl_M61_M2'};