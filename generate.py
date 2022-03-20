logos_to_create = [
    {
        'name': 'logo_base.svg',
        'color-1': '#b50c36',
        'color-2': 'black',
        'color-3': '#aaaaaa',
        'color-4': 'black',
    },
    {
        'name': 'logo_base_white.svg',
        'color-1': 'white',
        'color-2': 'white',
        'color-3': 'white',
        'color-4': 'white',
    },
    {
        'name': 'logo_base_white-colored.svg',
        'color-1': '#b50c36',
        'color-2': 'white',
        'color-3': '#aaaaaa',
        'color-4': 'white',
    },
    {
        'name': 'logo_base_black.svg',
        'color-1': 'black',
        'color-2': 'black',
        'color-3': 'black',
        'color-4': 'black',
    },
]

name = "logo_base.template"

for one_logo in logos_to_create:
    with open(name, "r") as f:
        filedata = f.read()

    filedata = filedata.replace('color-1', one_logo["color-1"])
    filedata = filedata.replace('color-2', one_logo["color-2"])
    filedata = filedata.replace('color-3', one_logo["color-3"])
    filedata = filedata.replace('color-4', one_logo["color-4"])

    with open(one_logo["name"], 'w') as file:
        file.write(filedata)
