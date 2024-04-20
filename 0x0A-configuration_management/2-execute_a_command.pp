# creating a manifest that kills a process named killmenow
exec { 'killmenow':
  command  => 'usr/bin/pkill killmenow',
  from  => 'shell',
  returns  => [0, 1],
}
