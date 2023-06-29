enum eCommand {
    c_zero,
    c_read_setup,
    c_read_execute,
    c_program_setup,
    c_program_execute,
    c_erase_setup,
    c_erase_execute,
    c_dummy
}

type tToken = (cmd: eCommand, ready: bool);

event eToken : tToken;
event eReset;

machine RuntimeMonitor
{
    var client: machine;

    start state Init {
      entry (cl: machine) {
        client = cl;
        goto ms_initial_state;
      }
    }
    state ms_bug {
        on eToken do (t: tToken) {
           if (t.cmd == c_read_setup && t.ready) {
                send client, eToken, t;
                goto ms_read_awaiting_block_address;
            } else if (t.cmd == c_program_setup && t.ready) {
                send client, eToken, t;
                goto ms_program_awaiting_block_address;
            } else if (t.cmd == c_erase_setup && t.ready) {
                send client, eToken, t;
                goto ms_erase_awaiting_block_address;
            }
        }
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
    }

    state ms_initial_state {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_awaiting_block_address;
            } else if (t.cmd == c_erase_setup) {
                send client, eToken, t;
                goto ms_erase_awaiting_block_address;
            } else if (t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_block_address;
            } else if (t.cmd != c_read_setup && t.cmd != c_program_setup && t.cmd != c_erase_setup) {
                goto ms_bug;
            }
        }
    }
    state ms_read_awaiting_block_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_read_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_page_address;
            }
        }
    }
    state ms_read_awaiting_page_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_read_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_byte_address;
            }
        }
    }
    state ms_read_awaiting_byte_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_read_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_execute;
            }
        }
    }
    state ms_read_awaiting_execute {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_read_execute && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_read_execute) {
                send client, eToken, t;
                goto ms_read_providing_data;
            }
        }
    }
    state ms_read_providing_data {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_dummy && t.cmd != c_read_execute && t.cmd != c_read_setup && t.cmd != c_program_setup && t.cmd != c_erase_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_awaiting_block_address;
            } else if (t.ready && t.cmd == c_erase_setup) {
                send client, eToken, t;
                goto ms_erase_awaiting_block_address;
            } else if (t.ready && t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_block_address;
            } else if (t.ready && t.cmd == c_read_execute) {
                send client, eToken, t;
                goto ms_read_providing_data;
            } else if (t.ready && t.cmd == c_dummy) {
                send client, eToken, t;
                goto ms_read_providing_data;
            }
        }
    }
    state ms_program_awaiting_block_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_program_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_awaiting_page_address;
            }
        }
    }
    state ms_program_awaiting_page_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_program_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_awaiting_byte_address;
            }
        }
    }
    state ms_program_awaiting_byte_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_program_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_accepting_data;
            }
        }
    }
    state ms_program_accepting_data {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_dummy && t.cmd != c_program_execute && t.cmd != c_read_setup && t.cmd != c_program_setup && t.cmd != c_erase_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_awaiting_block_address;
            } else if (t.ready && t.cmd == c_erase_setup) {
                send client, eToken, t;
                goto ms_erase_awaiting_block_address;
            } else if (t.ready && t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_block_address;
            } else if (t.ready && t.cmd == c_program_execute) {
                send client, eToken, t;
                goto ms_program_accepting_data;
            } else if (t.ready && t.cmd == c_dummy) {
                send client, eToken, t;
                goto ms_program_accepting_data;
            }
        }
    }
    state ms_erase_awaiting_block_address {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd == c_erase_setup) {
                send client, eToken, t;
                goto ms_erase_awaiting_execute;
            } else if (t.ready && t.cmd != c_erase_setup && !t.ready) {
                goto ms_bug;
            }
        }
    }
    state ms_erase_awaiting_execute {
        on eReset do {
            send client, eReset;
            goto ms_initial_state;
        }
        on eToken do (t: tToken) {
            if (t.ready && t.cmd != c_erase_execute && t.cmd != c_read_setup && t.cmd != c_program_setup && t.cmd != c_erase_setup && !t.ready) {
                goto ms_bug;
            } else if (t.ready && t.cmd == c_program_setup) {
                send client, eToken, t;
                goto ms_program_awaiting_block_address;
            } else if (t.ready && t.cmd == c_erase_setup) {
                send client, eToken, t;
                goto ms_erase_awaiting_block_address;
            } else if (t.ready && t.cmd == c_read_setup) {
                send client, eToken, t;
                goto ms_read_awaiting_block_address;
            } else if (t.ready && t.cmd == c_erase_execute) {
                send client, eToken, t;
                goto ms_erase_awaiting_execute;
            }
        }
    }
}
