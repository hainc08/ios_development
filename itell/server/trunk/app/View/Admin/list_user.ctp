<? //var_dump($users); ?>
<table id="list_user">
    <thead>
        <tr>
            <th><?= __('ID') ?></th>
            <th><?= __('Mobile_num') ?></th>
            <th><?= __('Nick') ?></th>
            <th><?= __('Gender') ?></th>
            <th><?= __('Itell') ?></th>
            <th><?= __('Status') ?></th>
            <th><?= __('Action') ?></th>
        </tr>
    </thead>
    <tbody>
<? foreach ($users as $user) { ?>
    
    <tr>
        <td><?= $user['User']['id']?></td>
        <td><?= $user['User']['mobile_num']?></td>
        <td><a href="/admin/edit_user?user_id=<?= $user['User']['id'] ?>"/><?= $user['User']['nick']?></a></td>
        <td><?= (!$user['User']['gender']) ? __('Male') : __('Female')?></td>
        <td><?= ($user['User']['itell']) ? $user['User']['itell'] : __('No_itell')?></td>
        <td>
            <?/*= ($user['User']['status']) ? __('Enable') : __('Disable')*/?>
            <? if ($user['User']['status']) { ?>
                <span style="color: green"><?= __('Enable')?></span>
            <? } else { ?>
                <span style="color: red"><?= __('Disable')?></span>
            <? } ?>
        
        
        </td>
        <td>
            <!-- Icons -->
            <a href="<?= PATH_ITELL ?>/admin/edit_user?user_id=<?= $user['User']['id'] ?>" title="Edit"><img src="<?= PATH_ITELL ?>/img/admin/icons/pencil.png" alt="Edit"></a>
            <a href="<?= PATH_ITELL ?>/admin/change_status?user_id=<?= $user['User']['id'] ?>" title="Delete"><img src="<?= PATH_ITELL ?>/img/admin/icons/cross.png" alt="Delete"></a> 
            <a href="#" title="Push Notification"><img src="<?= PATH_ITELL ?>/img/admin/icons/hammer_screwdriver.png" alt="Edit Meta"></a>
        </td>
    </tr>
<? } ?>
    </tbody>

    <? if ($this->Paginator->hasPrev() || $this->Paginator->hasNext()) { ?>      
    <tfoot>
                <tr>
                    <td colspan="10" style="align:right">
                        <div class="bulk-actions align-left">
                                <input type="text" size="20"/>
                                <a class="button" href="#">Search</a>
                        </div>
                        <div class="pagination">
                                <?= $this->Paginator->first(__('<<First')); ?>
                                <?= ($this->Paginator->hasPrev()) ? $this->Paginator->prev(__('PREV')) : '' ?>
                                <?= $this->Paginator->link($this->Paginator->current(), array('page' => $this->Paginator->current()), array('class' => 'number current')) ; ?>
                                <?= $this->Paginator->link($this->Paginator->current() +1, array('page' => $this->Paginator->current()+1), array('class' => 'number')) ; ?>
                                <?= $this->Paginator->link($this->Paginator->current() +2, array('page' => $this->Paginator->current()+2), array('class' => 'number')) ; ?>
                                <?= ($this->Paginator->hasNext()) ? $this->Paginator->next(__('NEXT')) : '' ?>
                                <?= $this->Paginator->last(__('Last>>')); ?>
                            
                                <?= $this->Paginator->counter(array(
                                            'format' => 'range'
                                        )); ?>
                            
                        </div>
                    </td>
                </tr>
    </tfoot>
            <? } ?> 
</table>
