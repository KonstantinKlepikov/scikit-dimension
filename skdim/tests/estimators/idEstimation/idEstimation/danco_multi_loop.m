
k = 2*log(length(data(1,:)));
size_data = length(data(:,1));
storedim = zeros(6,length(data(1,:)));
for j = 0:1
    [inds,dists] = KNN(data,round(size_data*0.2 - 50*(j)),true);
    d = [];
    mu= [];
    tau=[];

    size_data = length(data(1,:));
%     k = round(size_data*0.2 - 50*(6-j))
    for i = 1:length(inds(:,1))
        [d(i),kl,mu(i),tau(i),ds] = DANCoFit(data(:,inds(i,:)),k,'inds',inds,'dists',dists);

    end
    storedim(j+1,:) = d;
    figure
    scatter3(data(1,:),data(2,:),data(3,:),[],d)
    
end
    