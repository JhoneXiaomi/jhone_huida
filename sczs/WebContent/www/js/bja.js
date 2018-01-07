var i=0;
function shine(id){
var obj= document.getElementById(id);
if(i==0){obj.style.borderColor="#E9F47B";i=1;}else{obj.style.borderColor="red";i=0}
}
setInterval("shine('zzz')",200);//边框变化时间，100可以根据情况调整大小

