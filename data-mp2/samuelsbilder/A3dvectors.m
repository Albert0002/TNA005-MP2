scatter3(1,2,3, 500,"red")
hold on
scatter3(3,2,1, 500,"green")
hold on
scatter3(2,3,1, 500,"blue")
hold on
scatter3(2, 3, 2, 500, "square", "filled")
grid on;
xlabel('X axis'), ylabel('Y axis'), zlabel('Z axis')
legend("1", "2", "3", "uknown")
hold off