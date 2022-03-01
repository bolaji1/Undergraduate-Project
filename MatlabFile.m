clc
format long
disp('Bolajis Project');
qa=input('please input source filename: ');
%qd=input('please input destination filename: ');
qc=input('please input sheet number: ');
qb='.xlsx';
filename=strcat(qa,qb);
%filename1=strcat(qd,qb);
za=xlsread(filename,qc,'B:B');zd=xlsread(filename,qc,'E:E');zg=xlsread(filename,qc,'H:H');
zb=xlsread(filename,qc,'C:C');ze=xlsread(filename,qc,'F:F');zh=xlsread(filename,qc,'I:I');
zc=xlsread(filename,qc,'D:D');zf=xlsread(filename,qc,'G:G');
za=za';zb=zb';zc=zc';zd=zd';ze=ze';zf=zf';zg=zg';zh=zh';
x=[1,25];x1=[1,25];x2=[1,25];y=[1,25];
yn=[1,25];
xn=[1,25];x_2=[1,25];x_3=[1,25];x_4=[1,25];x_5=[1,25];x_6=[1,25];xy=[1,25];x2y=[1,25];x3y=[1,25];x4y=[1,25];
xn1=[1,25];x1_2=[1,25];x1_3=[1,25];x1_4=[1,25];x1_5=[1,25];x1_6=[1,25];x1_1y=[1,25];x1_2y=[1,25];x1_3y=[1,25];x1_4y=[1,25];
xn2=[1,25];x2_2=[1,25];x2_3=[1,25];x2_4=[1,25];x2_5=[1,25];x2_6=[1,25];x2_1y=[1,25];x2_2y=[1,25];x2_3y=[1,25];x2_4y=[1,25];
j=[1,24];j1=zeros(9,4);c1=[1,25];c2=[1,25];c3=[1,25];c4=[1,25];c5=(1:25);c6=[1,25];d1=[1,25];d2=[1,25];d3=[1,25];d4=[1,25];
for i=1:5
    disp(['Sample ' num2str(i)]); 
   for ii=1:2
       if ii==1
       disp('Electroplated Sample');
       disp('Measured''   ''Case 1''   ''Case 2''  ''Case 3''  ''case 4');
       end
       if ii==2
       disp('Non-Electroplated Sample');
       disp('Measured''   ''Case 1''   ''Case 2''  ''Case 3''  ''case 4');
       end
      for iii=1:25
         if ii==1
            x(iii)=za(iii+(25*(i-1)))*0.1;
            x1(iii)=zb(iii+(25*(i-1)))*0.1;
            x2(iii)=zc(iii+(25*(i-1)))*1;
            y(iii)=zd(iii+(25*(i-1)))*10000;
         end
         if ii==2
            x(iii)=ze(iii+(25*(i-1)))*0.1;
            x1(iii)=zf(iii+(25*(i-1)))*0.1;
            x2(iii)=zg(iii+(25*(i-1)))*1;
            y(iii)=zh(iii+(25*(i-1)))*1000; 
         end
      end
      [x_1,ind]=sort(x);
      for w=1:25
   k=ind(w);    
   xn(w)=x(k);xn1(w)=x1(k);xn2(w)=x2(k);yn(w)=y(k);
   
   x_2(w)=xn(w)^2;x_3(w)=xn(w)^3;x_4(w)=xn(w)^4;x_5(w)=xn(w)^5;x_6(w)=xn(w)^6;
   xy(w)=xn(w)*yn(w);x2y(w)=x_2(w)*yn(w);x3y(w)=x_3(w)*yn(w);x4y(w)=x_4(w)*yn(w);
   
   x1_2(w)=xn1(w)^2;x1_3(w)=xn1(w)^3;x1_4(w)=xn1(w)^4;x1_5(w)=xn1(w)^5;x1_6(w)=xn1(w)^6;
   x1_1y(w)=xn1(w)*yn(w);x1_2y(w)=x1_2(w)*yn(w);x1_3y(w)=x1_3(w)*yn(w);x1_4y(w)=x1_4(w)*yn(w);
   
   x2_2(w)=xn2(w)^2;x2_3(w)=xn2(w)^3;x2_4(w)=xn2(w)^4;x2_5(w)=xn2(w)^5;x2_6(w)=xn2(w)^6;
   x2_1y(w)=xn2(w)*yn(w);x2_2y(w)=x2_2(w)*yn(w);x2_3y(w)=x2_3(w)*yn(w);x2_4y(w)=x2_4(w)*yn(w);
      end
    for pk=1:24
     if y(pk+1)>y(pk)
        j(pk)=1;
     else
         j(pk)=-1;
     end
   end
   l=0;
   for pp=1:23
     if j(pp+1)-j(pp)==0
     else
         l=l+1;
     end
   end
   if l>2
      l=2; 
   end
   if l==0
      m=sum(xn);n=sum(yn);o=sum(xy);p=sum(x_2);
      m1=sum(xn1);o1=sum(x1_1y);p1=sum(x1_2);
      m2=sum(xn2);o2=sum(x2_1y);p2=sum(x2_2);
      u=[25 m;m p];v=[n;o];z=u\v;
      u1=[25 m1;m1 p1];v1=[n;o1];z1=u1\v1;
      u2=[25 m2;m2 p2];v2=[n;o2];z2=u2\v2;
      j1(1,1)=z(1);j1(1,2)=z(2);
      j1(2,1)=z1(1);j1(2,2)=z1(2);
      j1(3,1)=z2(1);j1(3,2)=z2(2);
   end  
   if l==1
      m=sum(xn);n=sum(yn);o=sum(xy);p=sum(x_2);q=sum(x_3);r=sum(x_4);s=sum(x2y);
      m1=sum(xn1);o1=sum(x1_1y);p1=sum(x1_2);q1=sum(x1_3);r1=sum(x1_4);s1=sum(x1_2y);
      m2=sum(xn2);o2=sum(x2_1y);p2=sum(x2_2);q2=sum(x2_3);r2=sum(x2_4);s2=sum(x2_2y);
      u=[25 m p;m p q;p q r];v=[n;o;s];z=u\v;
      u1=[25 m1 p1;m1 p1 q1;p1 q1 r1];v1=[n;o1;s1];z1=u1\v1;
      u2=[25 m2 p2;m2 p2 q2;p2 q2 r2];v2=[n;o2;s2];z2=u2\v2;
      j1(4,1)=z(1);j1(4,2)=z(2);j1(4,3)=z(3);
      j1(5,1)=z1(1);j1(5,2)=z1(2);j1(5,3)=z1(3);
      j1(6,1)=z2(1);j1(6,2)=z2(2);j1(6,3)=z2(3);
   end
   if l==2
      m=sum(xn);n=sum(yn);o=sum(xy);p=sum(x_2);q=sum(x_3);r=sum(x_4);t=sum(x_5);bb=sum(x_6);c=sum(x3y);s=sum(x2y);
      m1=sum(xn1);o1=sum(x1_1y);p1=sum(x1_2);q1=sum(x1_3);r1=sum(x1_4);t1=sum(x1_5);bb1=sum(x1_6);c1=sum(x1_3y);s1=sum(x1_2y);
      m2=sum(xn2);o2=sum(x2_1y);p2=sum(x2_2);q2=sum(x2_3);r2=sum(x2_4);t2=sum(x2_5);bb2=sum(x2_6);c2=sum(x2_3y);s2=sum(x2_2y);
      u=[25 m p q;m p q r;p q r t;q r t bb];v=[n;o;s;c];z=u\v;
      u1=[25 m1 p1 q1;m1 p1 q1 r1;p1 q1 r1 t1;q1 r1 t1 bb1];v1=[n;o1;s1;c1];z1=u1\v1;
      u2=[25 m2 p2 q2;m2 p2 q2 r2;p2 q2 r2 t2;q2 r2 t2 bb2];v2=[n;o2;s2;c2];z2=u2\v2;
      j1(7,1)=z(1);j1(7,2)=z(2);j1(7,3)=z(3);j1(7,4)=z(4);
      j1(8,1)=z1(1);j1(8,2)=z1(2);j1(8,3)=z1(3);j1(8,4)=z1(4);
      j1(9,1)=z2(1);j1(9,2)=z2(2);j1(9,3)=z2(3);j1(9,4)=z2(4);
   end
   for lk=1:25
    ma=xn(lk);mb=xn1(lk);mc=xn2(lk);
    jj=(j1((3*l)+1,1)+(j1((3*l)+1,2)*(ma))+(j1((3*l)+1,3)*((ma)^2))+(j1((3*l)+1,4)*((ma)^3)));
    jk=(j1((3*l)+2,1)+(j1((3*l)+2,2)*(mb))+(j1((3*l)+2,3)*((mb)^2))+(j1((3*l)+2,4)*((mb)^3)));
    jl=(j1((3*l)+3,1)+(j1((3*l)+3,2)*(mc))+(j1((3*l)+3,3)*((mc)^2))+(j1((3*l)+3,4)*((mc)^3)));
    k2=((jj+jk+jl)/3)*0.0001;%considering all the three inputs
    k3=((jj+jk)/2)*0.0001;%considering the first two inputs
    k4=((jj+jl)/2)*0.0001;%cinsidering the first and the last input
    k5=((jk+jl)/2)*0.0001;%considering the last two inputs
    yreal=yn(lk)*0.0001;
    %f1=xn(lk)/10;f2=xn1(lk)*100;f3=xn2(lk)/10;f4=xn3(lk);f5=xn4(lk)*10;
    c1(lk)=yreal;c2(lk)=k2;c3(lk)=k3;c4(lk)=k4;c6(lk)=k5;
    d1(lk)=c1(lk)-c2(lk);d2(lk)=c1(lk)-c3(lk);d3(lk)=c1(lk)-c4(lk);d4(lk)=c1(lk)-c6(lk);
    format short
    disp([yreal k2 k3 k4 k5]);  
    %disp(j1);
   end
    disp(j1);
    figure(i)
    subplot(2,1,ii);
    plot(c5,c1,c5,c2,c5,c3,c5,c4,c5,c6);
    h=legend('       Measured','       case 1','       case 2','       case 3','       case 4',1);
    set(h,'interpreter','none');
    xlabel('days');ylabel('CPR(mm/y)');
    if ii==1
    title(['Electroplated Sample ' num2str(i)]);
    end
    if ii==2
    title(['Non-Electroplated Sample ' num2str(i)]);
    end
   end
end
da=sum(d1)*4;db=sum(d2)*4;dc=sum(d3)*4;dd=sum(d4)*4;
figure(11)
plot(c5,d1,c5,d2,c5,d3,c5,d4);
h=legend('       case 1','       case 2','       case 3','       case 4',1);
set(h,'interpreter','none');
xlabel('days');ylabel('error(mm/yr)');title('error plot versus days');
disp('errors');
disp(['    case 1' '    ' 'case 2' '    ' 'case 3' '    ' 'case 4']);
disp([d1' d2' d3' d4']);
disp('percentage errors');
disp('case 1');
disp(da);
disp('case 2');
disp(db);
disp('case 3');
disp(dc);
disp('case 4');
disp(dd);