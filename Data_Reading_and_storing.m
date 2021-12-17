load covid_data

% creating the global object that stores the country names
global_storage = data("Global_Data");

% creating the objects of countries=(state,cases) and storing i=the country
% object in global one

j = 1;
k = 1;
country_objects = cell(1,200);
state_objects = cell(1,50);

[row,col] = size(covid_data);
for i=2:row
    %getting the country name
    cur = covid_data{i,1};
    if ~isempty(covid_data{i,2})
        
        %getting the state name if it is not empty
        state = covid_data{i,2};
        
        % creating the state object
        state_objects{k} = data(state);
              
        %write data into this object
        x = covid_data(i,3:377);
        len = length(x);
        cases = zeros(1,len);
        deaths = zeros(1,len);
        for l=1:375
            cases(l) = x{l}(1);
            deaths(l) = x{l}(2);
        end
        
        state_objects{k}.deaths = deaths;
        state_objects{k}.cases = cases;
        
        k = k+1;

    else
        if(k>1)
            % writing state objects to the prev country object
            country_objects{j-1}.objects = state_objects(~cellfun(@isempty,state_objects));
            k = 1;
        end
        
        % creating the country object
        country_objects{j} = data(cur);
        
        % write the data into the object
        x = covid_data(i,3:377);
        len = length(x);
        cases = zeros(1,len);
        deaths = zeros(1,len);
        for l=1:375
            cases(l) = x{l}(1);
            deaths(l) = x{l}(2);
        end
        
        country_objects{j}.deaths = deaths;
        country_objects{j}.cases = cases;
        
        j = j+1;
    end
end
global_storage.objects = country_objects(~cellfun(@isempty,country_objects));