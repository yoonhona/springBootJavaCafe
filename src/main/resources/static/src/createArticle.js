/**
 * Created by nayoonho on 2017. 5. 7..
 */


var alertMessage = function(ele){
    var title = ele.placeholder;
    alert(title + " 을(를) 입력해주세요.");
};

var focusElement = function(ele){
    ele.focus();
}

window.onload = function(){
    var app = new Vue({
        el:"#app"
        , data: {
              title: ""
            , author: ""
            , body: ""
        }
        , methods:{
            formValid: function(e){

                if (!this.title){
                    alertMessage(this.$refs.title);
                    focusElement(this.$refs.title);
                    return;
                }
                if (!this.author){
                    alertMessage(this.$refs.author);
                    focusElement(this.$refs.author);
                    return;
                }
                if (!this.body){
                    alertMessage(this.$refs.body);
                    focusElement(this.$refs.body);
                    return;
                }

                e.target.submit();

            }
        }
    });
};

