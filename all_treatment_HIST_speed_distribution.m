% importing data and assigning groups manually
datasets = {ctr004speed, ctr007speed, oa008speed, oa009speed, ser010speed, ser011speed};
groups = {'ctr', 'ctr', 'oa', 'oa', 'ser', 'ser'};
labels = {'ctr004', 'ctr007', 'oa008', 'oa009', 'ser010', 'ser011'};
group_colors = containers.Map({'ctr', 'oa', 'ser'}, ...
    {[0 0 1], [1 0 0], [0 0.5 0]});  
% blue-control, red-octopamine, green-serotonin

% plot
figure;
hold on;

for i = 1:length(datasets)
    data = datasets{i};
    speed_bin = data{:,1};     % first column: speed bins
    frequency = data{:,2};     % second column: histogram counts

    color = group_colors(groups{i});
    bar(speed_bin, frequency, 'FaceColor', color, ... 
        'FaceAlpha', 0.4, 'EdgeColor', 'none', 'DisplayName', labels{i});

    % annotation
    text(speed_bin(end), frequency(end), labels{i}, 'FontSize', 8, 'Color', color);
end

xlabel('Speed (μm/s)');
ylabel('Frequency');
title('Speed Histogram: Control vs Octopamine vs Serotonin');
legend('show');
grid on;
hold off;
