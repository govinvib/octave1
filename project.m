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
prompt = {'Enter in the initial velocity of the ball: ' ; 'Enter in the launch angle: '; 'Enter in the amount of time'};
prompt_title  = 'v0, theta, and t';
lines  = 1;
default = {'10', '45', '10'}; # Must be a cell array containing a string

answer = inputdlg(prompt, prompt_title, lines, default);

# Convert the string answer to a number
if ~isempty(answer)
    v0 = str2double(answer{1});
    theta = str2double(answer{2});
    time = str2double(answer{3});
else
    v0 = str2double(default);
    theta = str2double(default);
    time = str2double(default);
end


x0y = 50;
dt= 0.01 ;
v0x = v0 * cosd(theta) ; #calculates in degrees
v0y = v0 * sind(theta) ;

t = 0:dt:time;                #Creates numbers from 0 to 10, stepping by 0.01

#y

ay = -9.81;             #y acceleration
vy = -9.8 * t + v0y;         #y velocity
xy = x0y + v0y * t + (1/2) * ay * (t.^2);  #y position

#x

vx = v0x ;  #x velocity
xx = v0x * t ;  #x position

#set up max coordinates to prevent ball from flying off screen
maximum = 80;
if v0 > 20
  maximum = v0 * 10 ;
end

#{

figure;                      #new window
subplot(4, 1, 1);               #3 rows 1 column
plot(t, a, 'r', 'LineWidth', 2);
xlabel('Time (seconds)');
ylabel({'Acceleration';'(meters/seconds squared)'});
grid on;

#}

#animation

#setup window layout (Left side = Animation, Right side = Live Graphs)
figure('Position', [100, 100, 1000, 500]);

#animation
subplot(2, 2, [1, 3]);
axis([0 maximum 0 maximum]);
axis square;
xlabel('Horizontal Position (meters)');
ylabel('Vertical Position (meters)');
hold on;

#Define initial circle properties
diameter = 10;
ci_start_x = 0;
ci_start_y = 50;

#Create the circle
circ = rectangle('Position', [ci_start_x, ci_start_y, diameter, diameter], ...
                 'Curvature', [1 1], ...
                 'EdgeColor', 'g', 'LineWidth', 2, 'FaceColor', [0 1 0]);



frames=length(xy);
change_xx= xx;
change_xy= xy;



true_velocity_y = gradient(change_xy) ./ dt;  #Calculates velocity
true_accel_y    = gradient(true_velocity_y) ./ dt; #Calculates acceleration

#velocity graph
subplot(2, 2, 2);
h_vel = plot(NaN, NaN, 'r', 'LineWidth', 2); #Initialize
xlim([0 max(t)]);
ylim([min(vy)-5 max(vy)+5]);
xlabel('Time (seconds)');
ylabel('Velocity (m/s)');
grid on;

#displacement graph
subplot(2, 2, 4);
h_disp = plot(NaN, NaN, 'b', 'LineWidth', 2);
xlim([0 max(t)]);
ylim([0 max(xy)+5]);
xlabel('Time (seconds)');
ylabel('Displacement (m)');
grid on;

a1= subplot(2, 2, [1, 3]); #animation graph reference

for i=1:frames

  new_ci_x = xx(i);
  new_ci_y = xy(i);  #calculate new circle position
  set(circ, 'Position', [new_ci_x, new_ci_y, diameter, diameter]); #circle movement

  #update graphs real time
  set(h_vel, 'XData', t(1:i), 'YData', vy(1:i));   #velocity
  set(h_disp, 'XData', t(1:i), 'YData', xy(1:i)); #displacement

  #displays parameters
  title(a1, sprintf('XPos: %.2f m | YPos: %.2f m | XVel: %.2f m/s | YVel: %.2f m/s | Accel: %.2f m/s^2', new_ci_x, new_ci_y, v0x, true_velocity_y(i), true_accel_y(i)));

  drawnow;
  pause(dt);

  if new_ci_y < 0
    break
  end

end


#{
subplot(3, 1, 2);               #3 rows 1 column
plot(t, vy, 'r', 'LineWidth', 2); #'r' makes the line red, LineWidth makes it thicker
xlabel('Time (seconds)');
ylabel({'Velocity'; '(meters/second)'});
grid on;

subplot(3, 1, 3);               #3 rows 1 column
plot(t, xy, 'r', 'LineWidth', 2);
xlabel('Time (seconds)');
ylabel('Displacement (meters)');
grid on;

#}



grid off;
