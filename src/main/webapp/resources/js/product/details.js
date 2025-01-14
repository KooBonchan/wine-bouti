// 코드로 배우는 스프링 댓글 작성

const replyContainer = document.getElementById("reply-container");
const formReply = document['form-reply'];
function loadReplies(idx){
  fetch("/board/api/" + idx)
  .then(response => response.json())
  .then(jsons => {
    let inner = "";
    if(jsons.length == 0){
      inner = "<tr><td colspan=3>No Replies Yet</td></tr>"
    }
    else {
      for(let json of jsons){
        const writer = escapeHTML(json['writer']);
        const content = escapeHTML(json['content']);
        const deleteButton = "<td><button type='button' class='delete' onclick='deleteReply("+Number(idx)+','+Number(json['idx'])+")'>X</button></td>" 
        
        inner = inner +
          "<tr><td class='writer'>" + writer + "</td>" +
          "<td class='content'>" + content + "</td>" +
           ((myname && myname === writer)? deleteButton : '' )+
          "</tr>";
      } 
    }
    
    replyContainer.innerHTML = inner;
  });
}
let replyHeaders = {
  'Content-Type': 'application/json',
};

function submitReply(idx){
  const data = {
    content: escapeHTML(formReply.content.value),
  }
  fetch("/board/api/" + idx, {
    method: "POST",
    headers: replyHeaders,
    body: JSON.stringify(data),
  })
  .then(response => {
    formReply.content.value = "";
    formReply.content.focus();
    if(response.ok){
      loadReplies(idx);
    }
  })
  .catch(console.log)
}
function deleteReply(boardIdx, idx){
  fetch("/board/api/" + boardIdx + "/" + idx, {
    method: "DELETE",
    headers: replyHeaders,
  })
  .then(response => {
    if(response.ok){
      loadReplies(boardIdx);
    } else {
      $("#modal-body").html('Cannot delete this comment.');
        $("#modal").modal('show');
    }
  })
  .catch(console.log)
}

const escapeHTML = (str) =>
  str.replace(/[&<>"']/g, (match) =>
    ({
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#39;',
    }[match]));