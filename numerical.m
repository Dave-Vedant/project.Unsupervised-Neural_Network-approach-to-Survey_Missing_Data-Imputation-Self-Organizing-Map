%% Initialization
clear ; close all;
%clf; shg;

directory_name = uigetdir;
files = dir(directory_name);

fileIndex = find(~[files.isdir]);
length(fileIndex);

for i = 1:length(fileIndex)
    
    fileName = files(fileIndex(i)).name
    [pathstr,name,ext] = fileparts(fileName);
    
    
    %files = {list.name}
    %files{1}
    %numel(files)
    
    
    %% =========== Step 0: Loading and Visualizing Image Randomly =============
%     d = xlsread('F:\Data mining\Incomplete+Datasets\4-gauss\Med10.xlsx');
    d = xlsread(strcat(directory_name, '\', fileName));

    %load Aggregation.txt;
    %while 1   
        train_data = d(1:size(d,1),:);
        y = d (:, end);
        while 1
        size(y);
        [dataRow, dataCol] = size(train_data);
        somRow =10;
        somCol =10;
        Iteration = 2; %10000;
        width_Initial = 3;
        t_width = Iteration/log(width_Initial);
        learningRate_Initial = 1;
        t_learningRate = Iteration;
        fprintf('\nInitializing The Weight Of Neurons Randomly ...\n')
        somMap = randInitializeWeights(somRow,somCol,dataCol);
        %plotData(train_data, y);
        %hold on;
        for t = 1:Iteration
            width = width_Initial*exp(-t/t_width);
            width_Variance = width^2;
            learningRate = learningRate_Initial*exp(-t/t_learningRate);
            if learningRate <0.025
                learningRate = 0.1;
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
        %end
        xlswrite(strcat('cpy_zoo', name),train_data);
        [win_Row,win_Col];
%         [missr missc] = find(isnan(train_data));
%         size(missr);
%         missr;
%         size(missc)
%         missc
        
        size(train_data);
        size(somMap);
        if isnan (somMap)
            display ('invalid som')
        end
        for i=1:size(somMap, 3)
            %display('inside som')
            if  ~isempty(find(isnan(train_data(:,i)), 1))

             %   display('found missing')
                missr = find(isnan(train_data(:,i)));
            %for j=1:size(missr)
%             train_data(missr(i),missc(i)) = somMap(win_Row, win_Col,missc(i));
                train_data(missr,i) = somMap(win_Row, win_Col, i);
            end
        end
       end
        original= xlsread('F:\Data mining\Original+Datasets\zoo.xlsx');
        %original=original(:,1:size(original,2)-1);
        n=sqrt (sum((train_data (:)-original (:)).^2));
        d=sqrt(sum((original(:).^2)));
        r=n/d
        %r= sqrt (sum((train_data (:)-original (:)).^2))/sqrt(sum((original(:).^2)))
        %if isnan(r)
          %continue
        %else
        %    break
        %end
    
    if isnan(r)
        continue
    else
        break
    end
    xlswrite(strcat('train_zoo_', name),train_data);
    %clear all;
    %clearvars -except fileIndex files directory_name train_data
    clearvars -except fileIndex files directory_name
   
        end
end
    
    