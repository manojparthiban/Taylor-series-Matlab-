clc

x_value1 = [ 0, pi/6, pi/4, pi/3, pi/2];
x_value2 = [ 2*pi/3, pi, 2*pi, 0.429*pi, 0.683*pi];
terms = 20;

series(x_value1,terms);
series(x_value2,terms); 

%Function for Displaying the Convergent values and Plotting.
function series(value,terms)
    figure
    fprintf('\n')
    fprintf('Sin \n') 
    for i = 1:length(value)
        sin = s(terms,value(i));
        sin_converge = convergent_terms(sin); %computes the convergent terms of sin.
        fprintf('%.4f\n',sin(sin_converge))
        plot(1:terms,sin);
        xlabel('No. of terms used in Taylor Series')
        ylabel('Sin Values for each x values')
        title('Calculating Sinx values using Taylor Series:')
        hold on
        grid on
    end
    
    hold off
    figure
    fprintf('\n')
    fprintf('Cos \n')
    for i = 1:length(value)
        cos = c(terms,value(i));
        cos_converge = convergent_terms(cos);
        fprintf('%.4f\n',cos(cos_converge))
        plot(1:terms,cos);
        xlabel('No. of terms used in Taylor Series')
        ylabel('Cos Values for each x values')
        title('Calculating Cosx values using Taylor Series:')
        hold on
        grid on
    end
    hold off
    figure
    fprintf('\n')
    fprintf('Tan \n')
    for i = 1:length(value)
        tan = t(s(terms,value(i)), c(terms,value(i))); 
        tan_converge = convergent_terms(tan);
        fprintf('%.4f\n',tan(tan_converge))
        plot(1:terms,tan);
        xlabel('No. of terms used in Taylor Series')
        ylabel('Tan Values for each x values')
        title('Calculating Tanx values using Taylor Series:')
        hold on
        grid on
    end
    
    hold off
end

function converge = convergent_terms(l)
    converge = length(l);
    for i = 1 : length(l)-2
        if  l(i+2)-l(i+1) == l(i+1)-l(i)           
            converge = i;            
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



