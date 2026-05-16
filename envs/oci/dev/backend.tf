terraform {
  backend "oci" {
    bucket    = "terraform-state"
    namespace = "greg14puj5pf"
    region    = "sa-saopaulo-1"
    auth      = "APIKey"

    tenancy_ocid = "ocid1.tenancy.oc1..aaaaaaaa34ocb7aczq5apkbzddkp6x3tmazt7djst6ixsvlap372i4jpjroa"
    user_ocid    = "ocid1.user.oc1..aaaaaaaaucpxpo2mevirlsyc3fxcsj2d2yglzhtxlinjehec3y65tlnpjowa"
    fingerprint  = "27:67:a1:25:7a:bc:6c:c6:d5:7e:69:4f:86:16:33:b1"
  }
}
