function array = alfabet()
        a           = {'a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'o' 'p' 'q' 'r' 's' 't' 'u' 'v' 'w' 'x' 'y' 'z'};
        array       = a;
        s   = size(a);
        k = s(2);
        for i=1 :s(2)
            for j= 1:s(2)
                l = [a{i},a{j}];
                array{k+1} = l;
                k =k+1;
            end
            
        end
        
