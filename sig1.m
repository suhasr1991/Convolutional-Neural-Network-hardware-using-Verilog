clear all;
clc;
filename = "sig2.txt"
fid = fopen(filename,"r")
filename1 = "Test_data.txt";
fid1 = fopen (filename1, "w");

while(!feof(fid))
    
    a = fgetl(fid);
    a = str2num(a); 
    a = dec2bin(a,7)
    
    value = 0;
    if (a(1)=='1' )
      value = value - 4;
      
    endif
    if(a(2)=='1')
      value = 2 + value;

    endif

    if(a(3)=='1')
      value = 1 + value;

    endif
    if(a(4)=='1')
      value = 0.5 + value;

    endif
    
    if(a(5)=='1')
      value = 0.25 + value;

    endif
    if(a(6)=='1')
      value = 0.125 + value;

    endif
    if(a(7)=='1')
      value = 0.0625 + value;

    endif
    
    value
    g = 0;
    g = 1.0 / (1.0 + exp(-value))
    
    number = g;
    n=4;
    if number >= 0
        %number = floor(number*(2^n))/(2^n);
        number = number;
    else
        %number = -number;
        %number = floor(number*(2^n))/(2^n);
        number = -number;
    end
    number
    if number >= 0
        sign=0;
        integ = floor(number);
        fract = number-integ;
    else 
        sign = 1;
        fract = -(number-ceil(number));
        integ = (-number)-fract;
    end
    s=[];
    
    %collect bits for numbers after decimal in a string
    for x = 1:(n+1) 
        prod = fract * 2;
        if prod >= 1
            fract = prod - 1;
            bit = 1;
            s = strcat(s,num2str(bit));
        else
            fract = prod;
            bit = 0;
            s = strcat(s,num2str(bit));
        end   

    end
    sign_dumm=0;
    final_int = num2str(dec2bin(integ,2));
    signed_bin  = strcat(num2str(sign_dumm),final_int,s);
    
    if sign==0
        %keep the number same and send for round
    else
        %take 2's complement
        for i=1:length(signed_bin)
            if (signed_bin(i)=='1')
                signed_bin(i)='0';
            else
                signed_bin(i)='1';
            end
        end
    end
    x = length(signed_bin);
    temp=0;
    if sign==1
       if signed_bin(length(signed_bin))=='1'
                for i=1:length(signed_bin)
                    if signed_bin(i)=='1'
                       temp = temp + (2^(x-1)); 
                    end
                    x = x-1;
                end
                temp = temp + 1;
                
                signed_bin= num2str(dec2bin(temp,n+1));
       else 
            %keep it same no calculation needed for s(n+1)==0
            
       end
    end
    
    %rounding logic
    temp=0;
    x=length(signed_bin);
    
    if signed_bin(length(signed_bin))=='1'
            for i=1:length(signed_bin)
                if signed_bin(i)=='1'
                   temp = temp + (2^(x-1)); 
                end
                x = x-1;
            end
            temp = temp + 1;
            signed_bin = num2str(dec2bin(temp,7));
    else 
        %keep it same no calculation needed for s(n+1)==0
        
            
    end
    
    signed_bin = signed_bin(1:(length(signed_bin)-1));
    disp(signed_bin);
    fputs (fid1,"7'b");
    fputs (fid1,a);
    fputs (fid1,": sig_value = ");
    fputs (fid1,"7'b");
    fputs (fid1,signed_bin);
    fputs (fid1,";");
    fputs (fid1,"\n");
    
endwhile
fclose (fid);
fclose (fid1);