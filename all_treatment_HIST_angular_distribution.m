% importing data
datasets = {ctr004angularVelocity, ctr007angularVelocity, ...
    oa008angularVelocity, oa009angularVelocity, ...
    ser010angularVelocity, ser011angularVelocity};

% assigning groups manually
groups = {'ctr', 'ctr', 'oa', 'oa', 'ser', 'ser'};
labels = {'ctr004', 'ctr007', 'oa008', 'oa009', 'ser010', 'ser011'};

% blue-control, red-octopamine, green-serotonin
group_colors = containers.Map({'ctr', 'oa', 'ser'}, ...
    {[0 0 1], [1 0 0], [0 1 0]});  

% plot
figure;
hold on;

for i = 1:length(datasets)
    data = datasets{i};
    angularVelocity_bin = data{:,1};  % first column: angular velocities
    frequency = data{:,2};            % second column: histogram counts

    color = group_colors(groups{i});
    bar(abs(angularVelocity_bin), frequency, 'FaceColor', color, ... 
        'FaceAlpha', 0.5, 'EdgeColor', 'none', 'DisplayName', labels{i});

    % annotation
    text(angularVelocity_bin(end), frequency(end), labels{i}, 'FontSize', 8, 'Color', color);
end

xlabel('Angular Velocity (s^{-1})');
ylabel('Frequency');
title('Angular Velocity Histogram: Control vs Octopamine vs Serotonin');
legend('show');
grid on;
hold off;
