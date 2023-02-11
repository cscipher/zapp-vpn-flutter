import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:zapp_vpn/src/utils/zapp_vpn_creds.dart';

const String vpnConfig = '''

###############################
# FreeOpenVPN.Org config file #
# https://www.freeopenvpn.org #
###############################

setenv UV_ID 020e71ad1d6547618aa96dc7230926f2
setenv UV_NAME restless-meadow-8955
client
dev tun
dev-type tun
remote us1.freeopenvpn.org 443 tcp-client
remote-random
nobind
persist-tun
cipher AES-128-CBC
auth SHA1
verb 2
mute 3
push-peer-info
ping 10
ping-restart 60
hand-window 70
server-poll-timeout 5
reneg-sec 2592000
sndbuf 393216
rcvbuf 393216
max-routes 1000
remote-cert-tls server
comp-lzo no
auth-user-pass
key-direction 1
<ca>
-----BEGIN CERTIFICATE-----
MIIFcTCCA1mgAwIBAgIIJztVg1To4nEwDQYJKoZIhvcNAQELBQAwRjEhMB8GA1UE
CgwYNWZhMmI4OTAyMWY5MjMxYjFhZmRiMDM2MSEwHwYDVQQDDBg1ZmEyYjg5MDIx
ZjkyMzFiMWFmZGIwNDMwHhcNMjAxMTA0MTQyMDA0WhcNNDAxMDMwMTQyMDA0WjBG
MSEwHwYDVQQKDBg1ZmEyYjg5MDIxZjkyMzFiMWFmZGIwMzYxITAfBgNVBAMMGDVm
YTJiODkwMjFmOTIzMWIxYWZkYjA0MzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCC
AgoCggIBANi1KmZL1M5CrCwRxIXxo3sMRGA/O+8l+8CVC0fDqY8UYLt3OXMgwXow
QRKKIctj1kZW/PyqLd5xsXhbD+0THJ51KAzc+9kb8U1TMrtCbajpFElnIcDmHKkb
0mBhe+mpElFA2BNk6+H+zzGlO6r2ckv/GNEHcmJ5tsudUXm68pM7yopbsMSZhkwQ
KzpIuVkbQZc7vFI61DyuRh4HtgZ/t1G8kJ4K0QJiFKj+S5kLhx8PcQWz94q+sT0/
8CPzDuEGdmc8tQ4L3d7+jRwLBTs/Ds6Y7zw2fXxRKuSLIWVgE92LtrXJMD2q8nkg
iwcgn0TUdBHyIcsYgsQE8as6jpf89t9Vdz3RE1mKqDhlsROKWr8xFn0PoT6jB4tz
vAEJ0kKPcxFAGa3MmFthuo1i1McBjogp5ENQMXUylLW9IGRaRYgZuR1h8S9O/dxC
7aEOxduBjPGp8UcZzMPzRN9oCY5O170GwYmdL250g2keyA3qavfWCx5gkmwMZfCj
SRgRv2WC73bgY0fpWl/CxrKwK1/Pwz3O/ZrUG6eEmgOwCvGpxxYjCxvlQoZ9uUwh
x5zCmTN7d67rkI9MU6F9wcxkc46hoiM9dEFVe+8GOA+AYjk9g2yA8Zl3ImLt9Gn5
HNsI1G7nObiFUikYGeJUST1qM5kNfKzJYGdSxy0U1jFxS9fnRn8lAgMBAAGjYzBh
MA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8EBTADAQH/MB0GA1UdDgQWBBR5dxQm
w1vb+IiO6qCPkh5fa2SBdjAfBgNVHSMEGDAWgBR5dxQmw1vb+IiO6qCPkh5fa2SB
djANBgkqhkiG9w0BAQsFAAOCAgEAJl/btMUFYhItQkAbsXXJ694+nc96f9SKDYkI
rqtHe1Fk71oFkKj9JcQ6fmd4l1vs9p0/AQoLMB1aGQ51n40sWwFN72mUv4bqiYpB
d0KAxgLw1T3CQ3K5FiER+CxLlyZNnfjxhCuotEbdBT6hcot80znG4tDwH4se2JgX
d72063D9rCMKffiKR1wc1FX5SKfkWDPAqa3QyN9dAdrpyhTyKYp2QR/ZVL7mW3ea
F4QHuks2p3f/HBbOX577D3oCwXYOe28PknfO4LcZ/heL1wqQwJLqcu7JJWSFgEeN
v+NZzAN99EJP2Z5u9TrzTOkEKI5P4MVas10zHhKOwl+KUE4tAr1bfGOtbcjk3SdY
Li17eh4tKEcI9QFIgMXzPRy1W6Eo5+yjLxl6sh4Z1mSx5AdNkl+YwzYnX5vEUjTd
u1F66HlvuA1Hhs9aGu3ABXn/5BrhmWeSlIZuDcW9S0YZVwyxToPG/1PL7fsgvz59
1CQF+dBj8AII/jjtHPr1IXuu0KTns9xii8zFEciH7j3AO//CaR9OOtgOKnwRqHXr
TA0C09X2LfbcKBr785M60U+Sum0sI6+GefRzO5xH+bPBHG3WkzR2GWHFqF1NIZAw
K448xYtNC6cN6RIXmcS6/KxLBJv2r6wLXes8DUZukvya+JYj7/8WclJLCQIWafV+
6cDjW+o=
-----END CERTIFICATE-----
</ca>
<tls-auth>
#
# 2048 bit OpenVPN static key
#
-----BEGIN OpenVPN Static key V1-----
4120da91ec93324db74aab0aae9ed93e
947ca5edb9ad2d3bf2ab70f65eb589dc
38ed248a6e52a3f2546fe166e0c64a85
675a54b6de8dfcd14c3efa9704e346c0
7d687d8775044310f218bbaba1d9a39f
5a97c7eead7538d2ee704d0ad9e4ee61
d2ccaf4ea34b341a750549e35b8c7454
ed04842174e95cc0b70d0f49a64d4db5
12a2fc71ab9140074a55a06733dd024e
23204b019a3512bd196ad0568cbbb174
4d51a46e0b37a93931cd192f18139f15
435fd4e1182c7ddee9ff501837573da1
bd4712c0cb5b333dde54550425cdf3da
39e3f91f7293f23c062510a9e1931709
956145d01205e81769e53f93a08b81f7
54a4034b5bb79e363057f2fa08bad60b
-----END OpenVPN Static key V1-----
</tls-auth>
<cert>
-----BEGIN CERTIFICATE-----
MIIFgTCCA2mgAwIBAgIJAPKp5+VB9ahMMA0GCSqGSIb3DQEBCwUAMEYxITAfBgNV
BAoMGDVmYTJiODkwMjFmOTIzMWIxYWZkYjAzNjEhMB8GA1UEAwwYNWZhMmI4OTAy
MWY5MjMxYjFhZmRiMDQzMB4XDTIwMTEwNDE0MjAwNloXDTQwMTAzMDE0MjAwNlow
RjEhMB8GA1UECgwYNWZhMmI4OTAyMWY5MjMxYjFhZmRiMDM2MSEwHwYDVQQDDBg1
ZmEyYjg5NTIxZjkyMzFiMWFmZGIwNDUwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAw
ggIKAoICAQC2MPG3nrGfnMSAAgpfDbWnFzxMgc0HCYbUEaSwhwTzp7f1jJ/LDxQN
Xx/ihpESrpV1AuWrEMxX92iPGsjiCQO06v8doLLlUWTVK8jOtJMGJv+9n6qXyyrC
qYqTgq80evoT8ThGPIh9zbeieWkeMEQo+OdJSAYDEjG5RVnix+df4GXxkjJc8sM5
8nMhsx9yK2v7RiHGMQeAOm3mNvmfHcKr10IUK5W80p4gP22Q6iWL+DaY+LjrjOCZ
FrvwSiY/fASmITpQjIMPTuPaksdiROdaZXD3p+U28M/urzi5yk1QPwfSOp//YcgJ
o1xVdNPn/s0LGuKrLM7lpQ8XFhufNb7o6Tc9qNBf5dcbBB8OWxAV64n2V95j9ec8
/DkWMJMgtlwU4xhUD81YBKFWCqjIOH9fPp2Kh+JEmB1WI/XiSXKuk44Rqwr+NUVR
sRKtWuH0ZRMR6d4JQhKuyi98wegsmYHbt9kkjtoteo9ommYO0RwvLuN+rpbIC/Sl
/GqY+9EQTdyT+RQk0dKg5ngENtC6mGSVfDK8PPzGqMXc98/xGBoXcVKmQELVVbgu
YUzVqgT9c695PqZZ1WouzIGGzKClPb2O5bRXquD2VJhqkrSIn7eeHvdv7ke2h+Jw
PxONOrteAPrTQFhchoSfiC9W39Ol3szc4L0EOV5J56nvug+CCvKwwQIDAQABo3Iw
cDAOBgNVHQ8BAf8EBAMCBaAwCQYDVR0TBAIwADATBgNVHSUEDDAKBggrBgEFBQcD
AjAdBgNVHQ4EFgQUIyI9iRCNURRz6pYtZTVHf5Ih0pMwHwYDVR0jBBgwFoAUeXcU
JsNb2/iIjuqgj5IeX2tkgXYwDQYJKoZIhvcNAQELBQADggIBACoozM/c+DtV5eKv
cxq+28cOOy9IZtk4ezbdClettiquCZduJbnRPvG7mLElVDdbim5OAbVV7piCYaFa
F9QxEpuOUXygSSvqCIgQPkR9g9L5POqtkZDsiMWJGdk0K+XMxrNWiLJ/7Ahm/aV5
EZdpEY7jhgrBSmWR/r0lOxOA1aEIA/7eL4L/t/rjSSXqczgYsJQa1WfogWSC5Egr
Cu5lhFQOOPOfFun9iHDhWb+bgWzvfMKT+c46nV7vjFlJwRKY36v/KfLq09SBUY4P
DpIdP0pPFFeuZad1t43kHzWwSQqy03U1WkA9bp+vN9utTVatlr05eV8JKzlYkyhQ
ykiISwy1GDa+hMr4xu2hFg5HeHYtcIlb6bgW+K+ya0imgpcKcUw6hOU6gwokVuhz
qNaX647rW/kTypyxjeQxrLGxegSJYtP1Bcn/lNJDXw5KDUYkXcbKqOjA7faqACZU
TdKlbpTC+px/wPwbmEA+G7BKoZfJp2NjuR+BQHKC1Yq9WkiRgWxEw5IzHboHRgcY
helCoZxkjLWrPQN1C766NSo9dmgfwCToafD8Ylxf0zfY+WV3h/x9TZkvdaxJ7zDy
usJUuK7CQT8R5VLt7+6NPp3UsNHTxmeyE5ocCieI0SXIIDYj06IUw0A3RUjRaMyT
6Vhek32eRkcy/aSjgiWZpdGBnLxg
-----END CERTIFICATE-----
</cert>
<key>
-----BEGIN PRIVATE KEY-----
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
1O0C8AtrdmiV8WPCOiZ/Http95gBLg==
-----END PRIVATE KEY-----
</key>


''';

