function [my_key]=keyConfig
% ----------------------------------------------------------------------
% Goal of the function :
% Define keys
% ----------------------------------------------------------------------
% Input(s) :
% (none)
% ----------------------------------------------------------------------
% Output(s):
% my_key contains fields for key assignments
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

% clears any previous button press
FlushEvents('KeyDown');
% gives similar values to each key for any OS
KbName('UnifyKeyNames');
% assigns shift keys for left and right
my_key.up = KbName('UpArrow');
my_key.down = KbName('DownArrow');
% my_key.rightShift = KbName('RightShift');
% my_key.leftShift = KbName('LeftShift');

% keys for continue and exit
my_key.space = KbName('Space');
my_key.escape = KbName('Escape');

end
