
hold on;
close all;
opengl software

count1 = 1;
count2 = 1;
count3 = 1;
count4 = 1;

xPacketTime = 0;

globalCount = 1;


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


u = udp('', 'LocalHost', '', 'LocalPort', 9001);
set(u,'DatagramTerminateMode','on', ...
      'InputBufferSize', 2^7, ...
      'Timeout',0.01); 
fopen(u);

figure(1);
    while 1
        globalCount = globalCount +1;
        data = fscanf(u,'%s');
        inputData = strsplit(data,',');
        truckId = str2double(inputData{1,2});

        switch truckId
            case 1
                count1 = count1+1;
                yAxisRSSI1(count1) = str2double(inputData{1,11});
                latency1(count1) = str2double(inputData{1,14});
                time1(count1) = str2double(inputData{1,15});
                if(mod(count1,20) == 0)
                    if(count1<20)
                        %RSSI Graph Below, Truck #1
                        subplot(5,2,1);
                        plot(time1(1:count1),yAxisRSSI1(1:count1),'r');
                        title('RSSI Truck #1')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #1
                        subplot(5,2,2);
                        plot(time1(1:count1),latency1(1:count1),'r');
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10]) 
                    else
                        %RSSI Graph Below, Truck #1
                        subplot(5,2,1);
                        plot(time1(count1-19:count1),yAxisRSSI1(count1-19:count1),'r');
                        title('RSSI Truck #1')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #1
                        subplot(5,2,2);
                        plot(time1(count1-19:count1),latency1(count1-19:count1),'r'); 
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10]) 
                    end
                end
            case 2
                count2 = count2+1;
                yAxisRSSI2(count2) = str2double(inputData{1,11});
                latency2(count2) =  str2double(inputData{1,14});
                time2(count2) = str2double(inputData{1,15});
                if(mod(count2,20) == 0)
                    if(count2<20)
                        %RSSI Graph Below, Truck #2
                        subplot(5,2,3);
                        plot(time2(1:count2),yAxisRSSI2(1:count2),'g');
                        title('RSSI Truck #2')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #2
                        subplot(5,2,4);
                        plot(time2(1:count2),latency2(1:count2),'g');
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10])
                    else
                        %RSSI Graph Below, Truck #2
                        subplot(5,2,3);
                        plot(time2(count2-19:count2),yAxisRSSI2(count2-19:count2),'g'); 
                        title('RSSI Truck #2')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #2
                        subplot(5,2,4);
                        plot(time2(count2-19:count2),latency2(count2-19:count2),'g'); 
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10])
                    end
                end
            case 3
                count3 = count3+1;
                yAxisRSSI3(count3) = str2double(inputData{1,11});
                latency3(count3) = str2double(inputData{1,14});
                time3(count3) = str2double(inputData{1,15});
                if(mod(count3,20) == 0)
                    if(count3<20)
                        %RSSI Graph Below, Truck #3
                        subplot(5,2,5);
                        plot(time3(1:count3),yAxisRSSI3(1:count3),'b');
                        title('RSSI Truck #3')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #3
                        subplot(5,2,6);
                        plot(time3(1:count3),latency3(1:count3),'b');
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10])
                    else
                        %RSSI Graph Below, Truck #3
                        subplot(5,2,5);
                        plot(time3(count3-9:count3),yAxisRSSI3(count3-9:count3),'b'); 
                        title('RSSI Truck #3')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #3
                        subplot(5,2,6);
                        plot(time3(count3-19:count3),latency3(count3-19:count3),'b'); 
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10])
                    end
                end
            case 4
                count4 = count4+1;
                yAxisRSSI4(count4) = str2double(inputData{1,11});
                latency4(count4) = str2double(inputData{1,14});
                time4(count4) = str2double(inputData{1,15});
                if(mod(count4,20) == 0)
                    if(count4<20)
                        %RSSI Graph Below, Truck #4
                        subplot(5,2,7);
                        plot(time4(1:count4),yAxisRSSI4(1:count4),'y');
                        title('RSSI Truck #4')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #4
                        subplot(5,2,8);
                        plot(time4(1:count4),latency4(1:count4),'y');
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10])
                    else
                        %RSSI Graph Below, Truck #4
                        subplot(5,2,7);
                        plot(time4(count4-19:count4),yAxisRSSI4(count4-19:count4),'y'); 
                        title('RSSI Truck #4')
                        xlabel('Time')
                        ylabel('RSSI (dBm)')
                        ylim([-100 -20])
                        %Latency Graph Below, Truck #4
                        subplot(5,2,8);
                        plot(time4(count4-19:count4),latency4(count4-19:count4),'y'); 
                        title('Latency')
                        xlabel('Time')
                        ylabel('Time (ms)')
                        ylim([1 10])
                    end
                end
        end
        drawnow limitrate
        flushinput(u);
        if(globalCount == 11)
            fprintf("\n RSSI 1:%d  Latency 1:%.2f  RSSI 2:%d  Latency 2:%.2f  RSSI 3:%d  Latency 3:%.2f  RSSI 4:%d Latency 4:%.2f",yAxisRSSI1(count1),latency1(count1),yAxisRSSI2(count2),latency2(count2),yAxisRSSI3(count3),latency3(count3),yAxisRSSI4(count4),latency4(count4));
            globalCount = 1;
        end
    end
%%
fclose(u);
delete(u);
clear u;