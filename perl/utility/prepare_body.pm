# BluefinPayconex SDK utility: prepare_body

use strict;
use warnings;

package BluefinPayconexUtilities;

our %REGISTRY;

$REGISTRY{prepare_body} = sub {
  my ($ctx) = @_;
  return ('data' eq $ctx->{op}{input})
    ? $ctx->{utility}{transform_request}->($ctx)
    : undef;
};

1;
