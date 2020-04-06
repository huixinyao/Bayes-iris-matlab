clc

d=4;c=3;N=50; 
D=load('Iris_data_12.txt');  

%data=zeros(150,d); 
G1=zeros(50,d); 
G2=zeros(50,d); 
G3=zeros(50,d);

data=D;


%����������ȡ�����������ʵ��
for i=1:1:N     
    G1(i,:)=data(i,:);     
    G2(i,:)=data(i+N,:); 
    G3(i,:)=data(i+2*N,:); 
end

%disp(G1); 
%disp(G2);
%disp(G3);

%�������ľ�ֵ��Э����
miu1=mean(G1,1); 
miu2=mean(G2,1); 
miu3=mean(G3,1); 

sigma1=zeros(d,d); 
sigma2=zeros(d,d); 
sigma3=zeros(d,d); 

for i=1:1:N     
    sigma1=sigma1+(G1(i,:)-miu1)'*(G1(i,:)-miu1);     
    sigma2=sigma2+(G2(i,:)-miu2)'*(G2(i,:)-miu2); 
    sigma3=sigma3+(G3(i,:)-miu3)'*(G3(i,:)-miu3);
end 
sigma1=sigma1/N;
sigma2=sigma2/N;
sigma3=sigma3/N;

%�����б�����ʵ�ַ��࣬Ҫ��������д��txt�ı� 
R=zeros(150,3); 
fid=fopen('classifier_result_23.txt','wt'); 
for i=1:1:150     
    R(i,1)=-1/2*(data(i,:)-miu1)*inv(sigma1)*((data(i,:)-miu1)')-1/2*log(det(sigma1));     
    R(i,2)=-1/2*(data(i,:)-miu2)*inv(sigma2)*((data(i,:)-miu2)')-1/2*log(det(sigma2)); 
    R(i,3)=-1/2*(data(i,:)-miu3)*inv(sigma3)*((data(i,:)-miu3)')-1/2*log(det(sigma3));
     switch (compares(R(i,1),R(i,2),R(i,3))) 
        case R(i,1)              
            fprintf(fid,'��%-2d���������ڵ�1��\n',i); 
            
        case R(i,2)              
            fprintf(fid,'��%-2d���������ڵ�2��\n',i); 
         
        case R(i,3)
            fprintf(fid,'��%-2d���������ڵ�3��\n',i); 
     end
end
fclose(fid);
















