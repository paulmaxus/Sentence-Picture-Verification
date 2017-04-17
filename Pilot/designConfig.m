function [expDes]=designConfig(const)
% ----------------------------------------------------------------------
% Goal of the function :
% Experimental Design
% ----------------------------------------------------------------------
% Input(s) :
% const
% ----------------------------------------------------------------------
% Output(s):
% expDes is the design object
% ----------------------------------------------------------------------

%% Experimental variables

% Var 1 : Polarity
expDes.oneV =[0;1]';

% Var 2 : Truth value
expDes.twoV = [0;1];

% Var 3 : Adjective position: which attribute is in focus, binary or
% ternary?
expDes.threeV = [0;1];
    %  0 = shape-color
    %  1 = color-shape

% Var 4 : Shape
expDes.fourV = [0;1;2];
    %  0 = circular
    %  1 = rectangular
    %  2 = triangular

% Var 5 : Color
expDes.fiveV = [0;1];
    %  0 = black
    %  1 = white

% Var 6: Relevant object position in the picture
expDes.sixV = [0;1];
    %  0 = left
    %  1 = right

% Var 7: Alternative shape in picture: 2 (depending on Shape variable)
expDes.sevenV = [0;1];
    %  0 = if circle then rectangle, if rectangle then circle, if triangle
    %  then circle
    %  1 = if circle then triangle, if rectangle then triangle, if triangle
    %  then rectangle

% Var 8:    Delay
expDes.eightV = [0;1];

%% Experimental configuration

expDes.var1_list = expDes.oneV;
expDes.nb_var1= numel(expDes.var1_list);

expDes.var2_list = expDes.twoV;
expDes.nb_var2= numel(expDes.var2_list);

expDes.var3_list = expDes.threeV;
expDes.nb_var3= numel(expDes.var3_list);

expDes.var4_list = expDes.fourV;
expDes.nb_var4= numel(expDes.var4_list);

expDes.var5_list = expDes.fiveV;
expDes.nb_var5= numel(expDes.var5_list);

expDes.var6_list = expDes.sixV;
expDes.nb_var6= numel(expDes.var6_list);

expDes.var7_list = expDes.sevenV;
expDes.nb_var7= numel(expDes.var7_list);

expDes.var8_list = expDes.eightV;
expDes.nb_var8= numel(expDes.var8_list);

expDes.nb_var  = 8; % number of variables

% repetition and number of trials
expDes.nb_repeat = 1; % repetition
expDes.nb_trials = expDes.nb_var1 * expDes.nb_var2 * expDes.nb_var3 * expDes.nb_var4 * expDes.nb_var5 * expDes.nb_var6 * expDes.nb_var7 * expDes.nb_var8 * expDes.nb_repeat;

%% Experimental loop
% build design matrix based on the number of trials and the variable so
% that for each trial you know the variable settings
trialMat = zeros((expDes.nb_trials/2),expDes.nb_var);
ii = 0;
for iv1=1:expDes.nb_var1
    for iv2=1:expDes.nb_var2
        for iv3=1:expDes.nb_var3
            for iv4=1:expDes.nb_var4
                for iv5=1:expDes.nb_var5
                    for iv6=1:expDes.nb_var6
                        for iv7=1:expDes.nb_var7
                            %for iv8=1:expDes.nb_var8
                                for rr= 1:expDes.nb_repeat
                                    ii = ii + 1;
                                    trialMat(ii, 1) = iv1-1;
                                    trialMat(ii, 2) = iv2-1;
                                    trialMat(ii, 3) = iv3-1;
                                    trialMat(ii, 4) = iv4-1;
                                    trialMat(ii, 5) = iv5-1;
                                    trialMat(ii, 6) = iv6-1;
                                    trialMat(ii, 7) = iv7-1;
                                    %trialMat(ii, 8) = iv8-1;
                                end
                           %end
                        end
                    end
                end
            end
        end
    end
end

% Randomize trial matrix: Block 1
trialMat1 = trialMat(randperm((expDes.nb_trials/2)),:);
if const.sjct_blockseq == 0
    trialMat1(:,8) = 0; % first block is short delay: easier because of shorter storage in memory
else
    trialMat1(:,8) = 1; % first block is long delay: harder
end

% Randomize trial matrix: Block 2
trialMat2 = trialMat(randperm((expDes.nb_trials/2)),:);
if const.sjct_blockseq == 0
    trialMat2(:,8) = 1; % second block is long delay
else
    trialMat2(:,8) = 0; % second block is short delay
end

% Put both blocks in one matrix
expDes.expMat = [trialMat1; trialMat2];
%csvwrite('trials.csv', expDes.expMat);

%% Practice

expDes.pracNb = 4; % Amount of practice trials

% Pick random trials (half aff, half neg) from trial matrix and keep their indices for practice run

% First block
pracVec1 = []; % trial matrix indices
aff = 1;
neg = 1;

while aff <= ((expDes.pracNb) / 2)
    randT = randi([1 (expDes.nb_trials / 2)]); % random trial number in first half of the trials
    trial = expDes.expMat(randT,:);
    if trial(1) == 1 % check if trial is affirmative
        pracVec1 = [pracVec1,randT];
        aff = aff+1;
    end
end

while neg <= ((expDes.pracNb) / 2)
    randT = randi([1 (expDes.nb_trials / 2)]);
    trial = expDes.expMat(randT,:);
    if trial(1) == 0
        pracVec1 = [pracVec1,randT];
        neg = neg+1;
    end
end

expDes.pracVec1 = pracVec1;

% Second block

pracVec2 = []; % trial matrix indices
aff = 1;
neg = 1;

while aff <= ((expDes.pracNb) / 2)
    randT = randi([((expDes.nb_trials / 2)+1) expDes.nb_trials]); % random trial number in second half of the trials
    trial = expDes.expMat(randT,:);
    if trial(1) == 1 % check if trial is affirmative
        pracVec2 = [pracVec2,randT];
        aff = aff+1;
    end
end

while neg <= ((expDes.pracNb) / 2)
    randT = randi([((expDes.nb_trials / 2)+1) expDes.nb_trials]);
    trial = expDes.expMat(randT,:);
    if trial(1) == 0
        pracVec2 = [pracVec2,randT];
        neg = neg+1;
    end
end

expDes.pracVec2 = pracVec2;

end
