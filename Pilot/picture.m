function [relpos, altpos]=picture(scr, const, expDes, t)
% ---------------------------------------------------------------------------------
% Creates the picture which is then displayed afterwards
% ---------------------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

%% Check variables to define shape, color and position

%picCStartT = GetSecs;

% Relevant (mentioned in sentence) and alternative object shape (variable 4 and 7)
if expDes.expMat(t,4) == 0
    relObj = 0;
    if expDes.expMat(t,7) == 0
        altObj = 1;
    else
        altObj = 2;
    end
elseif expDes.expMat(t,4) == 1
    relObj = 1;
    if expDes.expMat(t,7) == 0
        altObj = 0;
    else
        altObj = 2;
    end
else
    relObj = 2;
    if expDes.expMat(t,7) == 0
        altObj = 0;
    else
        altObj = 1;
    end
end

%% Color
% is determined by the matching condition
% for FA and TN, the mentioned object does not have the mentioned color

if (expDes.expMat(t,1) == 1 && expDes.expMat(t,2) == 0) || (expDes.expMat(t,1) == 0 && expDes.expMat(t,2) == 1) % FA / TN
    if expDes.expMat(t,5) == 0
        colRel = const.Black;
        colAlt = const.White;
    else
        colRel = const.White;
        colAlt = const.Black;
    end
else % otherwise they match: TA / FN
    if expDes.expMat(t,5) == 0
        colRel = const.White;
        colAlt = const.Black;
    else
        colRel = const.Black;
        colAlt = const.White;
    end
end

%% Position of relevant and alternative object: variable 6

if expDes.expMat(t,6) == 0
    relPos = 0;
    altPos = 1;
else
    relPos = 1;
    altPos = 0;
end

%% Choose 3 random positions within a 3x3 grid to the left and right of the fixation cross and draw

