#{
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
#{
#fibonnaci numbers

f1=1;
f2=1;

disp(num2str(f1));
disp(num2str(f2));

for i=3:100
  f3=f1+f2;
  disp(f3);
  f1=f2;
  f2=f3;
end

#}

#prime numbers from 1-1000
#{
count=0; #counts the # of operations
for i=3:2:1000
  if sum(rem(i,1:floor(i^(1/2)))==0)==1
    disp(i);
  end
  count=count+floor(i^(1/2));
end
disp(num2str(count));
#}

#plotting lines
#{

x = 0:1:10;                % Creates numbers from 0 to 10, stepping by 1
y = 3 * x + 3;             % The equation for the line

plot(x, y, 'r', 'LineWidth', 2); % 'r' makes the line red, LineWidth makes it thicker
grid on;
hold on;

x = -10:1:20;                % Creates numbers from -10 to 20, stepping by 1
y = 4 * x - 3;             % The equation for the line

plot(x, y, 'b', 'LineWidth', 10); % 'r' makes the line red, LineWidth makes it thicker
grid on;
hold off;

#}

#plotting other equations- both in same window and new window

#{
x = 0:1:10;                % Creates numbers from 0 to 10, stepping by 1
y1 = 3 * (x.^2) + 3;             % The equation for the parabola

figure(1);                      #new window
subplot(2, 1, 1);               #3 rows 1 column
plot(x, y1, 'r', 'LineWidth', 2); % 'r' makes the line red, LineWidth makes it thicker
grid on;


x = 0:1:20;                % Creates numbers from 0 to 20, stepping by 1
y2 = 4 * (x.^(1/2)) - 3;             % The equation for the sqrt function

figure(1);
subplot(2, 1, 2);
plot(x, y2, 'b', 'LineWidth', 1); % 'b' makes the line blue, LineWidth makes it thicker
grid on;


x = -10:1:20;                % Creates numbers from -10 to 20, stepping by 1
y3 = (x.^4)+(x.^3)-(2*x.^2)+x/3-9            % The equation for the polynomial function

figure(2);
plot(x, y3, 'g', 'LineWidth', 5); % 'g' makes the line green, LineWidth makes it thicker
grid on;
#}

#animation- red square L to R

% 1. Setup the environment window
figure;
axis([0 100 0 100]);  % Set screen boundaries [xmin xmax ymin ymax]
axis square;          % Force the plot aspect ratio to be perfectly square
grid on;

% 2. Define initial square properties
side_length = 10;
sq_start_x = 5;
sq_start_y = 45;         % Kept in the middle vertically

% 3. Create the square object
% Syntax: rectangle('Position', [xmin, ymin, width, height])
sq = rectangle('Position', [sq_start_x, sq_start_y, side_length, side_length], ...
               'EdgeColor', 'r', 'LineWidth', 2, 'FaceColor', [1 0.8 0.8], 'FaceAlpha',1); #facealpha makes it opaque

#animation- green circle T to B, 2x speed
% 1. Setup the environment window
axis([0 100 0 100]);  % Set screen boundaries [xmin xmax ymin ymax]
axis square;          % Force the plot aspect ratio to be perfectly square
grid on;

% 2. Define initial circle properties
diameter = 10;
ci_start_x = 45;
ci_start_y = 80;

% 3. Create the circle object
% 'Curvature', [1 1] rounds the rectangle edges 100%, making it a circle
circ = rectangle('Position', [ci_start_x, ci_start_y, diameter, diameter], ...
                 'Curvature', [1 1], ...
                 'EdgeColor', 'g', 'LineWidth', 2, 'FaceColor', [0 1 0]);

% 4. Animation Loop
speed1 = 2;
speed2=5;
frames = 40;

for frames=0:frames

  new_sq_x = sq_start_x + (frames * speed1); #calculate new square position
  new_ci_y = ci_start_y -(frames * speed2); #calculate new circle position

  set(sq, 'Position', [new_sq_x, sq_start_y, side_length, side_length]); #square movement
  set(circ, 'Position', [ci_start_x, new_ci_y, diameter, diameter]); #circle movement

  pause(0.02); #pause to render frame smoothly

end
#}
