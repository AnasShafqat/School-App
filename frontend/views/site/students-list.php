<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<?php  
  use yii\helpers\Html;
  use yii\bootstrap\Modal;
  use common\models\StdPersonalInfo;

    $id = $_GET['std_id'];
    // Stduent Personal Info..... 
    $stdPersonalInfo = Yii::$app->db->createCommand("SELECT * FROM std_personal_info WHERE std_id = '$id'")->queryAll();
    $number =  $stdPersonalInfo[0]['std_contact_no'];
    // Student Photo...
    $photo = $stdPersonalInfo[0]['std_photo'];
    //echo $photo;
    // Stduent Guardian Info.....  
    $stdGuardianInfo = Yii::$app->db->createCommand("SELECT * FROM std_guardian_info WHERE std_id = '$id'")->queryAll();
    $stdGuardianId = $stdGuardianInfo[0]['std_guardian_info_id'];
    // Stduent ICE Info.....  
    $stdICEInfo = Yii::$app->db->createCommand("SELECT * FROM std_ice_info WHERE std_id = '$id'")->queryAll();
    // student ICE Name.... 
    if($stdICEInfo==null){
      $stdICEName = 'Not updated...';
      $stdICERelation = 'Not updated...';
      $stdICEContact = 'Not updated...';
      $stdICEAddress = 'Not updated...';
      $stdICEId = 0;
    }
    else{
      $stdICEId = $stdICEInfo[0]['std_ice_id'];
      $stdICEName = $stdICEInfo[0]['std_ice_name'];  
      $stdICERelation = $stdICEInfo[0]['std_ice_relation'];  
      $stdICEContact = $stdICEInfo[0]['std_ice_contact_no'];
      $stdICEAddress = $stdICEInfo[0]['std_ice_address'];  
    }
    // Stduent Academic Info..... 
    $stdAcademicInfo = Yii::$app->db->createCommand("SELECT * FROM std_academic_info WHERE std_id = '$id'")->queryAll();
    $stdAcademicId = $stdAcademicInfo[0]['academic_id'];
    $stdAcademicClass = $stdAcademicInfo[0]['class_name_id'];  
    $stdSubjectID = $stdAcademicInfo[0]['subject_combination']; 
    $stdSubject = Yii::$app->db->createCommand("SELECT std_subject_name FROM std_subjects WHERE std_subject_id = '$stdSubjectID'")->queryAll();
    $stdSubjects = $stdSubject[0]['std_subject_name'];
    //var_dump($stdSubjects); 
    $className = Yii::$app->db->createCommand("SELECT class_name FROM std_class_name WHERE class_name_id = '$stdAcademicClass'")->queryAll();

    // Stduent Fee Info..... 
    $stdFeeInfo = Yii::$app->db->createCommand("SELECT * FROM std_fee_details WHERE std_id = '$id'")->queryAll();
    $stdFeeId = $stdFeeInfo[0]['fee_id'];

     $stdFeeInstallmentDetails = Yii::$app->db->createCommand("SELECT sfi.installment_no,sfi.installment_amount
       FROM std_fee_installments as sfi
       INNER JOIN std_fee_details as sfd
       ON sfd.fee_id = sfi.std_fee_id
       WHERE sfd.std_id = '$id'")->queryAll();

    // fetching student roll number from `std_enrollment_detail` against selected student `$id`
    $stdRollNo = Yii::$app->db->createCommand("SELECT sed.std_roll_no,seh.session_id,seh.section_id
    FROM std_enrollment_detail as sed
    INNER JOIN std_enrollment_head as seh
    ON seh.std_enroll_head_id = sed.std_enroll_detail_head_id
    WHERE sed.std_enroll_detail_std_id = '$id'")->queryAll();
    
?>
<div class="container-fluid">
  <div class="row">
    <div class="col-md-12">
      <ol class="breadcrumb">
            <li><a href="./home"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="./students-view">Back</a></li>
        </ol>
    </div>
  </div>
  <div class="row">
  	<section class="content-header">
    	<h1 style="color: #3C8DBC;">
      	<i class="fa fa-user"></i> Student Profile
    	</h1>
  </section>
    <!-- Content Start -->
  	<section class="content">

      <?php 
        // display success message
        if (Yii::$app->session->hasFlash('success')) { ?>
          <div class="row">
            <div class="col-md-6 alert alert-success alert-dismissable">
               <button aria-hidden="true" data-dismiss="alert" class="close" type="button">×</button>
               <h4><i class="icon fa fa-check"></i>Saved!</h4>
               <?= Yii::$app->session->getFlash('success') ?>
          </div>
          </div>
      <?php } ?>
        <div class="row">
          <div class="col-md-3">
            <!-- Profile Image -->
            <div class="box box-primary">
              <div class="box-body box-profile">
                <img class="profile-user-img img-responsive img-circle" src="<?php echo './backend/web/'.$photo; ?>" alt="User profile picture">
                <!-- <div class="photo-edit text-center">
                  <a href="./std-personal-info-std-photo?id=<?php echo $id; ?>"><i class="fa fa-pencil"></i></a>
                </div> -->
                <h3 class="profile-username text-center" style="color: #3C8DBC;"><?php echo $stdPersonalInfo[0]['std_name'] ?></h3>
                <p class="text-muted text-center"><!-- Software Engineer --></p>
                <ul class="list-group list-group-unbordered">
                  <li class="list-group-item">
                    <b>Roll #:</b> <a class="pull-right"><?php 
                    if (empty($stdRollNo[0]['std_roll_no'])) {
                      echo "N/A";
                    }
                    else
                    {
                      echo $stdRollNo[0]['std_roll_no'];
                    }
                     ?></a>
                  </li>
                  <li class="list-group-item" style="height: 75px;">
                    <b>Class:</b><br>
                    <a><?php echo $className[0]['class_name'] ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Email</b> <a class="pull-right"><?php echo $stdPersonalInfo[0]['std_email'] ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Contact #:</b> <a class="pull-right"><?php echo $stdPersonalInfo[0]['std_contact_no']; ?></a>
                  </li>
                  <li class="list-group-item">
                    <b>Status:</b> <a class="pull-right">
                      
                      <?php 
                        if ($stdPersonalInfo[0]['status'] == "Active") {?>
                        <span class="label label-success"> 
                        <?php echo $stdPersonalInfo[0]['status']; ?> 
                        </span>
                    <?php } else {?>
                        <span class="label label-danger"> 
                        <?php echo $stdPersonalInfo[0]['status']; ?> 
                        </span>
                    <?php } ?>
                  </a>
                  </li>
                  <li class="list-group-item">
                    <b>Academic Status:</b> <a class="pull-right">
                      
                      <?php 
                        if ($stdPersonalInfo[0]['academic_status'] == "Active") {?>
                        <span class="label label-success"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                    <?php } else if ($stdPersonalInfo[0]['academic_status'] == "Promote"){?>
                        <span class="label label-primary"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                    <?php } else if ($stdPersonalInfo[0]['academic_status'] == "Left"){?>
                      <span class="label label-danger"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                      <?php }else{ ?>
                        <span class="label label-warning"> 
                        <?php echo $stdPersonalInfo[0]['academic_status']; ?> 
                        </span>
                      <?php } ?>
                  </a>
                  </li>
                </ul>
                <!-- <a href="#" class="btn btn-primary btn-block"><b>Follow</b></a> -->
              </div>
              <!-- /.box-body -->
            </div>
            <!-- /.box -->
            <!-- About Me Box -->
            <!-- /.box -->
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="nav-tabs-custom">
              <ul class="nav nav-tabs">
                <li class="active"><a href="#personal" data-toggle="tab" style="color: #3C8DBC;"><i class="fa fa-user-circle" ></i> Personal Info</a></li>
                <li><a href="#guardian" data-toggle="tab" style="color: #3C8DBC;"><i class="fa fa-user"></i> Guardian Info</a></li>
                <li><a href="#ice" data-toggle="tab" style="color: #3C8DBC;"><i class="fa fa-user-o"></i> ICE Info</a></li>
              </ul>
              <!-- student personal info Tab start -->
              <div class="tab-content">
                <div class="active tab-pane" id="personal">
                  <div class="row">
                    <div class="col-md-6">
                      <p style="font-size: 20px; color: #3C8DBC;"><i class="fa fa-info-circle" style="font-size: 20px;"></i> Personal Information</p>
                    </div>
                    <div class="col-md-6">
                      <div  style="float: right;">
                        <a href="./emails-create?id=<?php echo $id;?>" class="btn btn-warning btn-sm fa fa-envelope-o" style='color: white;'> Send Email </a>
                        <!-- <a href="./sms?id=<?php echo $id;?>" class="btn btn-info btn-sm fa fa-comments-o" style='color: white;'> Send SMS </a> -->
                        
                        <button type="button" class="btn btn-info btn-sm fa fa-comments" data-toggle="modal" data-target="#modal-default">
                          Send SMS
                        </button>
                        <div class="modal fade" id="modal-default">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">SMS</h4>
                              </div>
                              <form method="get" action="">
                                <div class="modal-body">  
                                  <label>Reciever Name</label>
                                  <input type="hidden" name="to" value="<?php echo $stdPersonalInfo[0]['std_contact_no']; ?>" class="form-control">
                                  <input type="text" name="std_name" value="<?php echo $stdPersonalInfo[0]['std_name']; ?>" class="form-control" readonly=""><br>
                                  <label>SMS Content</label>
                                    <textarea name="message" rows="5" class="form-control" id="message"></textarea>
                                    <p>
                                    <span><b>NOTE:</b> 160 characters = 1 SMS</span>
                                      <span id="remaining" class="pull-right">160 characters remaining </span>
                                    <span id="messages" style="text-align: center;">/ Count SMS(0)</span>
                                    <input type="hidden" value="" id="count"><br>
                                    <input type="text" value="" id="sms" style="border: none; color: green; font-weight: bold;">
                                    <input type="hidden" name="id" value="<?php echo $id; ?>">
                                  </p>
                                </div>
                                <div class="modal-footer">
                                  <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                                  <button type="submit" name="sms" class="btn btn-primary btn-sm">Send SMS</button>
                                </div>
                              </form>
                            </div>
                            <!-- /.modal-content -->
                          </div>
                          <!-- /.modal-dialog -->
                        </div>
                      </div>
                    </div>
                  </div><hr>
                  <!-- student info start -->
                    <div class="row">
                      <div class="col-md-6" style="border-right: 1px dashed;">
                        <table class="table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>Student ID:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_id'] ?></td>
                            </tr>
                            <tr>
                              <th>Student Name:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_name'] ?></td>
                            </tr>
                            <tr>
                              <th>Father's Name:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_father_name'] ?></td>
                            </tr>
                            <tr>
                              <th>Gender:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_gender'] ?></td>
                            </tr>
                            <tr>
                              <th>Date of Birth:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_DOB'] ?></td>
                            </tr>
                            <tr>
                              <th>Temporary Address:</th>
                            </tr>
                            <tr>
                              <td><?php echo $stdPersonalInfo[0]['std_temporary_address'] ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                      <div class="col-md-6">
                          <table class="table table-stripped">
                          <thead>
                           <!--  <tr>
                              <th>CNIC:</th>
                              <td><?php //echo $stdPersonalInfo[0]['std_b_form'] ?></td>
                            </tr> -->
                            <tr>
                              <th>District:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_district'] ?></td>
                            </tr>
                            <tr>
                              <th>Tehseel:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_tehseel'] ?></td>
                            </tr>
                            <tr>
                              <th>Religion:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_religion'] ?></td>
                            </tr>
                            <tr>
                              <th>Nationality:</th>
                              <td><?php echo $stdPersonalInfo[0]['std_nationality'] ?></td>
                            </tr>
                            <tr>
                              <th>Permanent Address:</th>
                            </tr>
                            <tr>
                              <td><?php echo $stdPersonalInfo[0]['std_permanent_address'] ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                    </div>
                  <!-- student info close -->
                </div>
                <!-- student personal info Tab close -->
                <!-- ******************************* -->
                <!-- Guardian tab start here -->
                <div class="tab-pane" id="guardian">
                 <div class="row">
                    <div class="col-md-6">
                      <p style="font-size: 20px; color: #3C8DBC;"><i class="fa fa-info-circle" style="font-size: 20px;"></i> Guardian Information</p>
                    </div>
                  </div><hr>
                  <!-- guardian info start -->
                    <div class="row">
                      <div class="col-md-6" style="border-right: 1px dashed;">
                        <table class="table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>Guardian Name:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_name'] ?></td>
                            </tr>
                            <tr>
                              <th>Relation:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_relation'] ?></td>
                            </tr>
                            <tr>
                              <th>Gurdian Email:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_email'] ?></td>
                            </tr>
                             <tr>
                              <th>Occupation:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_occupation'] ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                      <div class="col-md-6">
                          <table class="table table-stripped">
                          <thead>
                            <tr>
                              <th>Contact No. 1:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_contact_no_1'] ?></td>
                            </tr>
                            <tr>
                              <th>Contact No. 2:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_contact_no_2'] ?></td>
                            </tr>
                             <tr>
                              <th>Designation:</th>
                              <td><?php echo $stdGuardianInfo[0]['guardian_designation'] ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                    </div>
                  <!-- guardian info close -->
                </div>
                <!-- Guardian tab close here -->
                <!-- *********************** -->
                <!-- ICE tab start here -->
                <div class="tab-pane" id="ice">
                 <div class="row">
                    <div class="col-md-6">
                      <p style="font-size: 20px; color: #3C8DBC;"><i class="fa fa-info-circle" style="font-size: 20px;"></i> ICE Information</p>
                    </div>
                  </div><hr>
                  <!-- ICE info start -->
                    <div class="row">
                      <div class="col-md-6">
                        <table class="table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>ICE Name:</th>
                              <td><?php echo $stdICEName; ?></td>
                            </tr>
                            <tr>
                              <th>Relation:</th>
                              <td><?php echo $stdICERelation; ?></td>
                            </tr>
                            <tr>
                              <th>Contact No:</th>
                              <td><?php echo $stdICEContact; ?></td>
                            </tr>
                            <tr>
                              <th>Address:</th>
                              <td><?php echo $stdICEAddress; ?></td>
                            </tr>
                          </thead>
                        </table>
                      </div>
                    </div>
                  <!-- ICE info close -->
                </div>
                <!-- ICE tab close here -->
            </div>
            <!-- /.nav-tabs-custom -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
      <!--  -->
  </div>
</div>
</section>
</div>
</div>

<script>
// textarea sms counter....
$(document).ready(function(){
    var $remaining = $('#remaining'),
    $messages = $remaining.next();
    var numbers = '<?php //echo $countNumbers; ?>';
    $('#message').keyup(function(){
        var chars = this.value.length,
        messages = Math.ceil(chars / 160),
        remaining = messages * 160 - (chars % (messages * 160) || messages * 160);
        $messages.text('/ Count SMS (' + messages + ')');
        $messages.css('color', 'red');
        $remaining.text(remaining + ' characters remaining');
      
        $('#count').val(messages);
      var countSMS = $('#count').val();
        //var sms = parseInt(countSMS * numbers);
        $('#sms').val("Your Consumed SMS: (" + countSMS+ ")");
    });
});
</script>

<?php 
  if (isset($_GET['sms'])) {
    $to = $_GET['to'];
    $message = $_GET['message'];
    // sms ....
    $type = "xml";
    $id = "Brookfieldclg";
    $pass = "college42";
    $lang = "English";
    $mask = "Brookfield";
    // Data for text message
    $message = urlencode($message);
    // Prepare data for POST request
    $data = "id=".$id."&pass=".$pass."&msg=".$message."&to=".$to."&lang=".$lang."&mask=".$mask."&type=".$type;
    // Send the POST request with cURL
    $ch = curl_init('http://www.sms4connect.com/api/sendsms.php/sendsms/url');
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    $result = curl_exec($ch); //This is the result from SMS4CONNECT
    curl_close($ch);
    
    if ($result) {
        Yii::$app->session->setFlash('success', "SMS sent successfully...").$result;
    }
  }
?>