% Draw relevant objects
r = randi([1 3],1,3);
relpos = r;

 if relPos == 0 % relevant object left
    switch relObj
        case 0
            Screen('FillOval', scr.main, colRel, [const.xl(1) - const.c, const.y(r(1)) - const.c, const.xl(1) + const.c, const.y(r(1)) + const.c]);
            Screen('FillOval', scr.main, colRel, [const.xl(2) - const.c, const.y(r(2)) - const.c, const.xl(2) + const.c, const.y(r(2)) + const.c]);
            Screen('FillOval', scr.main, colRel, [const.xl(3) - const.c, const.y(r(3)) - const.c, const.xl(3) + const.c, const.y(r(3)) + const.c]);
        case 1
            Screen('FillRect', scr.main, colRel, [const.xl(1) - const.rx, const.y(r(1)) - const.ry, const.xl(1) + const.rx, const.y(r(1)) + const.ry]);
            Screen('FillRect', scr.main, colRel, [const.xl(2) - const.rx, const.y(r(2)) - const.ry, const.xl(2) + const.rx, const.y(r(2)) + const.ry]);
            Screen('FillRect', scr.main, colRel, [const.xl(3) - const.rx, const.y(r(3)) - const.ry, const.xl(3) + const.rx, const.y(r(3)) + const.ry]);
        case 2
            Screen('FillPoly', scr.main, colRel, [const.xl(1) - const.tx, const.y(r(1)) + const.ty; const.xl(1), const.y(r(1)) - const.ty; const.xl(1) + const.tx, const.y(r(1)) + const.ty]);
            Screen('FillPoly', scr.main, colRel, [const.xl(2) - const.tx, const.y(r(2)) + const.ty; const.xl(2), const.y(r(2)) - const.ty; const.xl(2) + const.tx, const.y(r(2)) + const.ty]);
            Screen('FillPoly', scr.main, colRel, [const.xl(3) - const.tx, const.y(r(3)) + const.ty; const.xl(3), const.y(r(3)) - const.ty; const.xl(3) + const.tx, const.y(r(3)) + const.ty]);
    end
 else % relevant object right
     switch relObj
        case 0
            Screen('FillOval', scr.main, colRel, [const.xr(1) - const.c, const.y(r(1)) - const.c, const.xr(1) + const.c, const.y(r(1)) + const.c]);
            Screen('FillOval', scr.main, colRel, [const.xr(2) - const.c, const.y(r(2)) - const.c, const.xr(2) + const.c, const.y(r(2)) + const.c]);
            Screen('FillOval', scr.main, colRel, [const.xr(3) - const.c, const.y(r(3)) - const.c, const.xr(3) + const.c, const.y(r(3)) + const.c]);
        case 1
            Screen('FillRect', scr.main, colRel, [const.xr(1) - const.rx, const.y(r(1)) - const.ry, const.xr(1) + const.rx, const.y(r(1)) + const.ry]);
            Screen('FillRect', scr.main, colRel, [const.xr(2) - const.rx, const.y(r(2)) - const.ry, const.xr(2) + const.rx, const.y(r(2)) + const.ry]);
            Screen('FillRect', scr.main, colRel, [const.xr(3) - const.rx, const.y(r(3)) - const.ry, const.xr(3) + const.rx, const.y(r(3)) + const.ry]);
        case 2
            Screen('FillPoly', scr.main, colRel, [const.xr(1) - const.tx, const.y(r(1)) + const.ty; const.xr(1), const.y(r(1)) - const.ty; const.xr(1) + const.tx, const.y(r(1)) + const.ty]);
            Screen('FillPoly', scr.main, colRel, [const.xr(2) - const.tx, const.y(r(2)) + const.ty; const.xr(2), const.y(r(2)) - const.ty; const.xr(2) + const.tx, const.y(r(2)) + const.ty]);
            Screen('FillPoly', scr.main, colRel, [const.xr(3) - const.tx, const.y(r(3)) + const.ty; const.xr(3), const.y(r(3)) - const.ty; const.xr(3) + const.tx, const.y(r(3)) + const.ty]);
     end
 end

 % Draw alternative objects
 r = randi([1 3],1,3);
 altpos = r;

 if altPos == 0 % relevant object left
    switch altObj
        case 0
            Screen('FillOval', scr.main, colAlt, [const.xl(1) - const.c, const.y(r(1)) - const.c, const.xl(1) + const.c, const.y(r(1)) + const.c]);
            Screen('FillOval', scr.main, colAlt, [const.xl(2) - const.c, const.y(r(2)) - const.c, const.xl(2) + const.c, const.y(r(2)) + const.c]);
            Screen('FillOval', scr.main, colAlt, [const.xl(3) - const.c, const.y(r(3)) - const.c, const.xl(3) + const.c, const.y(r(3)) + const.c]);
        case 1
            Screen('FillRect', scr.main, colAlt, [const.xl(1) - const.rx, const.y(r(1)) - const.ry, const.xl(1) + const.rx, const.y(r(1)) + const.ry]);
            Screen('FillRect', scr.main, colAlt, [const.xl(2) - const.rx, const.y(r(2)) - const.ry, const.xl(2) + const.rx, const.y(r(2)) + const.ry]);
            Screen('FillRect', scr.main, colAlt, [const.xl(3) - const.rx, const.y(r(3)) - const.ry, const.xl(3) + const.rx, const.y(r(3)) + const.ry]);
        case 2
            Screen('FillPoly', scr.main, colAlt, [const.xl(1) - const.tx, const.y(r(1)) + const.ty; const.xl(1), const.y(r(1)) - const.ty; const.xl(1) + const.tx, const.y(r(1)) + const.ty]);
            Screen('FillPoly', scr.main, colAlt, [const.xl(2) - const.tx, const.y(r(2)) + const.ty; const.xl(2), const.y(r(2)) - const.ty; const.xl(2) + const.tx, const.y(r(2)) + const.ty]);
            Screen('FillPoly', scr.main, colAlt, [const.xl(3) - const.tx, const.y(r(3)) + const.ty; const.xl(3), const.y(r(3)) - const.ty; const.xl(3) + const.tx, const.y(r(3)) + const.ty]);
    end
 else % relevant object right
     switch altObj
        case 0
            Screen('FillOval', scr.main, colAlt, [const.xr(1) - const.c, const.y(r(1)) - const.c, const.xr(1) + const.c, const.y(r(1)) + const.c]);
            Screen('FillOval', scr.main, colAlt, [const.xr(2) - const.c, const.y(r(2)) - const.c, const.xr(2) + const.c, const.y(r(2)) + const.c]);
            Screen('FillOval', scr.main, colAlt, [const.xr(3) - const.c, const.y(r(3)) - const.c, const.xr(3) + const.c, const.y(r(3)) + const.c]);
        case 1
            Screen('FillRect', scr.main, colAlt, [const.xr(1) - const.rx, const.y(r(1)) - const.ry, const.xr(1) + const.rx, const.y(r(1)) + const.ry]);
            Screen('FillRect', scr.main, colAlt, [const.xr(2) - const.rx, const.y(r(2)) - const.ry, const.xr(2) + const.rx, const.y(r(2)) + const.ry]);
            Screen('FillRect', scr.main, colAlt, [const.xr(3) - const.rx, const.y(r(3)) - const.ry, const.xr(3) + const.rx, const.y(r(3)) + const.ry]);
        case 2
            Screen('FillPoly', scr.main, colAlt, [const.xr(1) - const.tx, const.y(r(1)) + const.ty; const.xr(1), const.y(r(1)) - const.ty; const.xr(1) + const.tx, const.y(r(1)) + const.ty]);
            Screen('FillPoly', scr.main, colAlt, [const.xr(2) - const.tx, const.y(r(2)) + const.ty; const.xr(2), const.y(r(2)) - const.ty; const.xr(2) + const.tx, const.y(r(2)) + const.ty]);
            Screen('FillPoly', scr.main, colAlt, [const.xr(3) - const.tx, const.y(r(3)) + const.ty; const.xr(3), const.y(r(3)) - const.ty; const.xr(3) + const.tx, const.y(r(3)) + const.ty]);
     end
 end

 %picCEndT = GetSecs;
 %picCreateDuration = picCEndT - picCStartT;
 %disp(picCreateDuration);

end
