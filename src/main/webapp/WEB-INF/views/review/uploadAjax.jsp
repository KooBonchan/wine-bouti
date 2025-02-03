<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
	.uploadResult {
		width: 100%;
		background-color: pink;
	}
	
	.uploadResult ul {
		display: flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img {
		width: 100px;
	}
	
	.uploadResult ul li span {
		color: white;
	}

	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-content: center;
		top: 0%;
		width: 100%;
		height: 100%;
		background-color: gray;
		z-index: 100;
		background: rgba(255,255,255,0.5);
	}

	.bigPicture {
		position: relative;
		display: flex;
		justify-content: center;
		align-item: center;
	}
	
	.bigPicture img {
		width:600px;
	}
	
</style>
<title>Insert title here</title>
</head>
<body>
	<h1>Upload with Ajax 📫 </h1>
	
	<div class='uploadDiv'>
		<input type='file' name='uploadFile' multiple>
	</div>
	
	<div class='uploadResult'>
		<ul>
		</ul>
	</div>
	
	<button id='uploadBtn'>Upload</button>
	
	<div class="bigPictureWrapper">
		<div class="bigPicture">
		</div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
	<script>
		
		function showImage(fileCallPath){
			//alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display", "flex").show();
			
			$(".bigPictureWrapper").on("click", function(e){
				$(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
				setTimeout(()=>{
					$(this).hide();
				}, 1000);
			});
			
			$(".bigPicture")
			.html("<img src='/display?fileName="+encodeURI(fileCallPath)+"'>")
			.animate({width:'100%', height: '100%'}, 1000);
		}
	
		$(document).ready(function(){
			
			let regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            let maxSize = 5242880; //5MB
			
			function checkExtension(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드할 수 없습니다.");
					return false;
				}
				
				return true;
			}
            
			let cloneObj = $(".uploadDiv").clone();
		
			$("#uploadBtn").on("click", function(e){
				
				let formData  = new FormData();
				
				let inputFile = $("input[name='uploadFile']");
			
				let files = inputFile[0].files;
				
				console.log(files);
				
				//add filedata to formdata
				for(let i=0; i<files.length; i++){
 					
					if(!checkExtension(files[i].name, files[i].size)){
						return false;
					} 
					
					console.log(files[i].name);
					
					formData.append("uploadFile", files[i]);
				}
				
				  $.ajax({ 
					    url: '/uploadAjaxAction',
					    processData: false,
					    contentType: false,
		                data: formData,
		                type: 'POST',
		                datatype:'json',
		                success : function(result){
		                	
		                	console.log("result", result);
		                	
		                	showUploadFile(result);
		                	
		                	$(".uploadDiv").html(cloneObj.html());
		                	
			             }
			    }); //$.ajax
			});
			
			$(".uploadResult").on("click","span", function(e){
				
				let targetFile = $(this).data("file");
				let type = $(this).data("type");
				
				console.log("Target file:", targetFile);
				console.log("Type:", type);
				
				$.ajax({
					url: '/deleteFile',
					data: {fileName: targetFile, type:type},
					dataType: 'text',
					type: 'POST',
					success: function(result){
						alert(result);
					}
				}); //$.ajax
			});			
			
			let uploadResult = $(".uploadResult ul");
			
			function showUploadFile(uploadResultArr) {
				
				let str = "";
				
				$(uploadResultArr).each(function(i, obj){
					if(!obj.image){
						let fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
						
						let fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						
						str += "<li><div><a href='/download?fileName=" + fileCallPath + "'>" +
					       "<img src='/resources/img/attach.png'>" + obj.fileName + "</a>" + 
					       "<span data-file='" + fileCallPath + "' data-type='file'> x </span>" + "</div></li>";	
					}else{
						let fileCallPath = encodeURIComponent(obj.uploadPath+"/s_"+obj.uuid+"_"+obj.fileName);
						
						let originPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
						
						originPath = originPath.replace(new RegExp(/\\/g), "/");
						
						str += "<li><a href=\"javascript:showImage('" + originPath + "')\"><img src='/display?fileName=" + fileCallPath + "'></a>" +
					       "<span data-file='" + fileCallPath + "' data-type='image'> x </span>" + "</li>";

					}
				});
				
				uploadResult.append(str);
			}
			
		});
	</script>
	
	
	
</body>
</html>