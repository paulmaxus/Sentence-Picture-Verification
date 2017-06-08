function my_fixationCross(scr,const)
% ----------------------------------------------------------------------
% draws fixation cross
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

x = scr.x_mid;
y = const.fixpos;
Screen('FillRect',scr.main,const.colorT,[(x-(const.sideFP_X/2)) (y-(const.thicknessFP_Y/2)) (x+(const.sideFP_X/2)) (y+(const.thicknessFP_Y/2))]);
Screen('FillRect',scr.main,const.colorT,[(x-(const.thicknessFP_X/2)) (y-(const.sideFP_Y/2)) (x+(const.thicknessFP_X/2)) (y+(const.sideFP_Y/2))]);

end
