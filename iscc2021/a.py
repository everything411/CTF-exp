# -*- coding:utf8 -*-
import gmpy2
from libnum import  *
import random
import math
from scipy.special import cbrt
import time

def onemod(e,q):
    p=random.randint(1,q-1)
    while(pow(p,(q-1)/e,q)==1):#(r,s)=1
         p=random.randint(1,q)
    return p

def AMM_rth(o,r,q):# r|(q-1)
    print('start to calculate primitive root...')
    start=time.time()
    assert((q-1)%r==0)
    p=onemod(r,q)
    print ('p:%d'%p)

    t=0
    s=q-1
    while(s%r==0):
        s=s/r
        t+=1
    k=1    
    while((s*k+1)%r!=0):
        k+=1
    alp=(s*k+1)/r
    
    print ('s:%d,t:%d r:%d alp:%d'%(s,t,r,alp))
    a=pow(p,r**(t-1)*s,q)
    b=pow(o,r*a-1,q)
    c=pow(p,s,q)
    h=1
    
    for i in range(1,t-1):
        d=pow(int(b),r**(t-1-i),q)
        print( 'd:%d'%d)
        if d==1:
            j=0
        else:
            j=(-math.log(d,a))%r
        b=(b*(c**(r*j)))%q
        h=(h*c**j)%q
        c=(c*r)%q
    result=(pow(o,alp,q)*h)
    end=time.time()
    
    print ('result:%d'%result)
    print('Finish in {} seconds'.format(end-start))
    return result
#2020.4.3 finish

        
def ALL_Solution(m,q,rt,cq,e):
    print('start to calculate all root...')
    start=time.time()
    mp=[]
    for pr in rt:
        r=(pr*m)%q
        assert(pow(r,e,q)==cq)
        mp.append(r)
    end=time.time()
    print('Finish in {} seconds'.format(end-start))
    return mp
       
def calc(mp,mq,e,p,q):
    print('satrting crt... ')
    i=1
    j=1
    start=time.time()
    t1=gmpy2.invert(q,p)
    t2=gmpy2.invert(p,q)
    for mp1 in mp: 
        if(j%1000==0):
            print( j)
        j+=1           
        for mq1 in mq:
            ans=(mp1*t1*q+mq1*t2*p)%(p*q)
            if check(ans):
                print('Finish in {} seconds'.format(time.time()-start))
                return 
                      
    return 
    
def check(m):
    try:
        a=n2s(m)
        if a.startswith('NCTF'):
            print (a)
            return True
        else:
            return False
    except:
        return False


def ALL_ROOT2(r,q):#use function set() and .add() ensure that the generated elements are not repeated
    print('start to find all primitive root...')
    start=time.time()
    li=set()
    while(len(li)<r):
        p=pow(random.randint(1,q-1),(q-1)/r,q)
        li.add(p)
    end=time.time()
    print('Finish in {} seconds'.format(end-start))
    return li
    
        
if __name__=='__main__':
    p=2099935508561104810935065988988560635979218909496629600741694672454862342769329740467142649
    q=1404311910241328948154803447008125916562914803821692423105727705645984401724757341352253477
    c=1140973074236345854181275625489029993771363333303199648067181998627413232387397120208776337223266107103908130228107180041795309492123354431359757961406559420448944290075147262332401
    e=64
    cp=c%p
    cq=c%q
    
    mp=AMM_rth(cp,e,p)
    mq=AMM_rth(cq,e,q)
    
    
    rt1=ALL_ROOT2(e,p)
    rt2=ALL_ROOT2(e,q)
         
    amp=ALL_Solution(mp,p,rt1,cp,e)
    amq=ALL_Solution(mq,q,rt2,cq,e)
       
    calc(amp, amq,e,p,q)
    
    
