function [textExp,button] = instructionConfig(const)
% ----------------------------------------------------------------------
% Goal of the function :
% Write text of calibration and general instruction for the experiment.
% ----------------------------------------------------------------------
% Input(s) :
% (none)
% ----------------------------------------------------------------------
% Output(s):
% textExp : struct containing all text of general instructions.
% button : struct containing all button instructions.
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Project : Yeshurun98
% Edited by Maximillian Paulus
% ----------------------------------------------------------------------

%% Pause:
pause_l1 = 'Pausa.';
pause_b1 = '-------------- Premi la barra spaziatrice per continuare l''esperimento --------------';

textExp.pause = {pause_l1};
button.pause = {pause_b1};

%% Pause after practice:
pracover_l1 = 'Pronto?';
pracover_b1 = '-------------- Premi la barra spaziatrice per cominciare l''esperimento --------------';

textExp.pracover = {pracover_l1};
button.pracover = {pracover_b1};

%% Pause after block (change to difficult):
blockover0_l1 = 'La prima parte � finita.';
blockover0_l2 = 'Ci sar� un''altro esercizio prima della seconda parte.';
blockover0_b1 = '-------------- Premi la barra spaziatrice per cominciare l''esercizio --------------';

textExp.blockover0 = {blockover0_l1;blockover0_l2};
button.blockover0 = {blockover0_b1};

%% Pause after block (change to easy):
blockover1_l1 = 'La prima parte � finita.';
blockover1_l2 = 'Ci sar� un''altro esercizio prima della seconda parte.';
blockover1_b1 = '-------------- Premi la barra spaziatrice per cominciare l''esercizio --------------';

textExp.blockover1 = {blockover1_l1;blockover1_l2};
button.blockover1 = {blockover1_b1};


%% End :
end_l1 = 'Fine.';
end_b1 = '-------------- Informa l''esperimentatore --------------';

textExp.end = {end_l1};
button.end =  {end_b1};

%% Main instruction :

instruction_l1  =  'Il tuo compito sar� quello di leggere delle frasi.';
instruction_l2  =  'Successivamente ti verr� presentata un''immagine che potr� corrispondere';
instruction_l3  =  'o meno a quanto letto precedentemente.';
instruction_l4  =  '';
if const.sjct_blockseq == 0
    % up is matching
    instruction_l5  =  'Dovrai premere lo FRECCIA SU se la frase e l''immagine corrispondono,';
    instruction_l6  =  'o lo FRECCIA GIU se NON corrispondono.';
else
    % down is matching
    instruction_l5  =  'Dovrai premere lo FRECCIA GIU se la frase e l''immagine corrispondono,';
    instruction_l6  =  'o lo FRECCIA SU se NON corrispondono.';
end
instruction_l7  =  '';
instruction_l8  =  'Le figure potranno essere: cerchi, triangoli o rettangoli.';
instruction_l9  =  'Saranno colorate di bianco o di nero.';

instruction_b1 = '-------------- Premi la barra spaziatrice per cominciare l''esercizio --------------';

textExp.instruction1= {instruction_l1;instruction_l2;instruction_l3;instruction_l4;instruction_l5; instruction_l6; instruction_l7; instruction_l8; instruction_l9};
button.instruction1 =  {instruction_b1};

end
