<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>Fee Vocher</title>
</head>
<body>
<div class="container-fluid" style="margin-top: -30px;">
	<h1 class="well well-sm bg-navy" align="center" style="font-family: serif;">Generate Voucher</h1>
    <form  action = "voucher" method="POST">
    	<div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <input type="hidden" name="_csrf" class="form-control" value="<?=Yii::$app->request->getCsrfToken()?>">          
                </div>    
            </div>    
        </div>
        <?php $branch_id = Yii::$app->user->identity->branch_id; ?>
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Session</label>
                    <select class="form-control" name="sessionid" id="sessionId" required="">
                            <option value="">Select Session</option>
                            <?php 
                                $sessionName = Yii::$app->db->createCommand("SELECT * FROM std_sessions where delete_status=1 AND session_branch_id = '$branch_id'")->queryAll();
                                
                                    foreach ($sessionName as  $value) { ?>  
                                    <option value="<?php echo $value["session_id"]; ?>">
                                        <?php echo $value["session_name"]; ?>   
                                    </option>
                            <?php } ?>
                    </select>      
                </div>    
            </div>
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Class</label>
                    <select class="form-control" name="classid" id="classId" required="">
                        <option>Select Class</option>
							<?php 
								$className = Yii::$app->db->createCommand("SELECT * FROM std_class_name WHERE delete_status=1 AND branch_id = '$branch_id'")->queryAll();
								    foreach ($className as  $value) { ?>	
									<option value="<?php echo $value["class_name_id"]; ?>">
										<?php echo $value["class_name"]; ?>	
									</option>
							<?php } ?>
					</select>      
                </div>    
            </div>  
              
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Section</label>
                    <select class="form-control" name="sectionid" id="section" required="">
                    		<option value="">Select Section</option>
					</select>      
                </div>    
            </div>
        </div>
        
        <div class="row">
            <div class="col-md-4">
                <div class="form-group">
                    <label>Select Month</label>
                    <input type="month" class="form-control" name="month" required="">
                </div>    
            </div>    
            
            <div class="col-md-4">
                <div class="form-group">
                    <label>Issue Date</label>
                    <input type="date" name="issue_date" class="form-control" required="">
                </div>    
            </div>

            <div class="col-md-4">
                <div class="form-group">
                    <label>Due Date</label>
                    <input type="date" name="due_date" class="form-control" required="">
                </div>    
            </div>
		
			<div class="col-md-4" style="margin-top: 25px;">
                <div class="form-group">
                    <button type="submit" name="submit" class="btn btn-success btn-block btn-flat">
                        <i class="fa fa-check-square" aria-hidden="true"></i>
                        Generate Voucher
                    </button>
                </div>    
            </div>
		</div>
    </form>
</div>    
</body>
</html>

<?php
$url = \yii\helpers\Url::to("fee-transaction-detail/fetch-students");

$script = <<< JS
$('#classId').on('change',function(){
    var classId = $('#classId').val();
    var session_Id = $('#sessionId').val();
  
   $.ajax({
        type:'post',
        data:{session_Id:session_Id,classId:classId},
        url: "$url",

        success: function(result){
            console.log(result);
            var jsonResult = JSON.parse(result.substring(result.indexOf('['), result.indexOf(']')+1));
            var options = '';
            $('#section').empty();
            $('#section').append("<option>"+"Select Section"+"</option>");
            for(var i=0; i<jsonResult.length; i++) { 
                options += '<option value="'+jsonResult[i].section_id+'">'+jsonResult[i].section_name+'</option>';
            }
            // Append to the html
            $('#section').append(options);
        }         
    });       
});
JS;
$this->registerJs($script);
?>
</script>