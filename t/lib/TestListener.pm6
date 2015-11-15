class TestListener does Pod::NodeListener {
    has @.events;

    multi method start (Pod::Block::Code $node) {
        @.events.push( { :start, :type('code') :allowed($node.allowed) } );
    }
    multi method end (Pod::Block::Code $node) {
        @.events.push( { :end, :type('code'), :allowed($node.allowed) } );
    }

    multi method start (Pod::Block::Comment $node) {
        @.events.push( { :start, :type('comment') } );
    }
    multi method end (Pod::Block::Comment $node) {
        @.events.push( { :end, :type('comment') } );
    }

    multi method start (Pod::Block::Declarator $node) {
        @.events.push( { :start, :type('declarator'), :wherefore($node.WHEREFORE) } );
    }
    multi method end (Pod::Block::Declarator $node) {
        @.events.push( { :end, :type('declarator'), :wherefore($node.WHEREFORE) } );
    }

    multi method start (Pod::Block::Named $node) {
        @.events.push( { :start, :type('named'), :name($node.name) } );
    }
    multi method end (Pod::Block::Named $node) {
        @.events.push( { :end, :type('named'), :name($node.name) } );
    }

    multi method start (Pod::Block::Para $node) {
        @.events.push( { :start, :type('para') } );
    }
    multi method end (Pod::Block::Para $node) {
        @.events.push( { :end, :type('para') } );
    }

    multi method start (Pod::Block::Table $node) {
        @.events.push( { :start, :type('table'), :caption($node.config<caption>), :headers($node.headers)} );
    }
    method table-row (Array $row) {
        @.events.push( { :table-row($row) } );
    }
    multi method end (Pod::Block::Table $node) {
        @.events.push( { :end, :type('table') } );
    }

    multi method start (Pod::FormattingCode $node) {
        @.events.push( { :start, :type('formatting-code'), :code-type($node.type), :meta($node.meta) } );
    }
    multi method end (Pod::FormattingCode $node) {
        @.events.push( { :end, :type('formatting-code'), :code-type($node.type), :meta($node.meta) } );
    }

    multi method start (Pod::Heading $node) {
        @.events.push( { :start, :type('heading'), :level($node.level) } );
    }
    multi method end (Pod::Heading $node) {
        @.events.push( { :end, :type('heading'), :level($node.level) } );
    }

    multi method start (Pod::Item $node) {
        @.events.push( { :start, :type('item'), :level($node.level) } );
    }
    multi method end (Pod::Item $node) {
        @.events.push( { :end, :type('item'), :level($node.level) } );
    }

    multi method start (Pod::Raw $node) {
        @.events.push( { :start, :type('raw'), :target($node.target) } );
    }
    multi method end (Pod::Raw $node) {
        @.events.push( { :end, :type('raw'), :target($node.target) } );
    }

    method config (Pod::Config $node) {
        @.events.push( { :config-type($node.type), :config($node.config) } );
    }

    method text (Str $text) {
        @.events.push( { :text($text) } );
    }
}
