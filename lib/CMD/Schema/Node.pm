
package CMD::Schema::Node;

use strict;
use warnings;

use base qw( DBIx::Class );

__PACKAGE__->load_components(qw/Tree::AdjacencyList PK::Auto Core/);
__PACKAGE__->table('nodes');
__PACKAGE__->add_columns(
    node_id   => { is_auto_increment => 1,         data_type   => 'integer' },
    parent_id => { data_type         => 'integer' },
    position  => { data_type         => 'integer' },
    lft       => { data_type         => 'integer' },
    rgt       => { data_type         => 'integer' },
    content   => { data_type         => 'varchar' },
    valor     => { data_type         => 'double' },
    codigo    => { data_type         => 'varchar' },
    funcao    => { data_type         => 'varchar' },
    subfuncao => { data_type         => 'varchar' },
    estado    => { data_type         => 'varchar', is_nullable => 1 },
    codmunicipio => { data_type => 'varchar', is_nullable => 1 },
    municipio    => { data_type => 'varchar', is_nullable => 1 },
    # TODO: tt_ini/tt_fim
    ano         => { data_type => 'int' },
);

__PACKAGE__->set_primary_key('node_id');
__PACKAGE__->parent_column('parent_id');
__PACKAGE__->repair_tree(1);

__PACKAGE__->belongs_to( bases_nodes => 'CMD::Schema::BaseNode' =>
      { 'foreign.node_id' => 'self.node_id' } );

=head1 AUTHOR

Thiago Rondon, C<< <thiago.rondon at gmail.com> >>

=cut

1;

