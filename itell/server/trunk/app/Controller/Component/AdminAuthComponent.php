<?php
define('ADMIN_NAME','admin');
define('ADMIN_PASSWD','itell@2012!');
?>
<?php
/**
 * AuthAdmin Components
 * @author adwaysvn
 *
 */
class AdminAuthComponent extends Component {
    var $components = array('Session','RequestHandler');
    var $controller = null;
    
    function initialize($controller) {
        $this->controller=$controller;
        if ($this->controller->action != "login") {
            $logged = true;
            $admin = $this->Session->check('admin_id');
            if (!$admin) {
                $username = (isset($_REQUEST["username"])) ? $_REQUEST["username"] : '';
                $password = (isset($_REQUEST["password"])) ? $_REQUEST["password"] : '';
                if ($username == ADMIN_NAME &&
                        $password == ADMIN_PASSWD) {
                    //'hehehe';exit();
                    $this->Session->write('admin_id', '1');
                }
                else
                    $logged = false;
            }
            if (!$logged)
                return $this->controller->redirect('/admin/login');
        }
    }
}
?>