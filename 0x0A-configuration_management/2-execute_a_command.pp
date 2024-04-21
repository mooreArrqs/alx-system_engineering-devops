# creating a manifest that kills a process named killmenow
exec { 'killmenow':
  command  => 'pkill killmenow',
  path    => '/bin:/usr/bin',
  onlyif  => 'pgrep killmenow',
  provider  => 'shell',
  returns  => [0, 1],
}
