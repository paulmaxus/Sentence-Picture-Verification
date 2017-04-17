    function [const] = constConfig(scr, const)
% ----------------------------------------------------------------------
% Defines constant properties
% ----------------------------------------------------------------------

% Colors
const.colBG = [119 119 119]; % background
const.colorT = [120 200 200]; % color text and fix cross
const.Black = [220 220 220];
const.White = [30 30 30];

% Dimensions of fixation cross
const.sideFP_X = 30;
const.sideFP_Y = 30;
const.thicknessFP_X = 5;
const.thicknessFP_Y = 5;

% Dimensions of objects
const.c = 40; % px radius
const.rx = 40;   
const.ry = 30;
const.tx = 50;
const.ty = 40;

% Center positions of left and right picture
const.xl = [scr.x_mid-400 scr.x_mid-280 scr.x_mid-160]; % 3 horizontal coordinates for left
const.xr = [scr.x_mid+400 scr.x_mid+280 scr.x_mid+160]; % and right
const.y = [scr.y_mid-80 scr.y_mid scr.y_mid+80]; % 3 vertical positions (same for left and right)

% Position of words and fixation cross
const.fixpos = scr.y_mid - 100;

% Text properties
const.textfont = 'Helvetica';
const.textsize = 30; % sentence size
const.instsize = 30; % instructions size

% Amount of trials per block
const.breakafter = 8;

%% timing settings

const.tblank = 1.500; % ITI (inter-trial interval)
const.numFrm_tblank = round(const.tblank/scr.fd);
 
const.tword = 0.300; % Single-word display time
const.numFrm_tword = round(const.tword/scr.fd);

const.tisi = 0.200; % ISI (inter-stimulus interval) for words
const.numFrm_tisi = round(const.tisi/scr.fd);

const.tdelayS = 0.250; % Delay: short
const.numFrm_tdelayS = round(const.tdelayS/scr.fd);

const.tdelayL = 1.500; % Delay: long
const.numFrm_tdelayL = round(const.tdelayL/scr.fd);

const.tpic = 0.200; % Picture display time
const.numFrm_tpic = round(const.tpic/scr.fd);

end