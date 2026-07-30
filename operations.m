clear all; close all;
pkg load datatypes;

#math functions
#{
a=5;
b=12.5;
c1=a+b;
disp(['Sum of ' num2str(a) ' and ' num2str(b) ' is ',num2str(c1)]);
c2=a-b;
disp(['Difference of ' num2str(a) ' and ' num2str(b) ' is ',num2str(c2)]);
c3=a*b;
disp(['Product of ' num2str(a) ' and ' num2str(b) ' is ',num2str(c3)]);
c4=a/b;
disp(['Quotient of ' num2str(a) ' and ' num2str(b) ' is ',num2str(c4)]);
c5=a^b;
disp([num2str(a) ' raised to ' num2str(b) ' is ',num2str(c5)]);
c6=a^(1/b);
disp([num2str(b) 'th root of ' num2str(a) ' is ',num2str(c6)]);
c7=round(b);
disp([num2str(b) ' rounded is ' num2str(c7)]);
c8=floor(b);
disp(['the floor of ' num2str(b) ' is ' num2str(c8)]);
c9=(a^3)*(floor(b/2));
disp(num2str(c9));
c10=exp(a+b);
disp(["e raised to (" num2str(a) " + " num2str(b) ") is " num2str(c10)]);
disp(num2str(c10+c9-c8));
disp("That was a lotta math");
#}

#{
#list

list1= {'apple','banana','carrot','orange','pear','eggplant'};

#list out each of the things in the list
for i=1:length(list1)
  disp(list1{i});
end

# list every other thing

for i=2:2:length(list1)
  disp(list1{i});
end

# list the llengths of each of the wordsa

for i=1:length(list1)
  disp(length(list1{i}));
end

#subtract 2 from every other number

list2=[23,54,93,57,10,34];

for i=1:length(list2)
  num=list2(i);
  if mod(i,2)==0
    disp(num2str(num));
  else
    disp(num2str(num-2));
  end
end
#}


