#!env python3

import re
import os

def is_id_ch(ch):
    return (ch == '_') or (ch >= '0' and ch <= '9') or \
        (ch >= 'a' and ch <= 'z') or \
        (ch >= 'A' and ch <= 'Z')

def parse_expr(exp_str):
    state = 0
    char_idx = 0
    curr_id = ''
    expr_stack = []

    while char_idx < len(exp_str):
        ch = exp_str[char_idx]
        if state == 0:
            if is_id_ch(ch):
                curr_id = ch
                state = 1
                char_idx += 1
            elif ch == '|':
                state = 3
                char_idx += 1
            elif ch == '&':
                state = 4
                char_idx += 1
            elif ch != ' ':
                print("Unexpected char {}".format(ch))
            else:
                char_idx += 1
        elif state == 1:
            if is_id_ch(ch):
                curr_id += ch
                char_idx += 1
            elif ch == ')':
                expr_stack.append(["not", curr_id])
                curr_id = ''
                state = 0
                char_idx += 1
            else:
                if curr_id == "NOT":
                    state = 2
                else:
                    state = 0
                    expr_stack.append(["id", curr_id])
                    curr_id = ''
        elif state == 2:
            if ch == '(':
                state = 0
                char_idx += 1
            elif ch != ' ':
                print("Got {} instead of ( for NOT".format(ch))
                return None
            else:
                char_idx += 1
        elif state == 3:
            if ch == '|':
                expr_stack.append(["or"])
                state = 0
                char_idx += 1
            else:
                print("Expected another | after |")
                return None
        elif state == 4:
            if ch == '&':
                expr_stack.append(["and"])
                char_idx += 1
                state = 0
            else:
                print("Expected another & after &")
                return None

    if len(curr_id) > 0:
        expr_stack.append(["id", curr_id])

    return expr_stack

def simplify_expr(expr_list):
# There is a pattern of READY && something && something || NOT(READY)
# This can be simplified by removing the READY && on the left and the
# || NOT(READY) on the right
    if len(expr_list) > 2 and expr_list[-2:] == [['or'], ['not', 'READY']] and \
        expr_list[0] == ['id', 'READY'] and expr_list[1] == ['and']:
        expr_list = expr_list[2:-2]

    return expr_list
    
    
def print_state(state_name, state_trans, state_map, f):
    if state_name == "ms_bug":
        return
    print("    state {} {{".format(state_name), file=f)
    print("        on eReset do {", file=f)
    print("            send client, eReset;", file=f)
    print("            goto ms_initial_state;", file=f)
    print("        }", file=f)
    print("        on eToken do (t: tToken) {", file=f)
    indent = "            "
    first = True
    for st in state_trans:
        if first:
            print("{}if (".format(indent), file=f, end='')
            first = False
        else:
            print("{}}} else if (".format(indent), file=f, end='')
        for item in st[1]:
            if item == ["and"]:
                print(" && ", file=f, end='')
            elif item == ["or"]:
                print(" || ", file=f, end='')
            elif item == ["id", "READY"]:
                print("t.ready", file=f, end='')
            elif item == ["not", "READY"]:
                print("!t.ready", file=f, end='')
            elif item[0] == "id":
                print("t.cmd == {}".format(item[1].lower()), file=f, end='')
            elif item[0] == "not":
                print("t.cmd != {}".format(item[1].lower()), file=f, end='')
        print(") {", file=f)
        if state_map[st[0]].lower() != "ms_bug":
            print("{}    send client, eToken, t;".format(indent, state_map[st[0]].lower()), file=f)
        print("{}    goto {};".format(indent, state_map[st[0]].lower()), file=f)
#    print("                }", file=f)
    print("            }", file=f)
    print("        }", file=f)
    print("    }", file=f)

def run():
    state_def_re = re.compile("([^-[]*)\\[label=\"(.*)\"\\]")
    state_trans_re = re.compile("([^-]*)->([^[]*)\\[label=\"(.*)\"\\]")

    state_map = {}
    states = {}
    state_list = []

    f = open("vspell-fsm-explicit-cooked.dot", 'r')
    for line in f:
        line = line.strip()
        m = state_def_re.match(line)
        if m is not None:
            state_id = m.group(1)
            state_label = m.group(2)
            state_name = state_label.lower()
            state_map[state_id] = state_name
            state_list.append(state_name)
            states[state_name] = []
            continue
        m = state_trans_re.match(line)
        if m is not None:
            from_state = m.group(1)
            to_state = m.group(2)
            trans_label = m.group(3)
            from_state_name = state_map[from_state]
            parsed_expr = parse_expr(trans_label)
            simplified = simplify_expr(parsed_expr)
            states[from_state_name].append([to_state, simplified])
    f.close()

    os.makedirs("PSrc", exist_ok=True)
    nand_out = open("PSrc/RuntimeMonitor.p", "w")
    nand_in = open("nand_header.txt", "r")
    nand_out.write(nand_in.read())
    nand_in.close()

    for s in state_list:
        state = states[s]
        print_state(s, state, state_map, nand_out)

    print("}", file=nand_out)

    nand_out.close()
if __name__ == "__main__":
    run()
