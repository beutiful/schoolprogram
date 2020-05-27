 /*
	obj:执行动画的对象
	textstyle：执行动画的参数
	target：执行动画的目标位置
	speed：执行动画的速度
	callback：回调函数
 */
 
 
 function move(obj,textstyle,target,speed,callback){
	 
	   clearInterval(obj.time); 
	   //1.获取当前对象的位置
	   var currentLocation = parseInt(getStyle(obj,textstyle));
	   //2.根据对象的位置判断速度的大小方向
	   if(currentLocation>target){
		   speed = -speed;
	   }
	   //3.执行动画效果(需要开启定时器来运行)
	   obj.time=setInterval(function(){
		   var oldValue = parseInt(getStyle(obj,textstyle));
		  // alert(oldValue);
		   var newValue = oldValue+speed;
		   if(speed<0 && newValue<target || speed>0 && newValue>speed){
			   newValue = target;
		   }
		   obj.style[textstyle] = newValue+"px";
		   
		   if(newValue==target){
			   clearInterval(obj.time); //清除上一个定时器
			   callback &&callback();
		   }
		   
	   },30);
 }
	
function getStyle(obj,name){
			if(window.getComputedStyle){//正常浏览器
				return getComputedStyle(obj,null)[name];} 
			else{
				return obj.currentStyle[name];//IE8
			}
		}
		
		
function setA3(obj,index,imglength,all){
				
				if(index>=imglength-1){
					index = 0;
					obj.style.left = 0;
				}
				for(var i=0;i<all.length;i++){
					all[i].style.backgroundColor="";
				}
					all[index].style.backgroundColor="black";
}