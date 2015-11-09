clear all
close all

source "pmc.m";
source "myFunctions.m";
load "usps_napp10.dat";

tmp = yapp;
yapp = ytest;
ytest = tmp;

tmp = xapp;
xapp = xtest;
xtest = tmp;

Ya=change_Y_discri(yapp);
Yt=change_Y_discri(ytest);
%Add normalisation functions

[xapp, yapp, Ya] = shakeTable(xapp, yapp, Ya);

% Learning
%Taux Erreur Apprentissage
%Taux Erreur en Test
%(10,10) 2 layers of 10 neurones eacb
[TEA, TET, pmc]=apprend_pmc(xapp,Ya,xtest,Yt,0.01,{10,10});

%Taux de succès
SuccessRateApp = test_classif_pmc(xapp,Ya,pmc);
SuccessRateTest = test_classif_pmc(xtest,Yt,pmc);

printf("Learning success : %f\nTest success : %f\n", SuccessRateApp, SuccessRateTest);
