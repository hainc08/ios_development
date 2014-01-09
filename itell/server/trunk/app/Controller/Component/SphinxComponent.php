<?php

/**
 * Library for searching with sphinx
 *
 * @author TuanNguyen
 */
class SphinxComponent extends Component {

    const FRIEND_TRUE = 1;
    const FRIEND_FALSE = 2;
    const FRIEND_ALL = 3;
    const COMPANY = 4;

    /**
     * Server of sphinx
     * @var string 
     */
    private $host = 'localhost';

    /**
     * Port of sphinx
     * @var int
     */
    private $port = 9312;

    /**
     * Sphinx client object
     * @var SphinxClient
     */
    private $sphinx = NULL;

    public function __construct() {
        $this->sphinx = new SphinxClient();
        $this->sphinx->SetServer($this->host, $this->port);
        $this->sphinx->SetConnectTimeout(1);
        $this->sphinx->SetArrayResult(true);
    }

    /**
     * Find User ID by nick name
     * @param string $nick
     * @param string $prefix. Default is *
     * @param string $postfix. Default is *
     * @param int $offset. Default is 0
     * @param int $limit. Default is 0
     * @param int $maxMatches. Default is 1000. This parameter help sphinx get result faster 
     * @return null if not found else return 
     * Array('total' => xxx, 
     *          'total_found' => xxx, 
     *          'ids' => array('id' => id))
     */
    public function findUserIdByNick($nick, $user_id, $friend_type = self::FRIEND_ALL, $offset = 0, $limit = 20, $maxMatches = 1000, $prefix = "*", $postfix = "*") {
        if ($nick != '') {
            $nick = $prefix . $nick . $postfix;
        }
        if (is_numeric($offset) == false || is_numeric($limit) == false || is_numeric($maxMatches) == false) {
            return null;
        }
        $this->sphinx->resetFilters();
        if ($friend_type == self::FRIEND_TRUE) {
            $this->sphinx->SetFilter('friend_id', array($user_id));
        } else if ($friend_type == self::FRIEND_FALSE) {
            $this->sphinx->SetFilter('friend_id', array($user_id), true);
        }
        $this->sphinx->SetFilter('user_id', array($user_id), true);
        $this->sphinx->SetLimits($offset, $limit, $maxMatches);
        $result = $this->sphinx->Query($nick, 'itell');
        if ($result['total_found'] == 0 || isset($result['matches']) == false) {
            return null;
        }
        $clean_result = array('total' => $result['total'],
            'total_found' => $result['total_found'],
            'ids' => array());
        foreach ($result['matches'] as $match) {
            $clean_result['ids'][] = $match['id'];
        }
        return $clean_result;
    }

    /**
     * Find User Id by distance from geolocation anchor
     * @param type $lon
     * @param type $lat
     * @param type $distance
     * @param type $offset
     * @param type $limit
     * @param type $maxMatches
     * @return null if not found else return
     * Array('total' => xxx,
     *          'total_found' => xxx,
     *          'ids' => array('id' => id),
     *          'geos' = array('id' => array('lon' => xxxx,
     *                                          'lat' => xxx,
     *                                          '@geodist' => xxx)))
     */
    public function findUserIdByGeolocation($lon, $lat, $user_id, $friend_type = self::FRIEND_ALL, $distance = 2000, $offset = 0, $limit = 0, $maxMatches = 1000) {
        if (is_numeric($lon) == false || is_numeric($lat) == false || is_numeric($distance) == false) {
            return null;
        }
        if (is_numeric($offset) == false || is_numeric($limit) == false || is_numeric($maxMatches) == false) {
            return null;
        }
        $this->sphinx->resetFilters();
        $this->sphinx->SetLimits($offset, $limit, $maxMatches);
        if ($friend_type == self::FRIEND_TRUE) {
            $this->sphinx->SetFilter('friend_id', array($user_id));
        } else if ($friend_type == self::FRIEND_FALSE) {
            $this->sphinx->SetFilter('friend_id', array($user_id), true);
        }
        if ($friend_type != self::COMPANY) {
            $this->sphinx->SetFilter('user_id', array($user_id), true);
        }
        $this->sphinx->SetFilterFloatRange('@geodist', 0, $distance);
        $this->sphinx->SetGeoAnchor('lon', 'lat', $lon, $lat);
        $this->sphinx->SetSortMode(SPH_SORT_EXTENDED, "@geodist ASC");
        if($friend_type != self::COMPANY){
            $result = $this->sphinx->Query('', 'itell');    
        }
        else{
            $result = $this->sphinx->Query('', 'itell_company');
        }
        if ($result['total_found'] == 0 || isset($result['matches']) == false) {
            return null;
        }
        $clean_result = array('total' => $result['total'],
            'total_found' => $result['total_found'],
            'ids' => array(),
            'geos' => array());
        foreach ($result['matches'] as $match) {
            $clean_result['ids'][] = $match['id'];
            $clean_result['geos'][$match['id']] = $match['attrs']['@geodist'];
        }
        return $clean_result;
    }

}

?>
