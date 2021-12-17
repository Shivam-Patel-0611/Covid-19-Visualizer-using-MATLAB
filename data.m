classdef data < handle
    
    properties
        name = []
        objects = []
        deaths = []
        cases = []
    end
    
    methods
        function obj = data(name)
            arguments
                name string = ""
%                 deaths = []
%                 cases = []
            end
            obj.name = name;
            obj.deaths = [];
            obj.cases = [];
        end
        
        function set.name(obj,name)
            arguments
                obj
                name = ""
            end
            obj.name = name;
        end
        
        function set.objects(obj,objs)
            arguments
                obj
                objs = []
            end
            obj.objects = [obj.objects objs];
        end
        
        function set.deaths(obj,deaths)
            obj.deaths = deaths;
        end
        function set.cases(obj,cases)
            obj.cases = cases;
        end
    end
end
