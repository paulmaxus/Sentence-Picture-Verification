function [key_press,tRt]=getAnswer(scr,const,my_key,picOnset)
% ----------------------------------------------------------------------
% collects the answer (button-press)
% ----------------------------------------------------------------------

key_press.up = 0;
key_press.down = 0;
key_press.push_button = 0;
key_press.timeout = 0;

elapsed = GetSecs - picOnset;

% waiting for input
while elapsed < 4

        % show fixation cross, waiting for input
        Screen('FillRect',scr.main,const.colBG);
        my_fixationCross(scr,const);
        Screen('Flip',scr.main);

        % when button is pressed, check which one and output
        [keyIsDown, seconds, keyCode] = KbCheck; % checks for any button press, return value and timestamp
        if keyIsDown
            if (keyCode(my_key.down))
                key_press.down = 1;
                key_press.push_button = 1;
                tRt = seconds;
                return;
            elseif (keyCode(my_key.up))
                key_press.up = 1;
                key_press.push_button = 1;
                tRt = seconds;
                return;
            elseif (keyCode(my_key.escape))
                overDone;
            end
            % when any other button is pressed, continue waiting for input
        end

        elapsed = GetSecs - picOnset;

end
    
% Timeout

key_press.timeout = 1;
tRt = seconds;

end