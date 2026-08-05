clear all; close all;
pkg load datatypes;

#Kinematics equations

#{

v= v0 + at
x = x0 + v0t - (1/2)a(t^2)
v^2 = (v0)^2 + 2ax

#}

#Free fall graphing

#{
Equations

a = -g
v = -gt
x = x0 - (1/2)g(t^2)

#}

# User prompt
prompt = {'Enter in the initial velocity of the ball: ' ; 'Enter in the launch angle: '};
prompt_title  = 'v0 and theta';
lines  = 1;
default = {'10', '45'}; # Must be a cell array containing a string

# Use parentheses () to call the function, and extract the string from the cell array
answer = inputdlg(prompt, prompt_title, lines, default);

# Convert the string answer to a number
if ~isempty(answer)
    v0 = str2double(answer{1});
    theta = str2double(answer{2});
else
    v0 = str2double(default);
    theta = str2double(default);
end


x0y = 50;
dt= 0.01 ;
v0x = v0 * cosd(theta) ; #calculates in degrees
v0y = v0 * sind(theta) ;

t = 0:dt:10;                % Creates numbers from 0 to 10, stepping by 0.01

#y

ay = -9.81;             # The equation for acceleration
vy = -9.8 * t + v0;         #the equation for velocity
xy = x0y + v0y * t + (1/2) * ay * (t.^2);  #the equation for x position

#x

vx = v0x ;
xx = v0x * t ;

#{
figure;                      #new window
subplot(4, 1, 1);               #3 rows 1 column
plot(t, a, 'r', 'LineWidth', 2); % 'r' makes the line red, LineWidth makes it thicker
xlabel('Time (seconds)');
ylabel({'Acceleration';'(meters/seconds squared)'});
grid on;

subplot(4, 1, 2);               #3 rows 1 column
plot(t, v, 'r', 'LineWidth', 2); % 'r' makes the line red, LineWidth makes it thicker
xlabel('Time (seconds)');
ylabel({'Velocity'; '(meters/second)'});
grid on;

subplot(4, 1, 3);               #3 rows 1 column
plot(t, x, 'r', 'LineWidth', 2); % 'r' makes the line red, LineWidth makes it thicker
xlabel('Time (seconds)');
ylabel('Displacement (meters)');
grid on;
#}

#animation

#setup window
figure(2);
axis([0 (x0y+40) 0 (x0y+40)]);  % Set screen boundaries [xmin xmax ymin ymax]
axis square;          % Force the plot aspect ratio to be perfectly square

% 2. Define initial circle properties
diameter = 10;
ci_start_x = 0;
ci_start_y = 50;

% 3. Create the circle object
% 'Curvature', [1 1] rounds the rectangle edges 100%, making it a circle
circ = rectangle('Position', [ci_start_x, ci_start_y, diameter, diameter], ...
                 'Curvature', [1 1], ...
                 'EdgeColor', 'g', 'LineWidth', 2, 'FaceColor', [0 1 0]);



frames=length(xy);
change_xx= xx;
change_xy= xy;



true_velocity_y = gradient(change_xy) ./ dt;  % Calculates velocity frame-by-frame
true_accel_y    = gradient(true_velocity_y) ./ dt; % Calculates acceleration frame-by-frame


for i=1:frames

  new_ci_x = xx(i);
  new_ci_y = xy(i);  #calculate new circle position
  set(circ, 'Position', [new_ci_x, new_ci_y, diameter, diameter]); #circle movement


  % UPDATED TITLE: Displays both parameters simultaneously
  title(sprintf('XPos: %.2f m | YPos: %.2f m | Vel: %.2f m/s | Accel: %.2f m/s^2', new_ci_x, new_ci_y, true_velocity_y(i), true_accel_y(i)));

  drawnow;
  pause(dt);

  if new_ci_y < 0
    break
  end

end

grid off;
