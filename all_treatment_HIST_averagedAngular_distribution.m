% defining a common bin grid
common_bins = linspace(0, 4, 100); % from 0 to 120 s^(-1), 100 bins

% we interpolate the date points for each group to find common bins:

% control group:
freq_ctr1 = interp1(ctr004angularVelocity{:,1}, ctr004angularVelocity{:,2}, common_bins, 'linear', 0);
freq_ctr2 = interp1(ctr007angularVelocity{:,1}, ctr007angularVelocity{:,2}, common_bins, 'linear', 0);
ctr_avg_freq = (freq_ctr1 + freq_ctr2) / 2;
% octopamine group:
freq_oa1 = interp1(oa008angularVelocity{:,1}, oa008angularVelocity{:,2}, common_bins, 'linear', 0);
freq_oa2 = interp1(oa009angularVelocity{:,1}, oa009angularVelocity{:,2}, common_bins, 'linear', 0);
oa_avg_freq = (freq_oa1 + freq_oa2) / 2;
% serotonin group:
freq_ser1 = interp1(ser010angularVelocity{:,1}, ser010angularVelocity{:,2}, common_bins, 'linear', 0);
freq_ser2 = interp1(ser011angularVelocity{:,1}, ser011angularVelocity{:,2}, common_bins, 'linear', 0);
ser_avg_freq = (freq_ser1 + freq_ser2) / 2;

% plot
figure;
hold on;

% control-blue, octopamine-red, serotonin-greem
bar(common_bins, ctr_avg_freq, 'FaceColor', [0 0 1], ... 
    'FaceAlpha', 0.5, 'EdgeColor', 'none', 'DisplayName', 'Control');
bar(common_bins, oa_avg_freq, 'FaceColor', [1 0 0], ... 
    'FaceAlpha', 0.5, 'EdgeColor', 'none', 'DisplayName', 'Octopamine');
bar(common_bins, ser_avg_freq, 'FaceColor', [0 1 0], ... 
    'FaceAlpha', 0.5, 'EdgeColor', 'none', 'DisplayName', 'Serotonin');

xlabel('Angular Velocity (s^{-1})');
ylabel('Averaged Frequency');
title('Averaged Angular Velocity Histogram by Group (Interpolated)');
legend('show');
grid on;
hold off;





