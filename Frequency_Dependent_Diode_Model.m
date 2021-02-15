% Defining Variables
fre=[5E7:1E7:2E11]; % frequency
Cj=1./(7.693E12*log10(fre)-5.717E13); % junction capacitance Cj from fitting
Cj(9997:19996)=Cj(9996); % set Cj to be constant above some frequency
Rj=6000*(1+0.8*log10(fre)/11); % junction resistance Rj
Rj(9997:19996)=Rj(9996); % set Rj to be constant above some frequency
Rc=39 % Contact resistance Rc
Rs=Rc+11000*((1-log10(fre)/11).^2); % sum of contact resistance and undepleted semiconductor resistance
Rs(9997:19996)=Rs(9996); % set Rs to be constant above some frequency
Zr2=Rs + Rj./(1+(2*pi*fre.*Cj.*Rj).^2); % Total resistance
Zi2=-(Rj.^2).*2.*pi.*fre.*Cj./(1+(2*pi*fre.*Cj.*Rj).^2); % Total reactance

% Plot
loglog(fre,Zr2);
hold on;
loglog(fre, -Zi2);

xlim([1E8 2E11]);
ylim([0 20000])