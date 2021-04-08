(lang dune 2.7)
(name literary_zarith)

(generate_opam_files true)

(source (github unrealakama/literary_zarith))
(license MIT)
(authors "Adam Ringwood")
(maintainers "adam@nexadmin.com")

(package
 (name literary_zarith)
 (synopsis "A library for full spelled out zarith numbers.")
 (description "Allows for for full spelled out zarith numbers.")
 (depends
  (dune (> 2.7))
  (zarith (> 1.9))
  (rresult (> 0.6))
  (fmt (> 0.8.7))))
