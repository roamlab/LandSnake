%% Parsing Through 

%rosbag info '2021-06-29-11-25-48.bag';
bag=rosbag("2021-06-29-11-25-48.bag"); % load bag from file
topic=select(bag,'Topic','/feedback_angle_topic'); % create topic specific selection
msgStructs = readMessages(topic,'DataFormat','struct'); % convert to structure array for each message

%% Extracting From Structure
enc1 = cellfun(@(m) double(m.EncAngle1),msgStructs);
enc2 = cellfun(@(m) double(m.EncAngle2),msgStructs);
enc3 = cellfun(@(m) double(m.EncAngle3),msgStructs);
ts = cellfun(@(m) int32(m.EncAngle3),msgStructs);

%% Plotting Results

fig = figure
subplot(3,1,1)
scatter(ts,enc1,300,'.','red')
xlim([50,90])
subplot(3,1,2)
scatter(ts,enc2,300,'.','blue')
xlim([50,90])
subplot(3,1,3)
scatter(ts,enc3,300,'.','green')
xlim([50,90])

handle=axes(fig,'visible','off'); 
handle.Title.Visible='on';
handle.XLabel.Visible='on';
handle.YLabel.Visible='on';
ylabel(handle,'Link Encoder Angles (degrees)');
xlabel(handle,'Timestamp (seconds)');
title(handle,'Land Snake External Encoder Feedback');