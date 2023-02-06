glucose_matrix = [];
insulin_matrix = [];
meal_values = [];
for i = 1:50
   Carbs = 50+100*rand;
   G0 = 120+70*rand;
   cutPoints=[0;30;80;360;400;500;720];
   data = load('C.mat');
   C = data.C;
   [times,gV,gsV,iV, meals] = simulateClosedLoop(G0,Carbs,cutPoints,C);
   figure(1);
   hold on;
   plot(times,gV);
   length(gV)
   length(iV)
   glucose_matrix = [glucose_matrix; gV'];
   insulin_matrix = [insulin_matrix; iV'];
   meal_values = [meal_values;meals'];
end

writematrix(glucose_matrix, 'Glucose_data.csv');
writematrix(insulin_matrix, 'Insulin_data.csv');
writematrix(meal_values, 'meal_data.csv');