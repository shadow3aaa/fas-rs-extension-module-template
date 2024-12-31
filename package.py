#!/usr/bin/env python3
#
# Copyright 2023 shadow3aaa@gitbub.com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import os
import shutil
import zipfile

script_dir = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_dir)

output_temp_dir = os.path.join("output", ".temp")
if os.path.exists(output_temp_dir):
    shutil.rmtree(output_temp_dir)
os.makedirs(output_temp_dir, exist_ok=True)

shutil.copytree("module", output_temp_dir, dirs_exist_ok=True)
shutil.copy("main.lua", output_temp_dir)

module_prop_path = os.path.join(output_temp_dir, "module.prop")
with open(module_prop_path, "r") as f:
    for line in f:
        if line.startswith("name="):
            package_name = line.split("=", 1)[1].strip() + ".zip"
            break

output_package_path = os.path.join("output", package_name)
if os.path.exists(output_package_path):
    os.remove(output_package_path)

with zipfile.ZipFile(output_package_path, "w", zipfile.ZIP_DEFLATED) as zipf:
    for root, dirs, files in os.walk(output_temp_dir):
        for file in files:
            file_path = os.path.join(root, file)
            arcname = os.path.relpath(file_path, output_temp_dir)
            zipf.write(file_path, arcname)

print(f"Module packaged: {os.path.abspath(output_package_path)}")
