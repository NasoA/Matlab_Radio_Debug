hold on;
close all;
%opengl software

count1 = 1;
count2 = 1;
count3 = 1;
count4 = 1;

xPacketTime = 0;


inputData = zeros(15,1);

yAxisRSSI1 = zeros(50000,1);
yAxisRSSI2 = zeros(50000,1);
yAxisRSSI3 = zeros(50000,1);
yAxisRSSI4 = zeros(50000,1);

latency1 = zeros(50000,1);
latency2 = zeros(50000,1);
latency3 = zeros(50000,1);
latency4 = zeros(50000,1);

time1 = zeros(50000,1);
time2 = zeros(50000,1);
time3 = zeros(50000,1);
time4 = zeros(50000,1);

xCounter1 = zeros(50000,1);
xCounter2 = zeros(50000,1);
xCounter3 = zeros(50000,1);
xCounter4 = zeros(50000,1);


u = udp('', 'LocalHost', '', 'LocalPort', 9001);
set(u,'DatagramTerminateMode','on', ...
      'InputBufferSize', 2^7, ...
      'Timeout',0.01); 
fopen(u);



%f1 = figure(1);
%f2 = figure(2);

figure(1);
while 1

data = fscanf(u,'%s');

inputData = strsplit(data,',');



truckId = str2double(inputData{1,2});
switch truckId
   
    case 1
        count1 = count1+1;
        yAxisRSSI1(count1) = str2double(inputData{1,11});
        latency1(count1) = str2double(inputData{1,14});
        time1(count1) = str2double(inputData{1,15});
        xCounter1(count1) = count1;

        if(count1<10)
           % set(0, 'CurrentFigure', f1)
            subplot(5,2,1);
            plot(time1(1:count1),yAxisRSSI1(1:count1),'r');
            title('RSSI Truck #1')
            xlabel('Time')
            ylabel('RSSI (dBm)')
            ylim([-100 0])
          %  set(0, 'CurrentFigure', f2)
            subplot(5,2,2);
            plot(time1(1:count1),latency1(1:count1),'r');
            title('Latency')
            xlabel('Time')
            ylabel('Time (ms)')
            ylim([1 10]) 
        else
            %set(0, 'CurrentFigure', f1)
            subplot(5,2,1);
            plot(time1(count1-9:count1),yAxisRSSI1(count1-9:count1),'r');
            title('RSSI Truck #1')
            xlabel('Time')
            ylabel('RSSI (dBm)')
            ylim([-100 0])
         %   set(0, 'CurrentFigure', f2)
            subplot(5,2,2);
            plot(time1(count1-9:count1),latency1(count1-9:count1),'r'); 
            title('Latency')
            xlabel('Time')
            ylabel('Time (ms)')
            ylim([1 10]) 
        end

    case 2
        count2 = count2+1;
        yAxisRSSI2(count2) = str2double(inputData{1,11});
        latency2(count2) = str2double(inputData{1,14});
        time2(count2) = str2double(inputData{1,15});
        xCounter2(count2) = count2;
        if(count2<10)
       % set(0, 'CurrentFigure', f1)
        subplot(5,2,3);
        plot(time2(1:count2),yAxisRSSI2(1:count2),'g');
        title('RSSI Truck #2')
        xlabel('Time')
        ylabel('RSSI (dBm)')
        ylim([-100 0])
       % set(0, 'CurrentFigure', f2)
        subplot(5,2,4);
        plot(time2(1:count2),latency2(1:count2),'g');
        title('Latency')
        xlabel('Time')
        ylabel('Time (ms)')
        ylim([1 10])
        else
           % set(0, 'CurrentFigure', f1)
            subplot(5,2,3);
            plot(time2(count2-9:count2),yAxisRSSI2(count2-9:count2),'g'); 
            title('RSSI Truck #2')
            xlabel('Time')
            ylabel('RSSI (dBm)')
            ylim([-100 0])
      %              set(0, 'CurrentFigure', f2)
        subplot(5,2,4);
         plot(time2(count2-9:count2),latency2(count2-9:count2),'g'); 
        title('Latency')
        xlabel('Time')
        ylabel('Time (ms)')
        ylim([1 10])
        
        end


    case 3
        count3 = count3+1;
        yAxisRSSI3(count3) = str2double(inputData{1,11});
        latency3(count3) = str2double(inputData{1,14});
        time3(count3) = str2double(inputData{1,15});
        xCounter3(count3) = count3;
        %set(0, 'CurrentFigure', f1)
        subplot(2,2,3);
        if(count3<10)
            plot(time3(1:count3),yAxisRSSI3(1:count3),'b');
        else
            plot(time3(count3-9:count3),yAxisRSSI3(count3-9:count3),'b'); 
        end
            title('RSSI Truck #3')
            xlabel('Time')
            ylabel('RSSI (dBm)')
            ylim([-100 0])
            
            %   set(0, 'CurrentFigure', f2)

    case 4
        count4 = count4+1;
        yAxisRSSI4(count4) = str2double(inputData{1,11});
        latency4(count4) = str2double(inputData{1,14});
        time4(count4) = str2double(inputData{1,15});
        xCounter4(count4) = count4;
        
        set(0, 'CurrentFigure', f1)
        subplot(2,2,4);
        if(count4<10)
            plot(time4(1:count4),yAxisRSSI4(1:count4),'y');
        else
           plot(time4(count4-9:count4),yAxisRSSI4(count4-9:count4),'y'); 
        end
        title('RSSI Truck #4')
        xlabel('Time')
        ylabel('RSSI (dBm)')
        ylim([-100 0])
        
       %     set(0, 'CurrentFigure', f2)

end

drawnow limitrate
flushinput(u);



fprintf("\n RSSI 1:%d  RSSI 2:%d  RSSI 3:%d  RSSI 4:%d",yAxisRSSI1(count1),yAxisRSSI2(count2),yAxisRSSI3(count3),yAxisRSSI4(count4));


end
%%
fclose(u);
delete(u);
clear u;