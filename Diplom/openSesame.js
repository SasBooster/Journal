function SelectChange(){
  var x = document.getElementById("CB_subjects").value;
  var y = document.getElementById("CB_groups").value;

  $.ajax({
    url:"JournalChange.php",
    method: "POST",
    data:{
      subjVal: x,
      grpVal: y
    },
    success:function(data){
      $(ans).html(data);
    }
  })
}

function ChangeGrade(gradeID){
  alert(gradeID);
}

function GradeInsert(){
  var x = document.getElementById("CB_subjects").value;
  var y = document.getElementById("CB_groups").value;

  $.ajax({
    url:"newlesson.php",
    method: "POST",
    data:{
      subjVal: x,
      grpVal: y
    },
    success:function(data){
      SelectChange();
    }
  })
}

function GradePage(GradeID){
  $.ajax({
    url:"newGrade.php",
    method: "POST",
    data:{
      gradeid: GradeID
    },
    success:function(data){
      $(ins).html(data);
    }
  })
}

function GradeUpdate(Grade){
  var g;
  switch (Grade) {
    case "N":
    g = "Н";
      break;
    case "R":
    g = null;
      break;
    default:
    g = Grade;
  }
  x = document.getElementById("idshnik").value;
  $.ajax({
    url:"GUpdate.php",
    method: "POST",
    data:{
      grd: g,
      grdid: x
    },
    success:function(data){
      $(ins).html(data);
      SelectChange();
    }
  })
}
