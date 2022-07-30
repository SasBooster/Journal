<?php
$GradeID = $_POST['gradeid'];
echo "<input id=\"idshnik\" hidden=\"true\" value=\"$GradeID\">",
     "<button id=\"N\" class=\"GN\" onclick=\"GradeUpdate(this.id)\">Н</button>",
     "<button id=\"2\" class=\"G2\" onclick=\"GradeUpdate(this.id)\">2</button>",
     "<button id=\"3\" class=\"G3\" onclick=\"GradeUpdate(this.id)\">3</button>",
     "<button id=\"4\" class=\"G4\" onclick=\"GradeUpdate(this.id)\">4</button>",
     "<button id=\"5\" class=\"G5\" onclick=\"GradeUpdate(this.id)\">5</button><br>",
     "<button id=\"R\" class=\"Gremove\" onclick=\"GradeUpdate(this.id)\">Убрать</button>";
?>
