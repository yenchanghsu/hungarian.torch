package = "hungarian"
version = "scm-1"

source = {
   url = "git://github.com/yenchanghsu/hungarian.torch.git",
   tag = "master"
}

description = {
   summary = "hungarian algorithm",
   detailed = [[
   ]],
   homepage = "https://github.com/yenchanghsu/hungarian.torch",
   license = "BSD"
}

dependencies = {
   "torch >= 7.0",
}

build = {
   type = "command",
   build_command = [[
cmake -E make_directory hungarian.torch/build;
cd hungarian.torch/build;
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="$(LUA_BINDIR)/.." -DCMAKE_INSTALL_PREFIX="$(PREFIX)"; 
$(MAKE)
   ]],
   install_command = "cd hungarian.torch/build && $(MAKE) install"
}