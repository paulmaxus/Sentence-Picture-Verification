%-------------------------- launches the experiment ----------------------------

%TODO this is for debug
Screen('Preference', 'SkipSyncTests', 1);
Screen('Preference', 'VisualDebugLevel', 0);
Screen('Preference', 'SuppressAllWarnings', 1);

% Real or Debug?
const.expStart = input(sprintf('\n\tReal(1) or Debug(0): '));

%-------------------------------------------------------------------------------------
% parallel port configuration
config_io;
global cogent;
if( cogent.io.status ~= 0 )
    error('inp/outp installation failed');
end
% define parallel port address
const.address = hex2dec('DFF8');
% Set parallel port to 0 
outp(const.address, 0);
%-------------------------------------------------------------------------------------

% Name and mode
%const.expName = 'SPV16';
%const.expStart = 0; % real or debug (=0) mode

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
const.sjct_blockseq = 0; % mod = 0 for even, 1 for odd

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
try
main(const);
catch ME
    display(ME);
    Screen('CloseAll');
end
%ListenChar(1); % activate input