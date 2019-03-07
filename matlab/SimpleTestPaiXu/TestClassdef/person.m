classdef person
    properties
        name;
        age;
        sex;
    end
    methods
        function obj=person(name,age,sex)
            obj.name=name;
            obj.age=age;
            obj.sex=sex;
        end
        function show(obj)
            disp(['name',obj.name]);
            disp(['age:',num2str(obj.age)]);
        end
    end
end