class postgresql::v9-0 {
  case $operatingsystem {
    Debian: {
      case $lsbdistcodename {
        squeeze : { include postgresql::debian::v9-1 }
        default:  { fail "postgresql 9.1 not available for ${operatingsystem}/${lsbdistcodename}"}
      }
    }
    default: { notice "Unsupported operatingsystem ${operatingsystem}" }
  }
}
