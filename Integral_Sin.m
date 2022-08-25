clc
value1 = [ 0, pi/6, pi/4, pi/3, pi/2];
value2 = [ 2*pi/3, pi, 2*pi, 0.429*pi, 0.683*pi];
terms = 20;

series(value1,terms);
series(value2,terms);

function series (value,terms)
    figure
    fprintf('Sin\n\n') 
    for i = 1:length(value)
        sin = s(terms,value(i));
        sin_converge = convergent_terms(sin);
        fprintf('%.4f\n',sin(sin_converge))
        plot(1:terms,sin);
        hold on
        grid on
    end
    
    hold off
    figure
    fprintf('Cos\n\n')
    for i = 1:length(value)
        cos = c(terms,value(i));
        cos_converge = convergent_terms(cos);
        fprintf('%.4f\n',cos(cos_converge))
        plot(1:terms,cos);
        hold on
    end
    hold off
    figure
    fprintf('Tan\n\n')
    for i = 1:length(value)
        tan = t(s(terms,value(i)), c(terms,value(i))); 
        tan_converge = convergent_terms(tan);
        fprintf('%.30f\n',tan(tan_converge))
        plot(1:terms,tan);
        hold on
    end
    
    hold off
end

function conans = convergent_terms(l)
    conans = length(l);
    for i = 1 : length(l)-2
        if  l(i+2)-l(i+1) == l(i+1)-l(i)           
            conans = i;  
            break;
        end
    end
end

function sval = s(terms,x)
    sval = []*terms;
    sval(1) = x;
    for j = 3:2:(terms-1)*2+1 
        p = (j-1) / 2;
        new = sval(p) + ((-1)^p)*( (x^j) / factorial(j) );
        sval(p+1) = new;
    end
end

function cval = c(terms,x)
    cval = []*terms;
    cval(1) = 1;
    for j = 2:2:(terms-1)*2
        p = j / 2;
        new = cval(p) + ((-1)^p)*( (x^j) / factorial(j) );
        cval(p+1) = new;
    end
end   

function tval = t(s,c)
    tval = []*length(s);
    for i  = 1 : length(s)
        tval(i)  = s(i)/c(i);
    end
end



