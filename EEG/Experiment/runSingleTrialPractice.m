function [resMat,relpos,altpos] = runSingleTrialPractice(scr, const, expDes, my_key, t)
% ----------------------------------------------------------------------
% runs a single trial and outputs the results in resMat (key, RT)
% ----------------------------------------------------------------------

%% ITI: Show fixation cross
for frame = 1:const.numFrm_tblank
    Screen('FillRect', scr.main, const.colBG);
    my_fixationCross(scr,const);
    Screen('Flip', scr.main);
end

%% Show sentence

% How many words? (affirmative or negative?)
if expDes.expMat(t,1) == 0
    wordn = 6; % neg
else
    wordn = 5; % aff
end

% Build sentence
art = 'LE          ';
subj = 'FIGURE      ';
verb = 'SONO        ';
neg = 'NON         ';

% Shape
switch expDes.expMat(t,4)
    case 0 % Shape is circular
        shape = 'CIRCOLARI   ';
    case 1 % Shape is rectangular
        shape = 'RETTANGOLARI';
    case 2 % Shape is triangular
        shape = 'TRIANGOLARI ';
end

% Color
if expDes.expMat(t,5) == 0 % black
    color = 'NERE        ';
else
    color = 'BIANCHE     ';
end

% Put sentence together
if expDes.expMat(t,3) == 0 % shape-color
    if expDes.expMat(t,1) == 1 % aff
        sentence = [art; subj; shape; verb; color];
    else
        sentence = [art; subj; shape; neg; verb; color];
    end
else % color-shape
    if expDes.expMat(t,1) == 1 % aff
        sentence = [art; subj; color; verb; shape];
    else
        sentence = [art; subj; color; neg; verb; shape];
    end
end

sentence = cellstr(sentence);

% Display words, one at a time
for i = 1:wordn
    
    % ISI: skip before the first word
    if i ~= 1 
        for frame = 1:const.numFrm_tisi
            Screen('FillRect', scr.main, const.colBG);
            my_fixationCross(scr,const);
            Screen('Flip', scr.main);
        end
    end
    
    % Prepare word and display
    Screen('FillRect', scr.main, const.colBG);
    my_fixationCross(scr,const);
    Screen ('TextFont', scr.main, const.textfont);
    Screen('TextSize', scr.main, const.textsize);    
    DrawFormattedText(scr.main, char(sentence(i)), 'center', scr.y_mid - 60, const.colorT);
    wordOnset = Screen('Flip', scr.main);    
    
    elapsed = GetSecs-wordOnset;
    while elapsed < const.tword
        elapsed = GetSecs-wordOnset;
    end
    
end

%% Display fixation cross for the delay time, then picture (build picture during delay)

% Flip the fixation cross
Screen('FillRect', scr.main, const.colBG);
my_fixationCross(scr,const);
delayOnset = Screen('Flip', scr.main);
tdelay = const.tdelayL;

% Begin drawing the picture during delay
Screen('FillRect', scr.main, const.colBG);
my_fixationCross(scr,const);
[relpos,altpos]=picture(scr, const, expDes, t);

% Wait for delay to elapse, then flip
elapsed = GetSecs-delayOnset;
while elapsed < tdelay
    elapsed = GetSecs-delayOnset;
end
%disp(elapsed);

% Flip picture for fixed amount of time
picOnset = Screen('Flip', scr.main);

% save image of the picture
%img = Screen('GetImage', scr.main);
%imwrite(img, 'screenshot.jpg');
              
elapsed = GetSecs-picOnset;
while elapsed < const.tpic
    elapsed = GetSecs-picOnset;
end

%% Await answer
[key_press, tRT] = getAnswer(scr, const, my_key, picOnset);
tRT = tRT - picOnset;

% In case of timeout show warning
if key_press.timeout == 1
    
    resMat = [2, tRT]; % timeout variable is 2
    % Show warning
    Screen('FillRect', scr.main, const.colBG);
    my_fixationCross(scr,const);
    Screen ('TextFont', scr.main, const.textfont);
    Screen('TextSize', scr.main, const.textsize);    
    DrawFormattedText(scr.main, 'PIU VELOCE', 'center', scr.y_mid - 60, [220 10 10]);
    warnT = Screen('Flip', scr.main);
    
    % Display warning for 1 second
    elapsedW = GetSecs - warnT;
    while elapsedW < 1
        elapsedW = GetSecs - warnT;
    end
    
% Otherwise save respective answer (corrisponding or not-corrisponding)     
else
    if const.sjct_blockseq == 0
        % up is matching sentence-picture: value 1
        if key_press.up == 1
            resMat = [1, tRT];
        elseif key_press.down == 1
            resMat = [0, tRT];
        end
    else
        % down is matching: value 1
        if key_press.up == 1
            resMat = [0, tRT];
        elseif key_press.down == 1
            resMat = [1, tRT];
        end
    end
    
end
end