function [scr]=scrConfig(const)
% ----------------------------------------------------------------------
% defines screen properties in scr
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

% Number of the experimental screen:
scr.all = Screen('Screens');
scr.scr_num = max(scr.all);

% Size of the display:
[scr.disp_sizeX,scr.disp_sizeY] = Screen('DisplaySize',scr.scr_num);

% Screen resolution in pixel
[scr.scr_sizeX, scr.scr_sizeY]=Screen('WindowSize', scr.scr_num);

% Frame rate in hertz
scr.hz = Screen('FrameRate',scr.scr_num);
%disp(scr.hz);

% Frame duration
scr.fd =1/scr.hz;

% Center of the screen :
scr.x_mid = (scr.scr_sizeX/2.0);
scr.y_mid = (scr.scr_sizeY/2.0);
scr.mid = [scr.x_mid,scr.y_mid];

end
