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
        <input id="status" type="checkbox" checked="true" disabled="disabled"/>
    <? } else { ?>
        <input id="status" type="checkbox" disabled="disabled"/>
    <? } ?>
</p>

<p>
    <input id="back" type="button" value="Back"/>
</p>

<script>
    $(document).ready(function(){
        //console.log('hehehe');
        $('#back').click(function() {
            //console.log('hihihi');
            var url = '<?= PATH_ITELL ?>/admin/list_user';
            window.location = url;
            
        })
        
    })
    
    
</script>