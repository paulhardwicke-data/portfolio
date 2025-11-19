
import os,json,re
from pathlib import Path
from PIL import Image
root=Path('.')
assets=root/'assets'/'images'
thumbs=assets/'thumbs'
thumbs.mkdir(parents=True,exist_ok=True)
categories=['education','azure','commendations']
manifest={cat:[] for cat in categories}
def human_label(fn):
    base=Path(fn).stem
    label=re.sub(r'[-_]+',' ',base)
    label=re.sub(r'\s+',' ',label).strip()
    return label.title()
def make_thumb(src,dest,max_w=480):
    dest.parent.mkdir(parents=True,exist_ok=True)
    with Image.open(src) as im:
        im=im.convert('RGB')
        w,h=im.size
        if w>max_w:
            ratio=max_w/float(w)
            im=im.resize((max_w,int(h*ratio)),Image.LANCZOS)
        im.save(dest,'JPEG',quality=85)
for cat in categories:
    src_dir=assets/cat
    if not src_dir.exists():continue
    for ext in('*.jpg','*.jpeg','*.png'):
        for img_path in src_dir.glob(ext):
            thumb_name=img_path.stem+'_thumb.jpg'
            thumb_path=thumbs/cat/thumb_name
            try:make_thumb(img_path,thumb_path)
            except Exception as e:print(f'Failed {img_path}: {e}')
            item={'file':img_path.name,'src':str((assets/cat/img_path.name).as_posix()),'thumb':str(thumb_path.as_posix()),'label':human_label(img_path.name),'alt':human_label(img_path.name)}
            manifest[cat].append(item)
for cat in categories:manifest[cat]=sorted(manifest[cat],key=lambda x:x['file'].lower())
with open(assets/'manifest.json','w',encoding='utf-8') as f:json.dump(manifest,f,indent=2)
print('Thumbnails built and manifest.json written to assets/images/')
