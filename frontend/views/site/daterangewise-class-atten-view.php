<!DOCTYPE html>
<html>
<head>
  <title>View Attendance</title>
</head>
<body>

    <?php 

     if (isset($_POST['submit'])) {
            $startDate = $_POST["start_date"];
            $endDate = $_POST["end_date"];
        }

    if(isset($_GET["teacher_id"])){ 
        $teacher_id = $_GET["teacher_id"];
        $branch_id = $_GET["branch_id"];
        $class_id = $_GET["class_head_id"];   

        $branch_id = Yii::$app->user->identity->branch_id;
        $students = Yii::$app->db->createCommand("SELECT seh.std_enroll_head_name,sed.std_enroll_detail_std_id,sed.std_enroll_detail_std_name, sed.std_roll_no
        FROM std_enrollment_detail as sed
        INNER JOIN std_enrollment_head as seh
        ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id
        WHERE sed.std_enroll_detail_head_id = '$class_id' AND seh.branch_id = '$branch_id'")->queryAll();
    
	    $countstd = count($students);

	    $classDetail = Yii::$app->db->createCommand("SELECT DISTINCT seh.class_name_id, seh.session_id, seh.section_id FROM std_enrollment_head as seh INNER JOIN teacher_subject_assign_detail as d ON d.class_id = seh.std_enroll_head_id WHERE d.class_id = '$class_id' AND seh.branch_id = '$branch_id'")->queryAll();
	    $classnameid = $classDetail[0]['class_name_id'];
	    $sessionid = $classDetail[0]['session_id'];
	    $sectionid = $classDetail[0]['section_id'];
    
?> 
<div class="container-fluid">
    <form method="POST" action="mark-attendance">
    <div class="row">
        <div class="col-md-10">
            <input type="hidden" name="class_head_id" value="<?php echo $class_id; ?>">
            <input type="hidden" name="branch_id" value="<?php echo $branch_id; ?>">
            <input type="hidden" name="teacherHeadId" value="<?php echo $teacher_id; ?>">
        </div>
        <div class="col-md-2">
            <button type="submit" name="view-attendance" style="float: right; margin-right:2px;background-color:#5CB85C;color: white;padding:3px;border-radius:5px;"><i class="glyphicon glyphicon-backward"></i> Back</button>
        </div>
    </div>
</form>
    <br>
    <div class="row">
        <div class="col-md-3">
            <div class="box" style="border-color:#5CB85C;">
                <div class="box-header">
                    <h3 class="text-center" style="font-family: georgia;">Class Attendance</h3><hr style="border-color:#d0f2d0;">
                </div>
                <div class="box-body">
                    <li style="list-style-type: none;">
                        <p class="text-center" style="padding:4px; background-color:#5CB85C; color:white;">
                            Date Range
                        </p>
                        <p>
                            <table style="background-color:#d0f2d0;color: red; width: 100%;">
                            <tr>
                                <td>
                                    <b style="margin-left: 10px;">From:</b>
                                </td>
                                <td style="float: right;margin-right: 10px;">
                                    <u><?php echo $startDate;?></u>
                                </td>
                            </tr><br>
                            <tr>
                                <td>
                                    <b style="margin-left: 10px;">To:</b>
                                </td>
                                <td style="float: right;margin-right: 10px;">
                                    <u><?php echo $endDate;?></u>
                                </td>
                            </tr>
                            </table>
                        </p>
                    </li><hr style="border-color:#d0f2d0;"><br>
                    <li style="list-style-type: none;margin-top: -20px;">
                        <b>Class:</b>
                        <p>
                            <?php echo $students[0]['std_enroll_head_name']; ?>
                        </p>
                    </li><br>
                </div>
            </div>
        </div>
        <div class="col-md-9">
            <div class="box" style="border-color:#5CB85C;">
                <div class="box-header" style="padding:3px;">
                    <h2 class="text-center text-danger" style="font-family: georgia;color:#5CB85C;">Date Range Wise View</h2><hr style="border-color:#d0f2d0;">
                </div>
                <div class="box-body">
                    <div class="row">
        <div class="col-md-12">
            <form method="POST" action="daterangewise-class-atten-view">
                <table class="table table-hover">
                    <thead>
                        <?php 
                        $stdId = $students[0]['std_enroll_detail_std_id'];
                        $attendanceDate = Yii::$app->db->createCommand("SELECT CAST(date AS DATE) FROM std_atten_incharge as att WHERE att.branch_id = '$branch_id' AND att.teacher_id = '$teacher_id' AND att.class_name_id = '$classnameid' AND att.session_id = '$sessionid' AND att.section_id = '$sectionid' AND att.std_id = '$stdId' AND CAST(date AS DATE) >= '$startDate' AND CAST(date AS DATE) <= '$endDate'")->queryAll(); 
                        $count = count($attendanceDate);
                       // print_r($atten);
                         ?>
                        <tr style="background-color:#d0f2d0; ">
                            <th >Sr #.</th>
                            <th>Roll #.</th>
                            <th >Name</th>
                            <?php for ($i=0; $i <$count ; $i++) { ?>
                            <th>
                                <?php 
                                $datee = $attendanceDate[$i]["CAST(date AS DATE)"];
                                $date = explode('-', $datee);
                                $date1 = $date[2];
                                    echo  $date1; 
                                ?>   
                            </th>
                            <?php } ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php 
                        for ($i=0; $i <$countstd ; $i++) { 
                         ?>
                        <tr>
                            <td><?php echo $i+1 ?></td>
                            <td><?php echo $students[$i]['std_roll_no']; ?></td>
                            <td><?php echo $students[$i]['std_enroll_detail_std_name'];?></td>
                                <?php 
                                $stdId = $students[$i]['std_enroll_detail_std_id'];
    					        $atten = Yii::$app->db->createCommand("SELECT CAST(date AS DATE),att.attendance FROM std_atten_incharge as att WHERE att.branch_id = '$branch_id' AND att.teacher_id = '$teacher_id' AND att.class_name_id = '$classnameid' AND att.session_id = '$sessionid' AND att.section_id = '$sectionid' AND att.std_id = '$stdId' AND CAST(date AS DATE) >= '$startDate' AND CAST(date AS DATE) <= '$endDate'")->queryAll();
                                for ($j=0; $j <$count ; $j++) { ?>
                            <td>
                                <?php 
                                    if(empty($atten)){
                                        echo 'Not Marked';
                                    } else {
                                        echo $atten[$j]['attendance']; 
                                    }?>
                            </td>
                            <?php } ?>

                        </tr>
                        
                        <?php
                        //closing for loop
                        } ?>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
                </div>
            </div>
        </div>
    </div>
</div>  
<?php
//closing of ifisset
    }
?>
</body>
</html>
