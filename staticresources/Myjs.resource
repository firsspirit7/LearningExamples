function savecalling(){
	var name=document.getElementById('pg:fm:pb:pbs:name').value;		
	if(name==''){
		alert('You should enter value for name');
		return false;
	}
	else{
		savecalling1();
		return true;
	}
}