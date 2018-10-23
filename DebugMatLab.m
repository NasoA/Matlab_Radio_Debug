close all;


count1 = 1;
count2 = 1;
count3 = 1;
count4 = 1;

xPacketTime = 0;

        yAxisRSSI1(1) = 1;
        latency1(1) = 1;
        xCounter1(1) = 1;
        time1(1) = 1;
        
        yAxisRSSI2(1) = 1;
        latency2(1) = 1;
        xCounter2(1) = 1;
        time2(1) = 1;
        
        yAxisRSSI3(1) = 1;
        latency3(1) = 1;
        xCounter3(1) = 1;
        time3(1) = 1;
        
        yAxisRSSI4(1) = 1;
        latency4(1) = 1;
        xCounter4(1) = 1;
        time4(1) = 1;

%inputData = zeros(10,1);


u = udp('', 'LocalHost', '', 'LocalPort', 9001);
u.OutputBufferSize = 1000000;%changed output buffer size to 10kb
u.InputBufferSize = 10000000;
fopen(u);
u.Status;

f1 = figure(1);
f2 = figure(2);

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
        
    case 2
        count2 = count2+1;
        yAxisRSSI2(count2) = str2double(inputData{1,11});
        latency2(count2) = str2double(inputData{1,14});
        time2(count2) = str2double(inputData{1,15});
        xCounter2(count2) = count2;
    case 3
        count3 = count3+1;
        yAxisRSSI3(count3) = str2double(inputData{1,11});
        latency3(count3) = str2double(inputData{1,14});
        time3(count3) = str2double(inputData{1,15});
        xCounter3(count3) = count3;
    case 4
        count4 = count4+1;
        yAxisRSSI4(count4) = str2double(inputData{1,11});
        latency4(count4) = str2double(inputData{1,14});
        time4(count4) = str2double(inputData{1,15});
        xCounter4(count4) = count4;
end





fprintf("\n RSSI 1:%d  RSSI 2:%d  RSSI 3:%d  RSSI 4:%d",yAxisRSSI1(count1),yAxisRSSI2(count2),yAxisRSSI3(count3),yAxisRSSI4(count4));
set(0, 'CurrentFigure', f1)
subplot(2,2,1);
    if(count1<100)
    plot(time1(1:count1),yAxisRSSI1(1:count1),'r');
    else
    plot(time1(count1-99:count1),yAxisRSSI1(count1-99:count1),'r'); 
    end
    title('RSSI Truck #1')
    xlabel('Time')
    ylabel('RSSI (dBm)')
    ylim([-100 -30])
subplot(2,2,2);
    if(count2<100)
    plot(time2(1:count2),yAxisRSSI2(1:count2),'g');
    else
    plot(time2(count2-99:count2),yAxisRSSI2(count2-99:count2),'g'); 
    end
    title('RSSI Truck #2')
    xlabel('Time')
    ylabel('RSSI (dBm)')
    ylim([-100 -30])
subplot(2,2,3);
    if(count3<100)
    plot(time3(1:count3),yAxisRSSI3(1:count3),'b');
    else
    plot(time3(count3-99:count3),yAxisRSSI3(count3-99:count3),'b'); 
    end
    title('RSSI Truck #3')
    xlabel('Time')
    ylabel('RSSI (dBm)')
    ylim([-100 -30])
subplot(2,2,4);
    if(count4<100)
    plot(time4(1:count4),yAxisRSSI4(1:count4),'y');
    else
    plot(time4(count4-99:count4),yAxisRSSI4(count4-99:count4),'y'); 
    end
    title('RSSI Truck #4')
    xlabel('Time')
    ylabel('RSSI (dBm)')
    ylim([-100 -30])
    
drawnow;
set(0, 'CurrentFigure', f2)
subplot(2,2,1);
    if(count1<100)
    plot(xCounter1(1:count1),latency1(1:count1),'r');
    else
    plot(xCounter1(count1-99:count1),latency1(count1-99:count1),'r'); 
    end
    title('Latency')
    xlabel('Time in ms')
    ylabel('Time in ms')
    ylim([1 10])
subplot(2,2,2);
    if(count2<100)
    plot(xCounter2(1:count2),latency2(1:count2),'g');
    else
    plot(xCounter2(count2-99:count2),latency2(count2-99:count2),'g'); 
    end
    title('Latency')
    xlabel('Time in ms')
    ylabel('Time in ms')
    ylim([1 10])
subplot(2,2,3);    
    if(count3<100)
    plot(xCounter3(1:count3),latency3(1:count3),'b');
    else
    plot(xCounter3(count3-99:count3),latency3(count3-99:count3),'b'); 
    end 
    title('Latency')
    xlabel('Time in ms')
    ylabel('Time in ms')
    ylim([1 10])
subplot(2,2,4);    
    if(count4<100)
    plot(xCounter4(1:count4),latency4(1:count4),'y');
    else
    plot(xCounter4(count4-99:count4),latency4(count4-99:count4),'y'); 
    end  
    title('Latency')
    xlabel('Time in ms')
    ylabel('Time in ms')
    ylim([1 10])
    drawnow;
end

fclose(u);
delete(u);
clear u;