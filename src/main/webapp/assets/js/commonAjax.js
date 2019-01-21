function commonReady(path){
	$(".staticText").attr("readonly","readonly");
	$.ajax({
	     type  :   'GET',
	     url   :   path+'/dashboard/getProfilePic', 
	     success  :  function(res){
	    	 if(res!=''){
	    		 $(".avatar.rounded").find('img').attr('src','data:image/jpg;base64,'+res);
	    	 }else{
	    		 $(".avatar.rounded").find('img').attr('src',path+'/assets/images/user.png');
	    	 }
	     },
	     error: function(error){
	     	console.log(error);
	     }
	}); 
	
	
		var pathname = window.location.pathname;
		$(".sidebar-nav > ul").find('li').each(function(){
		
		var href = $(this).find("a").attr("href");
		if($(".sidebar-nav > ul").find('li.active').length==0){
			if($(".sidebar-nav > ul").find('li.active').length==0 && localStorage.highlight == href){
				$(this).addClass("active");
				$(this).parents("li").addClass("active").siblings().removeClass("active");
			}
		}
			if(href!="#"){
				if(pathname == href){
					if (typeof(Storage) !== "undefined") {
							localStorage.highlight= new String(pathname);
					}
					$(this).addClass("active").siblings().removeClass("active");
					$(this).parents("ul.sub-nav").css("display","block");
					$(this).parents("li").addClass("active open").siblings().removeClass("active");
				}
			}
			
			
		});
}

//Get IP Address
function getUserIP(onNewIP) { //  onNewIp - your listener function for new IPs
    //compatibility for firefox and chrome
    var myPeerConnection = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
    var pc = new myPeerConnection({
        iceServers: []
    }),
    noop = function() {},
    localIPs = {},
    ipRegex = /([0-9]{1,3}(\.[0-9]{1,3}){3}|[a-f0-9]{1,4}(:[a-f0-9]{1,4}){7})/g,
    key;

    function iterateIP(ip) {
        if (!localIPs[ip]) onNewIP(ip);
        localIPs[ip] = true;
    }

     //create a bogus data channel
    pc.createDataChannel("");

    // create offer and set local description
    pc.createOffer(function(sdp) {
        sdp.sdp.split('\n').forEach(function(line) {
            if (line.indexOf('candidate') < 0) return;
            line.match(ipRegex).forEach(iterateIP);
        });
        
        pc.setLocalDescription(sdp, noop, noop);
    }, noop); 

    //listen for candidate events
    pc.onicecandidate = function(ice) {
        if (!ice || !ice.candidate || !ice.candidate.candidate || !ice.candidate.candidate.match(ipRegex)) return;
        ice.candidate.candidate.match(ipRegex).forEach(iterateIP);
    };
}
/*getUserIP(function(ip){
	return ip;
});*/


function pdfFromHTML(head) {
    var pdf = new jsPDF('p', 'pt', 'letter');

    pdf.cellInitialize();
    pdf.setFontSize(10);
    var header='<b>INMAS</b>';
    pdf.fromHTML(header, 220, 20);
    pdf.fromHTML('<b>'+head+'</b>', 5, 40);
    $.each( $('.table tr'), function (i, row){
        $.each( $(row).find("td, th"), function(j, cell){
            var txt = $(cell).text().trim() || " ";
            var width ;
            if(j==0){
            	width=35;
            }else if(j==5 || j==6 ){
            	width=70;
            }else{
            	width=95;
            }
            
            lines = pdf.splitTextToSize(txt, 80)
            pdf.cell(10, 70, width, 30,lines , i);
        });
    });
    pdf.save('pq.pdf');
}

/*
for archive search
*/
function archiveSearch() {
    var input, filter, table, tr, td, i,result;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("questionTable");
    tr = table.getElementsByTagName("tr");
    
    for (i = 1; i < tr.length; i++) {
        td = tr[i].getElementsByTagName("td");
        for(j=0;j<td.length; j++){
        	if(td[j].innerHTML.toUpperCase().indexOf(filter)>-1){
        		result=true;
        		break;
        	}else{
        		result=false;
        	}
        }
        if(result){
        	tr[i].style.display = "";
        }else{
        	tr[i].style.display = "none";
        }
    }
    if ($('#questionTable tbody').find('tr:visible').length > 0) {
        $('.no-results').hide();
    } else {
        $('.no-results').show();

    }
}

function showHidePagination(){
	if(Number(page)==0){
		$("ul.pagination").find(".previous").hide();
	}else {
		$("ul.pagination").find(".previous").show();
	}
	
	 if(Number(page)==Number(pages)-1){
		$("ul.pagination").find(".next").hide(); 
	}else{
		$("ul.pagination").find(".next").show(); 
	}
	
	if(Number(page)==0 && Number(pages)==1){
		$("ul.pagination").hide();
	}
}


function isEmpty(obj) {
    return Object.keys(obj).length === 0;
}
function loadCurrentThought(path){
	$.ajax({
		type  :   'GET',
	    url   :   path+'/dashboard/currentThought', 
	    dataType: 'json', 
	    accepts: "application/json; charset=utf-8",
	    contentType: "application/json",
	    beforeSend: function(x) {
            if (x && x.overrideMimeType) {
              x.overrideMimeType("application/j-son;charset=UTF-8");
            }
        },
	    success  :  function(thought){
	   	 if(thought!=null &&thought!=''){
	   		 $("#thought_view").html(thought.desciption);
	   		 $('#description').val("");
	   		$('#sendThought').val("Add");
			$('#sendThought').text("Add");
	   		 $("#editThought").click(function(){
	   			editThought(thought.thoughtId,thought.desciption);
	   		 })
	   	 }
	    },
	    error: function(error){
	    	console.log(error);
	    }
	}); 
}
function editThought(id,desc){
	if($('#thought_form')!=undefined){
		$('#thoughtId').val(id);
		$('#description').val(desc);
		$('#sendThought').val("Edit");
		$('#sendThought').text("Edit");
	}
}

