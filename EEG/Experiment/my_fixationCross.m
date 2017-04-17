function my_fixationCross(scr,const)
% ----------------------------------------------------------------------
% draws fixation cross
% ----------------------------------------------------------------------

x = scr.x_mid;
y = const.fixpos;
Screen('FillRect',scr.main,const.colorT,[(x-(const.sideFP_X/2)) (y-(const.thicknessFP_Y/2)) (x+(const.sideFP_X/2)) (y+(const.thicknessFP_Y/2))]);
Screen('FillRect',scr.main,const.colorT,[(x-(const.thicknessFP_X/2)) (y-(const.sideFP_Y/2)) (x+(const.thicknessFP_X/2)) (y+(const.sideFP_Y/2))]);

end