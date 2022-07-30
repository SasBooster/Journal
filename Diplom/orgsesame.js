function SelectTable(){
  var x = document.getElementById("CB_subjects").value;
  var y = document.getElementById("CB_groups").value;

  $.ajax({
    url:"JournalOrg.php",
    method: "POST",
    data:{
      subjVal: x,
      grpVal: y
    },
    success:function(data){
      $(ens).html(data);
    }
  })
}

function TeachRoles(TeachID){
  $.ajax({
    url:"OrgRoles.php",
    method: "POST",
    data:{
      teach: TeachID
    },
    success:function(data){
      $(list).html(data);
    }
  })
}

function changeRoleSubj(subj){
  var x = document.getElementById("idsh").value;
  $.ajax({
    url:"ChangeSubjRole.php",
    method: "POST",
    data:{
      subjid: subj,
      teach1: x
    },
    success:function(data){

    }
  })
}

function changeRoleGrp(grp){
  var x = document.getElementById("idsh").value;
  $.ajax({
    url:"ChangeGrpRole.php",
    method: "POST",
    data:{
      grpid: grp,
      teach2: x
    },
    success:function(data){

    }
  })
}
