# Practicing Question of OPPE-1-T1-2026
BEGIN {
    FS = ","
}

NR > 1 {
    id = $1
    name = $2
    m_id = $3

    name_map[id] = name

    # count direct subordinates for manager_id
    if (m_id != 0) {
        direct[m_id]++
    }
}

END {
    for (i in name_map) {
        print i, name_map[i], direct[i] + 0
    }
}