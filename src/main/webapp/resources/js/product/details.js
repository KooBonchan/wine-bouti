// 댓글 목록 불러오기
function loadReplies(idx) {
  fetch("/board/api/" + idx)
    .then(response => response.json())
    .then(jsons => {
      let inner = "";
      if (jsons.length === 0) {
        inner = "<tr><td colspan='4'>No Replies Yet</td></tr>";
      } else {
        for (let json of jsons) {
          const writer = escapeHTML(json['writer']);
          const content = escapeHTML(json['content']);
          const imageUrl = json['imagePath'] ? `<img src="/uploads/${json['imagePath']}" width="50"/>` : 'No Image';
          const deleteButton = `<td><button type='button' class='delete' onclick='deleteReply(${Number(idx)}, ${Number(json['idx'])})'>X</button></td>`;

          inner += `
            <tr>
              <td class='writer'>${writer}</td>
              <td class='content'>${content}</td>
              <td class='image'>${imageUrl}</td>
              ${(myname && myname === writer) ? deleteButton : ''}
            </tr>`;
        }
      }
      replyContainer.innerHTML = inner;
    });
}

// 댓글 작성 (이미지 업로드 포함)
function submitReply(idx) {
  const content = escapeHTML(formReply.content.value);
  const imageFile = formReply.image.files[0];

  if (!content) {
    alert("댓글 내용을 입력하세요!");
    return;
  }

  const formData = new FormData();
  formData.append("content", content);
  if (imageFile) {
    formData.append("image", imageFile);
  }

  fetch("/board/api/" + idx, {
    method: "POST",
    body: formData,
  })
    .then(response => {
      formReply.content.value = "";
      formReply.image.value = "";
      formReply.content.focus();

      if (response.ok) {
        loadReplies(idx);
        showModal("댓글이 성공적으로 작성되었습니다!");
      } else {
        showModal("댓글 작성에 실패했습니다.");
      }
    })
    .catch(() => showModal("서버 오류가 발생했습니다."));
}

// 댓글 삭제
function deleteReply(boardIdx, idx) {
  if (!confirm("정말 삭제하시겠습니까?")) {
    return;
  }

  fetch("/board/api/" + boardIdx + "/" + idx, {
    method: "DELETE",
    headers: replyHeaders,
  })
    .then(response => {
      if (response.ok) {
        loadReplies(boardIdx);
        showModal("댓글이 삭제되었습니다.");
      } else {
        showModal("댓글 삭제에 실패했습니다.");
      }
    })
    .catch(() => showModal("서버 오류가 발생했습니다."));
}

// HTML 특수문자 처리
const escapeHTML = (str) =>
  str.replace(/[&<>"']/g, (match) =>
    ({
      '&': '&amp;',
      '<': '&lt;',
      '>': '&gt;',
      '"': '&quot;',
      "'": '&#39;',
    }[match])
  );

// 팝업 모달 표시 함수
function showModal(message) {
  const modalBody = document.getElementById("modal-body");
  modalBody.innerText = message;
  $("#modal").modal("show");
}
