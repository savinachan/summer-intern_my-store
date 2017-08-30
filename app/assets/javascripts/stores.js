
$(document).ready(function () {

	
    // 產生 49 顆按鈕
    for( var i = 1; i < 50; i++ ){
      $('.lottery-nums').append('<div>' + i + '</div>');
    }
    // 為數字按鈕加入事件
    $('.lottery-nums div').on('click', function() {

      if ($('.selected').length < 6) {
        console.log( $('.selected').length );
        $(this).addClass('selected');
    } 

    });
    // 重設按鈕
    $('.reset').on('click', function() {
      $('.lottery-nums div').removeClass('highlight selected');
      $('.lottery-result span').empty( );
      $('.record span').empty( );
      RECORD = 0;
    });

    //開獎紀錄
      RECORD = 0;


    // 兌獎按鈕
    $('.btn-lottery').on('click', function() {

      if( $('.selected').length == 6 )
      {
        $('.lottery-nums div.highlight').removeClass('highlight');

          //開獎
          var lottery = [],
              number;
          while (lottery.length < 6) {
            number = parseInt(Math.random() * 49 + 1, 10);

            if (lottery.indexOf(number) === -1) {
              lottery.push(number);
            }
          }

          // 2. 把被選中的號碼加入 highlight class
          for(i = 0; i < lottery.length; i++) {
            //console.log(lottery[i]);
            $('.lottery-nums div').eq(lottery[i] - 1).addClass('highlight');
          }
    
          //開獎號碼
          $('.lottery-result span').text(lottery.join(' '));

          //中獎!
          var con = $('.selected.highlight').length;

          //開獎紀錄
            RECORD++;
          $('.record span').append('<p>第'+RECORD+'次:'+lottery+'</p>');
      
      }
      else{
        alert('請選擇6個號碼!');
      }
      if(con > 0)
        alert('要發了!中獎!中'+con+'個號碼!!!');
  
  

      });



});

