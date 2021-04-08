let process output_file =
  let f = open_out output_file in
  List.iter (fun (n, s) -> output_string f @@ Printf.sprintf "let %s = Z.of_string \"%d\"\n" s n) Data.naturals;
  List.iter (fun (n, s) -> output_string f @@ Printf.sprintf "let %s = Z.(pow (of_string \"10\") %d)\n" s n) Data.magnatidues;
  List.iter (fun (n, s) -> output_string f @@ Printf.sprintf "let p2_%s = Z.(pow (of_string \"2\") %d)\n" s n) Data.powers;
  output_string f @@ Printf.sprintf "let byte = Z.of_string \"8\"\n";
  List.iter (fun (n, s) -> output_string f @@ Printf.sprintf "let %s = Z.(mul (of_string \"8\") @@ pow (of_string \"1024\") %d)\n" s n) Data.bytes;
  close_out f

open Cmdliner

let output_file =
  let doc = "What file to write the output to." in
  let env = Arg.env_var "OUTPUT" in
  Arg.(required & pos 0 (some string) None & info [] ~env ~docv:"OUTPUT" ~doc)

let gen = Term.(const process $ output_file)

let () = Term.(exit @@ eval (gen, Term.info "gen"))
