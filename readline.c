// build@ cc -shared readline.c -o readline.so
// Completely and absolutely minimal binding to the readline library
// 2011 Reuben Thomas <rrt@sc3d.org>
// Steve Donovan, 2007
#include <stdlib.h>
#include "lua.h"
#include "lauxlib.h"
#include <readline/readline.h>
#include <readline/history.h>

static int f_readline (lua_State *L) {

    const char* prompt = lua_tostring(L,1);
    char* line = readline(prompt);
    lua_pushstring(L, line);
    free((char*)line); // Lua makes a copy...
    return 1;
};

static int f_add_history (lua_State *L) {

    const char* line = lua_tostring(L,1);
    add_history(line);
    return 0;
};

static const luaL_Reg lib[] = {
	{"readline", f_readline},
    {"add_history", f_add_history},
	{NULL, NULL},
};

int luaopen_readline (lua_State *L) {
    luaL_newlib (L, lib);
	return 1;
};