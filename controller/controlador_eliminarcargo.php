<?php

if (!empty($_GET["id"])) {
    $id=$_GET["id"];
    $sql=$conexion->query("delete from cargo where id_cargo=$id");
    if ($sql == true) { ?>
        <script>
         $(function notificacion(){
             new PNotify({
                 title: "CORRECTO",
                 type: "success",
                 text: "Este cargo se elimino correctamente",
                 styling: "bootstrap3"
             })
         })
     </script> 
     <?php } else { ?>
            <script>
             $(function notificacion(){
                 new PNotify({
                     title: "INCORRECTO",
                     type: "error",
                     text: "Este cargo no se elimino",
                     styling: "bootstrap3"
                 })
             })
         </script> 
         <?php } ?>

<script>
    setTimeout(() => {
        window.history.replaceState(null,null,window.location.pathname);
    }, 0);
</script>

<?php }

?>