% generate_raw_iot_transactions.m
% Simulate raw transactions from IoT devices in an ultra-dense smart healthcare network

numTransactions = 100000;
maliciousRatio = 0.15;
numMalicious = round(numTransactions * maliciousRatio);
numValid = numTransactions - numMalicious;

% Features:
% F1: Transaction ID
% F2: Device ID (1 to 5000)
% F3: Transaction Type (1: Vitals, 2: Status, 3: Alert, 4: Prescription)
% F4: Timestamp
% F5: Packet Size (bytes)
% F6: Response Time (ms)
% F7: Energy Used (mJ)
% F8: Device Uptime (%)
% Label: "valid" or "malicious" (for supervised model training/testing)

deviceIDs = randi([1, 5000], numTransactions, 1);
transactionTypes = randi([1, 4], numTransactions, 1);
timestamps = datetime('now') + seconds(randi([0, 86400], numTransactions, 1));

features = zeros(numTransactions, 5);  % To hold: PacketSize, ResponseTime, EnergyUsed, Uptime
labels = strings(numTransactions, 1);

% Generate valid transactions
for i = 1:numValid
    pktSize = randi([50, 600]);
    respTime = randi([10, 80]);
    energy = rand() * 1.8 + 0.2;
    uptime = randi([95, 100]);

    features(i,:) = [pktSize, respTime, energy, uptime, transactionTypes(i)];
    labels(i) = "valid";
end

% Generate malicious transactions
for i = (numValid+1):numTransactions
    pktSize = randi([600, 1200]);
    respTime = randi([81, 400]);
    energy = rand() * 5.9 + 2.1;
    uptime = randi([20, 90]);

    features(i,:) = [pktSize, respTime, energy, uptime, transactionTypes(i)];
    labels(i) = "malicious";
end

% Build table
dataset = table((1:numTransactions)', deviceIDs, timestamps, ...
    features(:,5), features(:,1), features(:,2), features(:,3), features(:,4), labels, ...
    'VariableNames', {'TxID', 'DeviceID', 'Timestamp', 'Type', 'PacketSize', ...
    'ResponseTime', 'EnergyUsed', 'Uptime', 'Label'});

% Save
writetable(dataset, 'raw_iot_transactions.csv');
disp("Raw IoT Transaction Dataset saved as 'raw_iot_transactions.csv'.");
