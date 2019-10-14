clear all
% Reading the file with missing data as input
% [fname,fpath] = uigetfile({'*.xlsx';'.csv'},'Select the missing data in the incomplete dataset');
% if fpath==0
%     error('no file selected');
% end

%[missing_data,missing_txt] = xlsread( fullfile(fpath,fname));
[n, t, d] = xlsread('G:\Data Mining\Datasets\Incomplete+Datasets\HOV\planned 3.xlsx');
[nSamples, nFeatures] = size(d);
tmp_d = d;

%%% NaN makes mess. So replace NaN as 'NaN'
%nan_loc = cellfun(@isnan, cellstr(d), 'UniformOuput', false)% matlab 16
nan_loc = cellfun(@(V) any(isnan(V(:))), d);
tmp_d(nan_loc) = {'NaN'};

ex2 = cellfun(@ex_func, tmp_d, 'UniformOutput', 0);

tmp_d = ex2;


for s_id=1:nSamples
    if s_id == 1
        dd = tmp_d(s_id,:);
    end
    if s_id >1
        dd = horzcat(dd, tmp_d(s_id,:));
    end
    
end
tt_n = grp2idx(cellstr(dd));

ttn = vec2mat(tt_n, nFeatures);
ttn(nan_loc) = nan;

%%%% - the clean data after categorical to numarical
data= ttn;

% [V1,population_size,nog1,pool1,da1] = solution_pool_fun(data);
% p0 = population_initialization(population_size,pool1,nog1);
% D0 = imputation_fun(p0,pool1,V1);
% NRMS = objective_fun(D0,da1);
% p0 = non_domination_sort_mod(p0,NRMS,V1);
% generation = 1;
% while (generation<6)
%     pooll = round(population_size);
%     tournament = 2;
%     P = tournament_selection(p0,pooll ,tournament);
%     mu = 20;
%     mum = 20;
%     Q = genetic_operator(P, V1,population_size, mu, mum, nog1);
%     D = imputation_fun(Q,pool1,V1);
%     NRMS1 = objective_fun(D,da1);
%     Q = [Q,NRMS1];
%     Q = non_domination_sort_mod(Q,NRMS1,V1);
%     R = [P;Q];
%     P = survivor_selection(R,V1,population_size);
%     P2 = P;
%     generation = generation+1;
% end
% F=Pareto_front(P2,pool1,data);
%
% % imputed_data = imputation_fun(F,pool1,V1);
% C = unique(double(imputed_data));
% tt = d;
% for c_id=1:size(C)
%
%     all_ids = find(imputed_data == C(c_id));
%     for ii=1:size(all_ids)
%             category = d(all_ids(ii));
%             nan_loc = cellfun(@(V) any(isnan(V(:))), category);
%             if ~nan_loc
%                 break;
%             end
%     end
%
%     dd(all_ids) = category;
%     clear all_ids
%     clear category
% end

% xlswrite(strcat('', fname),dd);
% xlswrite(strcat('imputed_', fname),dd);
train_data = data(1:size(d,1),:);
y = data (:, end);

size(y);
[dataRow, dataCol] = size(train_data);
somRow =10;
somCol =10;
Iteration = 5;
width_Initial = 1;
t_width = Iteration/log(width_Initial);
learningRate_Initial = 1;
t_learningRate = Iteration;
fprintf('\nInitializing The Weight Of Neurons Randomly ...\n')
somMap = randInitializeWeights(somRow,somCol,dataCol);
% plotData(train_data, y);
%         hold on;
for t = 1:Iteration
    width = width_Initial*exp(-t/t_width);
    width_Variance = width^2;
    learningRate = learningRate_Initial*exp(-t/t_learningRate);
    if learningRate <1
        learningRate = 0.5;
    end
    
    [euclideanDist, index] = findBestMatch( train_data, somMap, somRow, ...
        somCol, dataRow, dataCol );
    [minM,ind] = min(euclideanDist(:));
    [win_Row,win_Col] = ind2sub(size(euclideanDist),ind);
    neighborhood = computeNeighbourhood( somRow, somCol, win_Row, ...
        win_Col, width_Variance);
    somMap = updateWeight( train_data, somMap, somRow, somCol, ...
        dataCol, index, learningRate, neighborhood);
    dot = zeros(somRow*somCol, dataCol);
    matrix = zeros(somRow*somCol,1);
    matrix_old = zeros(somRow*somCol,1);
    ind = 1;
    hold on;
    f1 = figure(1);
    set(f1,'name',strcat('Iteration #',num2str(t)),'numbertitle','off');
    for r = 1:somRow
        for c = 1:somCol
            dot(ind,:)=reshape(somMap(r,c,:),1,dataCol);
            ind = ind + 1;
        end
    end
    for r = 1:somRow
        Row_1 = 1+somRow*(r-1);
        Row_2 = r*somRow;
        Col_1 = somRow*somCol;
        matrix(2*r-1,1) = plot(dot(Row_1:Row_2,1),dot(Row_1:Row_2,2),'--ro','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',4);
        matrix(2*r,1) = plot(dot(r:somCol:Col_1,1),dot(r:somCol:Col_1,2),'--ro','LineWidth',2,'MarkerEdgeColor','g','MarkerFaceColor','g','MarkerSize',4);
        matrix_old(2*r-1,1) = matrix(2*r-1,1);
        matrix_old(2*r,1) = matrix(2*r,1);
    end
    if t~=Iteration
        for r = 1:somRow
            delete(matrix_old(2*r-1,1));
            delete(matrix_old(2*r,1));
            drawnow;
        end
    end
    
    [win_Row,win_Col];
    
    size(train_data);
    size(somMap);
    if isnan (somMap)
        display ('invalid som')
    end
    
    for i=1:size(somMap, 3)
        
        if  ~isempty(find(isnan(train_data(:,i)), 1))
            
            missr = find(isnan(train_data(:,i)));
            train_data(missr,i) = round((somMap(win_Row, win_Col, i)));
        end
    end
end

C = unique(double(train_data));
tt = d;

for c_id=1:size(C)
    
    all_ids = find(train_data == C(c_id));
    for ii=1:size(all_ids)
        category = d(all_ids(ii));
        nan_loc = cellfun(@(V) any(isnan(V(:))), category);
        if ~nan_loc
            break;
        end
    end
    
    tt(all_ids) = category;
    clear all_ids
    %clear category
end

xlswrite(strcat('train_data', 'planned 1'),tt);

% [fname1,fpath1] = uigetfile({'*.xlsx';'.csv'},'Select the missing data in the incomplete dataset');
% if fpath==0
%     error('no file selected');
% end
letter1 = tt;
%[missing_data,missing_txt] = xlsread( fullfile(fpath,fname));
[n, t, letter2] = xlsread('G:\Data Mining\Datasets\Original+Datasets\HOV.xlsx');
[R,C] = size(letter1)
sum = 0;
%
for i=1:R
    for k=1:C
        if(strcmp(letter1(i,k),letter2(i,k)))
            sum = sum+1;
        else
            sum = sum;
        end
    end
end

AE=sum/(R*C);
AE