class ZappVpnConfig {
  // Singleton initialization
  ZappVpnConfig._();

  static final _instance = ZappVpnConfig._();

  static ZappVpnConfig get instance => _instance;

  // config starts here
  static late OpenVPN openVPNEngine;

  bool _errorComplete = false;

  void init(
      {required Function(VpnStatus? status, bool error)
          connectionStatusChangeCallback}) {
    openVPNEngine = OpenVPN(
      onVpnStatusChanged: (data) {
        if (data?.connectedOn != null) {
          _errorComplete = false;
          connectionStatusChangeCallback.call(data, false);
        }
      },
      onVpnStageChanged: (stage, rawStage) {
        if (!_errorComplete &&
            (stage == VPNStage.denied ||
                stage == VPNStage.error ||
                stage == VPNStage.exiting)) {
          connectionStatusChangeCallback.call(null, true);
          _errorComplete = true;
        }
      },
    );
    openVPNEngine.initialize(
      groupIdentifier: ZappVpnCreds.groupIdentifier,
      localizedDescription: ZappVpnCreds.localizedDescription,
      providerBundleIdentifier: ZappVpnCreds.providerBundleIdentifier,
    );
  }

  void connect() {
    openVPNEngine.connect(
      vpnConfig,
      "USA",
      // certIsRequired: true,
      password: ZappVpnCreds.defaultPassword,
      username: ZappVpnCreds.defaultUsername,
    );
  }

  void disconnected() async {
    openVPNEngine.disconnect();
  }
}
