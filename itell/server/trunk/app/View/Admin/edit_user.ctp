<? //var_dump($user_data); ?>

<p>
    <? if ($user_data['User']['avatar']) { ?>
        <img src="<?= $user_data['User']['avatar']?>" style="height: 100px"/>
    <? } else { ?>
        <img src="http://<?= $_SERVER['HTTP_HOST'] ?><?= PATH_ITELL ?>/img/admin/icons/defaulticon.jpg" style="height: 100px"/>
    <? } ?>
    
</p>

<p>
    <?= __('User_nick:') ?>
    <input type="text" disabled="disabled" size="25" value="<?= $user_data['User']['nick']?>" />
</p>

<p>
    <?= __('Gender:') ?>
    <? if (! $user_data['User']['gender']) { ?>
        <?= __('Male') ?>
    <? } else { ?>
        <?= __('Female') ?>
    <? } ?>
</p>

<p>
    <?= __('Mobile_num:') ?>
    <input type="text" disabled="disabled" size="25" value="<?= $user_data['User']['mobile_num']?>" />
</p>

<p>
    <?= __('Itell:') ?>
    <input type="text" disabled="disabled" size="50" value="<?= ($user_data['User']['itell']) ? $user_data['User']['itell'] : __('No_itell')?>" />
</p>

<p>
    <?= __('Itell_start_time:') ?>
    <input type="text" disabled="disabled" size="25" value="<?= ($user_data['User']['itell_start']) ? $user_data['User']['itell_start'] : __('No_itell')?>" />
</p>

<p>
    <?= __('Can_search:') ?>
    <? if ($user_data['User']['can_search']) { ?>
        <input type="checkbox" checked="true" disabled="disabled"/>
    <? } else { ?>
        <input type="checkbox" disabled="disabled"/>
    <? } ?>
</p>

<p>
    <?= __('Status:') ?>
    <? if ($user_data['User']['status']) { ?>
        <input id="status" type="checkbox" checked="true" />
    <? } else { ?>
        <input id="status" type="checkbox" />
    <? } ?>
</p>

<p>
    <input id="submit" type="button" value="Update"/>
    <input id="cancel" type="button" value="Cancel"/>
    <input id="back" type="button" value="Back"/>
</p>

<script>
    $(document).ready(function(){
        //console.log('hehehe');
        $('#submit').click(function() {
            console.log($('#status').attr('checked'));
            var status = ($('#status').attr('checked') === 'checked');
            console.log(status);
            <? if ($user_data['User']['status']) { ?>
                if (status === false) {
                    var url = '<?= PATH_ITELL ?>/admin/change_status?user_id=' + '<?= $user_data['User']['id'] ?>';
                    window.location = url;
                }
            <? } else { ?>
                if (status === true) {
                    var url = '<?= PATH_ITELL ?>/admin/change_status?user_id=' + '<?= $user_data['User']['id'] ?>';
                    window.location = url;
                }

            <? } ?>
            
        })
        
        $('#cancel').click(function(){
            <? if ($user_data['User']['status']) { ?>
                $('#status').attr('checked', 'true');
            <? } else { ?>
                $('#status').removeAttr('checked');  
            <? } ?>
        })
        
        $('#back').click(function() {
            //console.log('hihihi');
            var url = '<?= PATH_ITELL ?>/admin/list_user';
            window.location = url;
            
        })
    })
    
    
</script>