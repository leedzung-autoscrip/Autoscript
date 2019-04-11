<?php defined('BASEPATH') OR exit('No direct script access allowed'); ?>
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Server List</h1>
            <div class="dropdown pull-right">
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="fa fa-plus fa-fw"></span> Add Deposit</button>
				<ul class="dropdown-menu">
					<li class="active"><a href="<?= base_url('panel/reseller/'.str_replace(' ','-',$_SESSION['username']).'/addsaldo-via-req') ?>">Via Bankin</a></li>
					<li><a href="<?= base_url('panel/reseller/'.str_replace(' ','-',$_SESSION['username']).'/addsaldo-via-hp') ?>">Via Topup</a></li>
				</ul>
            </div>
            
        </div>
    </div>
    <div class="row">
       <div class="col-xs-6 col-md-5 col-md-4 col-lg-3">
            <div class="well">Balance $ : <B><?= $user -> saldo ?></B></div>
        </div>
    </div>
    <div class="row">
            <div class="col-lg-12">
                <?php if (isset($message)) {echo $message; }?>
            </div>
        <?php foreach($server as $row): ?>
            <div class="col-sm-6 col-md-4 col-lg-3">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <b><?= $row['ServerName']?></b> <?php if ($row['Status']) { echo '';} else {echo "(Locked)";}?>
                    </div>
                  
                    <table class="table">
                        <tr>
                            <td>Location</td><td><?= $row['Location']?></td>
                        </tr>
                        <tr>
                            <td>Host</td><td><?= $row['HostName']?></td>
                        </tr>
                        <tr>
                            <td>Price $</td><td><?= $row['Price']?></td>
                        </tr>
                      <tr>
                            <td>Open ssh</td><td> 22</td>
                        </tr>
                      <tr>
                            <td>Dropbear ssh</td><td> 443</td>
                        </tr>
                      <tr>
                            <td>Dropbear ssl</td><td> 442</td>
                        </tr>
                      <tr>
                            <td>Squid Proxy</td><td> 8000 8080 3128</td>
                        </tr>
                    </table>
                    <div class="panel-footer text-center">
                        <a href="<?= base_url('panel/seller/'.$_SESSION['username'].'/buy/'.str_replace(' ','-',$row['ServerName']).'/'.$row['Id']) ?>" class="btn btn-primary"><i class="fa fa-shopping-cart fa-fw"></i> Buy</a>
                        <a href="http://<?= $row['HostName']?>:88/client.ovpn" class="btn btn-default"><i class="fa fa-download fa-fw"></i> VPN Config</a>
                    </div>
                </div>
            </div>
        <?php endforeach; ?>
    </div>
</div>
