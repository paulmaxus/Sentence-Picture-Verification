function main(const)
% ----------------------------------------------------------------------
% main experimental function triggered by the launcher
% ----------------------------------------------------------------------

%% Configuration

% Screen configuration:
[scr] = scrConfig(const);

% Keyboard configuration:
[my_key] = keyConfig;

% Experimental design configuration:
% Building two designs (2 blocks)
[expDes] = designConfig(const);

% Experimental constants configuration:
[const] = constConfig(scr,const);

% Instruction configurations
[textExp,button] = instructionConfig(const);

% open screen in real or debug mode
if const.expStart == 0
    [scr.main] = Screen('OpenWindow',scr.scr_num,[],[300 300 1600 1000]); % debug mode
else
    [scr.main] = Screen('OpenWindow',scr.scr_num,[],[]); % real mode
end

%Screen('BlendFunction', scr.main, GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
priorityLevel = MaxPriority(scr.main);Priority(priorityLevel);

%% Main part :

HideCursor(scr.main);
expStart = GetSecs;
instructions(scr,const,my_key, textExp.instruction1, button.instruction1);
runTrials(scr,const,expDes,my_key,textExp,button);
expDur = GetSecs - expStart;
disp(expDur);

%% End
instructions(scr,const,my_key, textExp.end, button.end);
overDone;

end