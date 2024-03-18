import os, re, subprocess

# get the path to the directory that this script resides in
script_dir = os.path.dirname(os.path.abspath(__file__))

output_filename = "download_list.txt"
output_filepath = script_dir + '\\' + output_filename

def find_expr_in_html(expr, html):
    return re.findall(expr, html, re.S)

pattern = r"(?<=youtu\.be\/)[\w-]+"
pattern2 = r"(?<=youtube\.com\/watch\?v=)[\w-]+"

with open(output_filepath) as file:
    lines = [line.rstrip() for line in file]
    
    for line in lines:
        print(line)

        yt_id = None
        match = re.search(pattern, line)
        if match:
            yt_id = match.group()
        else:
            match = re.search(pattern2, line)
            if match:
                yt_id = match.group()

        if yt_id:
            print(yt_id)
            subprocess.check_call([script_dir + r'\yt-dlp.exe', '-o', yt_id])

        print('')
    
