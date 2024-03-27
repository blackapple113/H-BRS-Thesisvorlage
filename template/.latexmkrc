add_cus_dep('glo', 'gls', 0, 'run_makeglossaries');
add_cus_dep('acn', 'acr', 0, 'run_makeglossaries');

sub run_makeglossaries {
    my ($base_name, $path) = fileparse( $_[0] ); #handle -outdir param by splitting path and file, ...
    pushd $path; # ... cd-ing into folder first, then running makeglossaries ...

    if ($^O =~ /win/i) { # if windows
        system "makeglossaries", "$base_name"; #windows
    }
    elsif ($^O =~ /darwin/i || $^O =~ /linux/i) { # if mac or linux
        system "makeglossaries '$base_name'"; #unix
    }
    else {
        print "Unknown operating system while trying to make glossaries\n";
    }

    popd; # ... and cd-ing back again
}

push @generated_exts, 'glo', 'gls', 'glg';
push @generated_exts, 'acn', 'acr', 'alg';
$clean_ext .= ' %R.ist %R.xdy';