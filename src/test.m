clear all
close all

source "pmc.m";
load "usps_napp10.dat";

Ya= change_Y_discri(yapp);
Yt= change_Y_discri(ytest);

clf;
hold on;

epsi=0.01;
Results_Epsi01=[]
no_exp=1;

for ncc = 5:10:20

temp=zeros(1,4);

Nccs = {ncc};
[TEA,TET, pmc]= apprend_pmc(xapp,Ya,xtest,Yt,epsi,Nccs)
plot(TEA,'-');
plot(TET,'+');

L=length(TEA);
temp(1)=TEA(L);
temp(2)=TET(L);

ErrRateApp =test_classif_pmc(xapp,Ya,pmc); % c est en fait un taux de reco, cf pmc.txt

ErrRateTest =test_classif_pmc(xtest,Yt,pmc);
temp(3)=ErrRateApp ;
temp(4)=ErrRateTest ;

Results_Epsi01 = [Results_Epsi01; temp ]
no_exp++;
end




epsi=0.001;
Results_Epsi001=[];
no_exp=1;


for ncc = 5:10:20

temp=zeros(1,4);
Nccs = {ncc};
[TEA,TET, pmc]= apprend_pmc(xapp,Ya,xtest,Yt,epsi,Nccs)
plot(TEA,'-');
plot(TET,'+');

L=length(TEA);
temp(1)=TEA(L);
temp(2)=TET(L);

ErrRateApp =test_classif_pmc(xapp,Ya,pmc);
ErrRateTest =test_classif_pmc(xtest,Yt,pmc);
temp(3)=ErrRateApp ;
temp(4)=ErrRateTest ;

Results_Epsi001 = [Results_Epsi001; temp ]

no_exp++;
end
