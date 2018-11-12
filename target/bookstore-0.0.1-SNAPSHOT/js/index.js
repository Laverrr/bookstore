$(".slider").YuxiSlider({
    width:800, //容器宽度
    height:450, //容器高度
    control:$('.control'), //绑定控制按钮
    during:4000, //间隔4秒自动滑动
    speed:800, //移动速度0.8秒
    mousewheel:true, //是否开启鼠标滚轮控制
    direkey:true //是否开启左右箭头方向控制
});