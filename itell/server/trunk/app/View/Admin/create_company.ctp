<? //var_dump($this->action); ?>
<form id="create_form" method="POST" action="<?= PATH_ITELL?>/admin/add_company" enctype="multipart/form-data">
<p>
    <?= __('Company_name:') ?>
    <input name="name" type="text" size="25" maxlength="40"/>
</p>

<p>
    <?= __('Company_address:') ?>
    <input name="address" type="text" size="50" maxlength="100"/>
</p>

<p>
    <?= __('Company_tel:') ?>
    <input name="tel" type="text" size="25" maxlength="30"/>
</p>

<p>
    <?= __('Company_email:') ?>
    <input name="email" type="text" size="25" maxlength="30"/>
</p>

<p>
    <?= __('Company_description:') ?>
    <input name="desc" type="text" size="50" maxlength="200"/>
</p>

<p>
    <?= __('Company_avatar:') ?>
    <input name="avatar" type="file" />
</p>

<p>
    <?= __('Company_longitude:') ?>
    <input name="long" type="text" size="25" maxlength="30"/>
</p>

<p>
    <?= __('Company_latitude:') ?>
    <input name="lat" type="text" size="25" maxlength="30"/>
</p>

<p>
    <input id="add" type="button" value="Save"/>
    <input id="cancel" type="button" value="Cancel"/>
    <input id="back" type="button" value="Back"/>
</p>

</form>

<script>
    $(document).ready(function(){
        //console.log('hehehe');
        $('#add').click(function() {
            $('#create_form').submit();
            
            
        })
        
        $('#cancel').click(function(){
            // iterate the elements within the form
            var form = $('#create_form');
            $(':input', form).each(function() {
                var type = this.type, tag = this.tagName.toLowerCase();
                if (type == 'text' || type == 'password' || tag == 'textarea')
                    this.value = '';
                else if (type == 'checkbox' || type == 'radio')
                    this.checked = false;
                else if (tag == 'select')
                    this.selectedIndex = -1;
                });
            
        })
        
        $('#back').click(function() {
            //console.log('hihihi');
            var url = '<?= PATH_ITELL ?>/admin/list_company';
            window.location = url;
            
        })
    })
    
    
</script>