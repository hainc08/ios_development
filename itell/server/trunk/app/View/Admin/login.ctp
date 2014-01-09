
<?= $this->Form->create("Admin",array("url" => "/admin/index")) ?>				
<input type='hidden' name='mode' value='auth_login'>
        <p>
                <label>Username</label>
                <input class="text-input" type="text" name='username'/>
        </p>
        <div class="clear"></div>
        <p>
                <label>Password</label>
                <input class="text-input" type="password" name='password'/>
        </p>
        <div class="clear"></div>
        <p id="remember-password">
                <input type="checkbox" />Remember me
        </p>
        <div class="clear"></div>
        <p>
                <input class="button" type="submit" value="Sign In" />
        </p>

<?= $this->Form->end() ?>