classdef dog
    properties
        name;
        eye;
        mouth;
        face;
    end
    methods
        function obj=dog(name,eye,mouth,face)
            obj.eye=eye;
            obj.name=name;
            obj.mouth=mouth;
            obj.face=face;
        end
        function eat(obj)
            disp(['the dog ',obj.name,' is eating']);
        end
    end
end