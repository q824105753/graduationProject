package com.qy.pojo;


public class test1 {

	public static void main(String[] args) {
		Boolean flag = false;
		for(int i = 10;i < 10000;i++){
			int length = String.valueOf(i).length();
			
			
			if(length==2){
				if(i%10>i/10%10){
					flag = true;
				}else {
					flag = false;
					break;
				}
			}else if (length==3) {
				if(i%10>i/10%10 && i/10%10>i/100%10){
					flag = true;
				}else {
					flag = false;
					break;
				}
			}else if (length==4) {
				if(i%10>i/10%10 && i/10%10>i/100%10 && i/100%10>i/1000%10){
					flag = true;
				}else {
					flag = false;
					break;
				}
			}
			
			System.out.println(flag);
			if(flag){
				System.out.println(i+"++++");
			}
		}
//		
//		System.out.println(15%10);
//		System.out.println(15/10%10);
	}
}
