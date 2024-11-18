%% This MATLAB script simulate the A/D of a sine wave.
%% Input signal
clf
fo=1000;                         % continuous time input signal frequency
To=1/fo;                         % input signal period
Tmax=4*To;                       % maximum time to display signal
A=6;                             % input signal amplitude in Volts
tc=linspace(0,4*To,200);         % time array to plot input signal
x=A*sin(2*pi*fo*tc);             % continuous time input signal

%% Sampling frequency, sampling instants and discrete time signal
Fs=5000;                        % sampling rate  
Ts=1/Fs;                         % sampling interval
t=0:Ts:4*To;                     % time array with sampling instants
N=length(t);                     % number of samples
n=0:N-1;                         % index for the discrete time signal
xn=A*sin(2*pi*fo/Fs*n);          % discrete time signal x[n]          


%% Analog to digital Convertor 
Vmin=-10;
Vmax=10;
VFS=Vmax-Vmin;            % Full Scale range
nb=3;                     % number of bits
L=2^nb;                   % number of quantization levels
delta =VFS/L;             % system resolution
k=1:L;                    % vector of quantization level indices
k=k';                     % convert to column vector

% Computing lower bounds of quantization intervals (ranges), lowest bound
% starts at Vmin
X_R=Vmin+(k-1)*delta;

% Computing Quantization levels
q_Level=X_R+delta/2 ;

% Creating a cell array of quantization levels labels
Labels=repmat('QL ', L,1);
Labels=[Labels  num2str(k)];
Labels=cellstr(Labels);

%% Quantization
% Computing the quantized signal, if the signal is lower than vmin, the 
% lowest quantization level is assigned, if the signal is larger than Vmax,
% the highest quantization level is assigned. Otherwise the signal is
% compared to the lowest bound of all quantiztaion levels, if the signal is
% higher than the kth bound, but lower than the (k+1)th bound,the Comp_Ind 
% vector will have k ones and (L-K) zeros, the index of the corresponding 
% quantization level is  obtained as the number of ones in the vector 
% Comp_ind

xq=zeros(1,N);                  % initialzing the quantized signal
for n1=1:N          
  xs=A*sin(2*pi*fo/Fs*(n1-1));  % sample value
  if (xs<Vmin) 
      xq(n1)=q_Level(1);        % assign to lowest quantization Level
  elseif (xs>=Vmax) 
      xq(n1)=q_Level(end);      % assign to highest quantization Level
  else
     Comp_Ind=xs >= X_R;        % compare sample value to quantization range bounds,
                                % to find index of the corresponding quantization level
     index=nnz(Comp_Ind);       % count number of ones
     xq(n1)=q_Level(index);
  end
end

%% Plotting the results

% Ploting the quantization Levels, the continuous time signal x(t), the 
% discrete time signal x[n] and the quantized signal xq[n]
figure(1)
hold on;
h=zeros(1,3);
h(1) =plot(tc*1000,x,'LineWidth',1.2');       % Time is displayed in ms;
h(2)=stem(t*1000,xn,'fill','LineWidth',1.2'); % Time is displayed in ms;
h(3)=stairs(t*1000,xq,'LineWidth',1.2,'color', [ 0.4, 0.65,0.15]);

% Ploting horizontal lines for the quantization levels, do not display
% labels for the levels if the number of levels is larger than 16
if (L<=16)
 yline(q_Level,'-.b',Labels,'color', [ 0.8, 0.3,0.1]);
else 
 yline(q_Level,'-.b','color', [ 0.8, 0.3,0.1]);
end

% Ploting horizontal lines for the qunatization intervals lower bounds
 yline(X_R,':b','color', [ 0, 0.45,0.65]);
% plotting upper bound for the highest interval
 yline(X_R(end)+delta,':b','color', [ 0, 0.45,0.65]);
 
% Adding axis labels and legend 
legend(h(1:3), {'x(t)','x[n]','x_q[n]'},'location','northwest');
xlabel('Time in ms ')
ylabel('Signal Amplitude (V)')
xlim([ 0 1.25*Tmax*1000]);
ylim([ 1.1*Vmin 1.1*Vmax]);
set(gcf,'color','w')