provider "fortios" {
	hostname = var.hostname
	token = var.token
	insecure = "true"
}

resource "fortios_firewall_vip" "VIP_Inbound_HTTP" {
	name = "Inbound_HTTP"
	extip = "10.10.1.10"
	extintf = "port1"
	portforward = "enable"
	protocol = "tcp"
	extport = "80"
	mappedport = "80"
	
	mappedip {
		range = "10.10.2.11-10.10.2.11"
	}
}

resource "fortios_firewall_policy" "Policy_Inbound_HTTP" {
	action = "accept"
	name = "Inbound_HTTP"
	schedule = "always"
	nat = "disable"
	utm_status = "disable"
	ssl_ssh_profile = "no-inspection"
	logtraffic = "all"
	status = "enable"
	
	dstaddr {
		name = "${fortios_firewall_vip.VIP_Inbound_HTTP.name}"
	}
	
	dstintf {
		name = "port2"
	}
	
	service {
		name = "HTTP"
	}
	
	srcaddr {
		name = "all"
	}
	
	srcintf {
		name = "port1"
	}
}