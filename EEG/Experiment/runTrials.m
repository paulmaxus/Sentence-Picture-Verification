function runTrials(scr,const,expDes,my_key,textExp,button)
% ----------------------------------------------------------------------
% Goal of the function :
% run all trials
% ----------------------------------------------------------------------
% Input(s) :
% scr,const,expDes,my_key,textExp,button
% ----------------------------------------------------------------------
% Output(s):
% none
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

%% Create the result matrix
expResMat = zeros(expDes.nb_trials, (expDes.nb_var + 12)); % + sentence code, picture code, response code, button, RT, age, gender,
% relevant/alternative object position vector (6 in total)

%% Block 1

% Practice run

for p = 1:expDes.pracNb
    pracT = expDes.pracVec1(p); % trial matrix index calculated for practice run
    runSingleTrialPractice(scr,const,expDes,my_key,pracT);
end

% Pause before experimental run
instructions(scr,const,my_key, textExp.pracover, button.pracover);

% Experimental run

for t = 1:(expDes.nb_trials)
    [resMat,relpos,altpos] = runSingleTrial(scr,const,expDes,my_key,t);
    % save information about current trial t (from experimental design) and the results for trial t (button + RT)
    expResMat(t,:)= [expDes.expMat(t,:),resMat,const.sjct_age,const.sjct_gender,...
        relpos(1), relpos(2), relpos(3), altpos(1), altpos(2), altpos(3)];

    cd ('Data');
    csvwrite(const.expRes_fileCsv, expResMat); % save results for subject in Data folder
    cd ('..');

    % Finish experiment after all trials have been run
    if t == (expDes.nb_trials)
        break;
    end

    % Pause? Or middle?
    if t == (expDes.nb_trials/2)
        instructions(scr,const,my_key, textExp.blockover0, button.blockover0);
    elseif mod(t,const.breakafter) == 0
        instructions(scr,const,my_key, textExp.pause, button.pause);
    end

end

%% Save results

cd ('Data');
csvwrite(const.expRes_fileCsv, expResMat); % save results for subject in Data folder
cd ('..');

end
