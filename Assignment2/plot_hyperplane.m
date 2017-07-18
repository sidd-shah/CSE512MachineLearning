function plot_hyperplane( w, w_0)
    XCords = [-6:9];
    w1 = w(1,1);
    w2 = w(2,1);
    Y1 = -(w1 * XCords + w_0)/w2;
    
    plot(XCords,Y1,'k--') 
end