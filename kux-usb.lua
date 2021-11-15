-- Copyright 2021 kaigonzalez
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--     http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function KuxB()
    print("kuxUSB: Kux for micro computers.")

    print("disclaim: no 'cd' or 'ls' or 'clear'.")

    while (true) do

        io.write(":$ ")

        local inp = io.read()

        local tab = split(inp, " ");

        if not pcall(function() 
            require("dsh." + tab[0]):main(tab)
        end) then
            print("error: error in command")
        end
        
    end
end

KuxB()