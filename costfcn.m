function [J , grad]= costfcn(theta, X, Y)
  
m=length(Y);
  
J=0;
  
grad=zeros(size(theta));
  
  
J= (1/m) * sum(-Y'*log(Sigmoid(X*theta))-(1-Y)'*log(1-Sigmoid(X*theta)));
   
grad= (1/m) * sum(X .* (Sigmoid(X*theta)-Y));
   
end