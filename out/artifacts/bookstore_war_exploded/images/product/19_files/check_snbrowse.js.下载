var login_session = {
    url:"http://login.dangdang.com/browse_page.php", 
    set_cookie:function(name){
        var expdate = new Date(); 
        var currtime= new Date().getTime();
        expdate.setTime(expdate.getTime() +(365*86400 * 1000 * 1));       
        document.cookie= name+"="+currtime+";Domain=dangdang.com;expires=" + expdate.toGMTString();
    },
    browsePageOperate:function(){
          var uusessionid="";
          var cookie_time="";
          var arrStr = document.cookie.split("; ");
          for(var i = 0;i < arrStr.length;i++ ) {
               var temp = arrStr[i].split("=");
               if(temp[0] == 'sessionID'){uusessionid=unescape(temp[1]);}
               if(temp[0] == 'LOGIN_TIME'){cookie_time= unescape(temp[1]);} 
           }
          if(uusessionid=="") {return  false;}
          if(cookie_time=="") {login_session.set_cookie('LOGIN_TIME');return false;}
          var nowtime=new Date().getTime();
          if(((nowtime-cookie_time)/(1000*60))<=10){return false;}
          login_session.set_cookie('LOGIN_TIME');
          var  request_url=login_session.url+"?uu_sid="+uusessionid+"&be_ut=" + new Date().getTime() +"&page_url="+escape(location.href);
          var script = document.createElement('script');
          script.setAttribute('src', request_url);
          document.getElementsByTagName('head')[0].appendChild(script);
          return  true;
        }
};