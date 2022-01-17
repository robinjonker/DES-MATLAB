function [uniqueSubKeys,classifyKey] = uniqueKey(k)
    a = Key(k);
    c = unique(a,'rows');
    [cols,rows]=size(c);
    uniqueSubKeys = cols;
    if uniqueSubKeys==1
        classifyKey="Weak keys";
    end
    if uniqueSubKeys==2
        classifyKey="Semi-weak key pairs";
    end
    if uniqueSubKeys==4
        classifyKey="Possibly weak keys";
    end
end
