%-------------------------- launches the experiment ----------------------------
% Created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

%TODO this is for debug
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebugLevel', 0);
Screen('Preference', 'SuppressAllWarnings', 1);

% Name and mode
%const.expName = 'SPV16';
const.expStart = 1; % real or debug (=0) mode

% Subject configuration :
if const.expStart
    %const.sjct = input(sprintf('\n\tInitials: '),'s');
    const.sjct_age = input(sprintf('\n\tAge: '));
    const.sjct_gender = input(sprintf('\n\tGender (m = 0 or f = 1): '));
    const.sjct_number = input(sprintf('\n\tNumber: '));
else
    %const.sjct = 'Test';
    const.sjct_age = 16;
    const.sjct_gender = 0;
    const.sjct_number = 0; % delay and key
end

% block (delay) sequence and button order
const.sjct_blockseq = mod(const.sjct_number,2); % mod = 0 for even, 1 for odd

% specify data file
const.expRes_fileCsv = sprintf('%u.csv',const.sjct_number);
if const.expStart
    cd ('Data');
    if exist(const.expRes_fileCsv, 'file') == 2
        cd('..');
        error('Subject code already exists');
    end
    cd('..');
end

%% Main experimental code

ListenChar(2); % deactivate input
main(const);
%ListenChar(1); % activate input
