<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
</head>
<body>
	<script>
	function getInfo(str) {
        if (str == "") {
	        document.getElementById("results").innerHTML = "";
	        return;
	    } else {
	        if (window.XMLHttpRequest) {
	            // code for IE7+, Firefox, Chrome, Opera, Safari
	            xmlhttp = new XMLHttpRequest();
	        } else {
	            // code for IE6, IE5
	            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	        }
	        xmlhttp.onreadystatechange = function() {
	            if (this.readyState == 4 && this.status == 200) {
	                document.getElementById("results").innerHTML = this.responseText;

	            }
	        };
	        xmlhttp.open("GET","data.php?q="+str,true);
	        xmlhttp.send();
	    }
	}	
</script>

<h1>Довідник телефонних номерів</h1>
<form>
	<input type="text" name="requested_text" oninput="getInfo(this.value)" size="45" placeholder="Введіть частину імені або номеру телефона">
</form>

<div id="results"></div>

</body>
</html>