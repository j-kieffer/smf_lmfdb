from sage.all import (prime_range, nth_prime, is_square)
from smf_lmfdb.db_tables.common_populate import MAX_P, table_reload_plain, write_data_from_files
from smf_lmfdb.db_tables.smf_newforms_populate import make_orbit_code

from lmfdb import db

def entry_add_columns(e, ext_data):
    e['id'] = ext_data['id']
    return e

def get_form_entries(g, F, N, k, j, orb):
    entries = []
    e = {'hecke_orbit_code' : make_orbit_code(g, F, N, k, j, 1, orb)}
    f = db.smf_newforms.lucky(e, ['trace_lambda_p'])
    aps = f['trace_lambda_p']
    max_p = min(MAX_P, nth_prime(len(aps)))
    if (k == 20) and (j == 0) and (N == 1):
        max_p = 19
    for n,p in enumerate(prime_range(1,max_p+1)):
        e['n'] = p
        e['trace_an'] = aps[n-1]
        entries.append(e.copy())
    return entries
    
def create_entries(triple_list):
    entries = []
    for triple in triple_list:
        k,j,N = triple
        if (j % 2 == 1) or (k == 1):
            continue
        # right now we only have implemented forms for full level
        if (N == 1):
            for F in ['K', 'S', 'P']:
                query = {'hecke_orbit_code' : make_orbit_code(2, F, N, k, j, 1, 1)}
                num_orbits = db.smf_newspaces.lucky(query, ['num_forms'])['num_forms']
                for i in range(num_orbits):
                    entries += get_form_entries(2, F, N, k, j, i+1)
        # manually adding (3,0,N)
        if (not is_square(N)) and (k == 3) and (j == 0) and (N < 1000):
            query = {'hecke_orbit_code' : make_orbit_code(2, 'K', N, k, j, 1, 1)}
            num_orbits = db.smf_newspaces.lucky(query, ['num_forms'])['num_forms']
            for i in range(num_orbits):
                entries += get_form_entries(2, 'K', N, k, j, i+1)
    return entries

def populate_smf_hecke_traces(triple_list):
    table = db.smf_hecke_traces
    aux_fname = "smf_lmfdb/db_tables/smf_hecke_traces_table.dat"
    entries = create_entries(triple_list)
    table_reload_plain(table, entries, entry_add_columns, aux_fname, "hecke_traces")
    return

def update_codes(idx, hecke_traces_folder, orbit_code_dict):
    hecke_traces_file = open(hecke_traces_folder + str(idx))
    hecke_traces_data = eval(hecke_traces_file.read())
    hecke_traces_file.close()
    hecke_traces_data['hecke_orbit_code'] = orbit_code_dict[hecke_traces_data['hecke_orbit_code']]
    hecke_traces_file = open(hecke_traces_folder + str(idx), "w")
    hecke_traces_file.write(str(hecke_traces_data))
    hecke_traces_file.close()
    return

def update_all_codes(hecke_traces_folder, orbit_code_dict):
    table = db.smf_hecke_traces
    aux_fname = "smf_lmfdb/db_tables/smf_hecke_traces_table.dat"
    for idx in range(table.count()):
        print("updating codes for idx =  ", idx, "out of ", table.count())
        update_codes(idx, hecke_traces_folder, orbit_code_dict)
    write_data_from_files(table, aux_fname, hecke_traces_folder)
    table.reload(aux_fname, null="NULL")
    return
