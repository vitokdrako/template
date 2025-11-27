<div class="panel panel-default">
    <div class="panel-heading"><h4><?php echo $module_name; ?></h4></div>
    <div class="panel-body">
        <form role="form" data-toggle="validator" enctype="multipart/form-data" data-form-id="<?php echo $module_id; ?>" class="form-sobfeedback" id="form-sobfeedback<?php echo $module_id; ?>">
            <?php if ($fields) { ?>
                <?php foreach ($fields as $field) { ?>
<!-- Password or Email or Text type -->
                    <?php if ($field['type'] == 'text' || $field['type'] == 'password' || $field['type'] == 'email'){ ?>
                        <div class="form-group">
                            <label for="sob<?= $field['type'] ?><?= $field['id_field'] ?>" class="control-label"><?= $field['name'] ?></label>
                            <input type="<?= $field['type'] ?>" class="form-control" data-toggle="tooltip" id="sob<?= $field['type'] ?><?= $field['id_field'] ?>"
                                   data-original-title="<?php echo $field['tooltip']?  : '' ?>"
                                   name="field[<?= $field['id_field'] ?>][message]"
                                   placeholder="<?= $field['placeholder'] ?>" <?php echo $field['validate']? : ''?>>
                            <div class="help-block with-errors"></div>
                        </div>
                    <?php } ?>
<!-- Phone type-->
                    <?php if ($field['type'] == 'tel'){ ?>
                    <div class="form-group">
                        <label for="sobTel<?= $field['id_field'] ?>" class="control-label"><?= $field['name'] ?></label>
                        <input type="tel" class="form-control" data-toggle="tooltip" id="sobTel<?= $field['id_field'] ?>"
                               name="field[<?= $field['id_field'] ?>][message]"
                               data-original-title="<?php echo $field['tooltip']?  : '' ?>" <?php echo $field['validate']? : ''?>>
                        <div class="help-block with-errors"></div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $("#sobTel<?= $field['id_field'] ?>").mask("<?= $field['placeholder'] ?>");
                        });
                    </script>
                    <?php } ?>
<!-- Textarea type-->
                    <?php if ($field['type'] == 'textarea'){ ?>
                        <div class="form-group">
                            <label for="sobTextarea<?= $field['id_field'] ?>" class="control-label"><?= $field['name'] ?></label>
                            <textarea class="form-control" data-toggle="tooltip" id="sobTextarea<?= $field['id_field'] ?>"
                                   data-original-title="<?php echo $field['tooltip']?  : '' ?>"
                                      name="field[<?= $field['id_field'] ?>][message]"
                                   placeholder="<?= $field['placeholder'] ?>" <?php echo $field['validate']? : ''?>></textarea>
                            <div class="help-block with-errors"></div>
                        </div>
                    <?php } ?>
<!-- DateTime type-->
                    <?php if ($field['type'] == 'date'){ ?>
                        <label for="sobDate<?= $field['id_field'] ?>" class="control-label"><?= $field['name'] ?></label>
                        <div class="form-group">
                            <div class="input-group date" id="datetimepickerMin<?= $field['id_field'] ?>">
                                <input type="text" class="form-control" name="field[<?= $field['id_field'] ?>][message][min]"
                                       data-toggle="tooltip" id="sobDate<?= $field['id_field'] ?>"
                                       data-original-title="<?php echo $field['tooltip']?  : '' ?>" <?php echo $field['validate']? : ''?>>
                                <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                <div class="help-block with-errors"></div>
                            </div>
                        </div>
                        <?php if($field['setting']->diapason){ ?>
                            <div class="form-group">
                                <div class="input-group date" id="datetimepickerMax<?= $field['id_field'] ?>">
                                    <input type='text' class="form-control" data-toggle="tooltip"
                                           name="field[<?= $field['id_field'] ?>][message][max]"
                                           data-original-title="<?php echo $field['tooltip']?  : '' ?>" <?php echo $field['validate']? : ''?>>
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    <div class="help-block with-errors"></div>
                                </div>
                            </div>
                        <?php } ?>
                        <?php if($field['setting']->viewType == 'time'){
                            $format = 'LT';
                        } elseif ($field['setting']->viewType == 'date'){
                            $format = 'DD.MM.YYYY';
                        } elseif ($field['setting']->viewType == 'datetime'){
                             $format = 'DD.MM.YYYY LT';
                        } ?>
                        <?php if(!$field['setting']->diapason){ ?>
                            <script type="text/javascript">
                                $(document).ready(function () {
                                    $("#sobDate<?= $field['id_field'] ?>").datetimepicker({
                                        format: '<?= $format ?>'
                                    });
                                });
                            </script>
                        <?php } else { ?>
                            <script type="text/javascript">
                                $(function () {
                                    $("#datetimepickerMin<?= $field['id_field'] ?> input").datetimepicker({
                                        format: '<?= $format ?>'
                                    });
                                    $("#datetimepickerMax<?= $field['id_field'] ?> input").datetimepicker({
                                        format: '<?= $format ?>',
                                        useCurrent: false //Important! See issue #1075
                                    });
                                    $("#datetimepickerMin<?= $field['id_field'] ?> input").on("dp.change", function (e) {
                                        $("#datetimepickerMax<?= $field['id_field'] ?> input").data("DateTimePicker").minDate(e.date);
                                    });
                                    $("#datetimepickerMax<?= $field['id_field'] ?> input").on("dp.change", function (e) {
                                        $("#datetimepickerMin<?= $field['id_field'] ?> input").data("DateTimePicker").maxDate(e.date);
                                    });
                                });
                            </script>
                        <?php } ?>
                    <?php } ?>
