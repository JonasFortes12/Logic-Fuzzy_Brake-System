function PlotCentroid = plotCentroid(areaFreeAndAplyBrake, brakeFree, brakeAply, Cx, Cy)
    % Plota a área resultante para desfuzificação
    figure;
    plot(areaFreeAndAplyBrake, 'FaceColor', [0.3, 0.3, 0.3], 'EdgeColor', 'none');
    hold on
    
    % Plot das delimitações em 'aplicar freio' e 'liberar freio'
    plot([0, 100], [brakeAply, brakeAply], '--r', 'LineWidth', 1); % Linha tracejada vermelha para aplicar freio
    plot([0, 100], [brakeFree, brakeFree], '--b', 'LineWidth', 1); % Linha tracejada azul para liberar freio
    
    % Plot da linha vertical no centroide
    plot([Cx, Cx], [0, Cy], '--m', 'LineWidth', 1); % Linha tracejada verde para a centróide
    
    % Plot do ponto do centroide como um círculo
    scatter(Cx, Cy, 100, [0.5, 0, 0.5], 'filled', 'o'); % Ponto roxo como centróide
    % Crie a descrição com o valor x da centróide
    description = sprintf('Centróide da Área: (x=%.2f)', Cx);
    % Adicione a descrição como texto
    text(Cx, Cy+0.02, description, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom', 'Color', [0.5, 0, 0.5], 'FontWeight', 'bold');
    
    
    hold off
    title('Área resultante (Defuzzification)');
    
    % Defina os limites do eixo x e y
    xlim([0 100])
    ylim([0 1])
    
    % Adicione rótulos aos eixos
    xlabel('Pressão na pastilha de freio')
    ylabel('Pertinências de saída')
    
    % Adicione legendas
    legend('Área de Interseção ', 'Pertinência em Apertar Freio', 'Pertinência em Liberar Freio', 'Centro de Gravidade da Área')

end