<!-- Checkbox type-->
                    <?php if ($field['type'] == 'checkbox'){ ?>
                    <div class="form-group">
                        <?php /*var_dump($field['options']);*/ ?>
                        <label for="sobCheckbox<?= $field['id_field'] ?>" class="control-label col-sm-12 row">
                            <?= $field['name'] ?></label>
                        <?php foreach ($field['options'] as $key => $option){ ?>
                            <label class="checkbox-inline" data-toggle="tooltip" data-original-title="<?php echo $field['tooltip']?  : '' ?>">
                                <input type="checkbox" value="<?= $option ?>" name="field[<?= $field['id_field'] ?>][message][<?= $key ?>]" <?php echo $field['validate']? : ''?>>
                                <?= $option ?>
                            </label>
                        <?php } ?>
                        <div class="help-block with-errors"></div>
                    </div>
                    <?php } ?>
<!-- Radio type-->
                    <?php if ($field['type'] == 'radio'){ ?>
                    <div class="form-group">
                        <?php /*var_dump($field['options']);*/ ?>
                        <label for="sobRadio<?= $field['id_field'] ?>" class="control-label col-sm-12">
                            <?= $field['name'] ?></label>
                        <?php foreach ($field['options'] as $option){ ?>
                        <label class="radio-inline" data-toggle="tooltip" data-original-title="<?php echo $field['tooltip']?  : '' ?>">
                            <input type="radio" value="<?= $option ?>" name="field[<?= $field['id_field'] ?>][message]" <?php echo $field['validate']? : ''?>>
                            <?= $option ?>
                        </label>
                        <?php } ?>
                        <div class="help-block with-errors"></div>
                    </div>
                    <?php } ?>
<!-- Select type-->
                    <?php if ($field['type'] == 'select'){ ?>
                    <div class="form-group">
                        <label for="sobSelect<?= $field['id_field'] ?>" class="control-label col-sm-12"
                               data-toggle="tooltip" data-original-title="<?php echo $field['tooltip']?  : '' ?>">
                            <?= $field['name'] ?></label>
                        <select name="field[<?= $field['id_field'] ?>][message]" class="form-control" id="sobSelect<?= $field['id_field'] ?>">
                            <?php foreach ($field['options'] as $option){ ?>
                            <label class="radio-inline" >
                                <option value="<?= $option ?>"><?= $option ?></option>
                            <?php } ?>
                        </select>
                        <div class="help-block with-errors"></div>
                    </div>
                    <?php } ?>
<!-- FileDownload type-->
                    <?php if ($field['type'] == 'file'){ ?>
                        <div class="form-group">
                            <label for="sobFile<?= $field['id_field'] ?>" class="control-label col-sm-12"
                                data-toggle="tooltip" data-original-title="<?php echo $field['tooltip']?  : '' ?>">
                                <?= $field['name'] ?>
                            </label>
                             <a href="http://<?= $field['setting']->url ?>" class="btn btn-primary">Download</a>
                        </div>
                    <?php } ?>
<!-- Custom Text type-->
                    <?php if ($field['type'] == 'custom_text'){ ?>
                        <div class="form-group">
                            <label for="sobFile<?= $field['id_field'] ?>" class="control-label col-sm-12"
                                   data-toggle="tooltip" data-original-title="<?php echo $field['tooltip']?  : '' ?>">
                                <?= $field['name'] ?>
                            </label>
                            <p><?= $field['custom_text'] ?></p>
                        </div>
                    <?php } ?>

                    <?php
                    /*var_dump($field); */

                    ?>
                <?php } ?>
            <?php } ?>
            <div class="hidden-inputs">
            <input type="hidden" name="link_page" value="http://<?php echo $domain; ?>" />
            <input type="hidden" name="module_name" value="<?php echo $module_name; ?>" />
            <input type="hidden" name="module_id" value="<?php echo $module_id; ?>" />
            <input type="hidden" name="form_success" value="<?php echo $form_success; ?>" />
            </div>
            <?php if ($recapcha_status){ ?>
                <div class="g-recaptcha" data-sitekey="<?= $recapcha ?>"></div>
            <?php } ?>
            <div class="form-group">
                <button type="submit" onclick="<?= $analytic_script ?>" class="btn btn-success pull-right"><?php echo $button_send; ?></button>
            </div>
        </form>
    </div>
</div>




<!-- alert modal -->
<div class="modal fade sobfeedback-alert" data-backdrop="false" id="sobFeedbackAlert<?php echo $module_id; ?>" data-form-id="<?php echo $module_id; ?>" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body">
                <div class="alert">

                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<div class="windows8" id="loader<?php echo $module_id; ?>">
    <div class="wBall" id="wBall_1">
        <div class="wInnerBall"></div>
    </div>
    <div class="wBall" id="wBall_2">
        <div class="wInnerBall"></div>
    </div>
    <div class="wBall" id="wBall_3">
        <div class="wInnerBall"></div>
    </div>
    <div class="wBall" id="wBall_4">
        <div class="wInnerBall"></div>
    </div>
    <div class="wBall" id="wBall_5">
        <div class="wInnerBall"></div>
    </div>
</div>

<!-- custom css style-->
<style>
    <?= $sobfeedback_css ?>
</style>

<!-- custom js script -->
<script type="text/javascript">
    <?= $sobfeedback_js ?>
</script>