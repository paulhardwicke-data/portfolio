
async function loadManifest(){
  try{
    const res = await fetch('assets/images/manifest.json');
    if(!res.ok) throw new Error('manifest not found');
    return await res.json();
  }catch(e){
    console.warn('No manifest yet. Run `python build_thumbnails.py`.', e);
    return {education:[],azure:[],commendations:[]};
  }
}
function makeTile(item){
  const fig=document.createElement('figure');
  const img=document.createElement('img');
  img.loading='lazy';img.alt=item.alt||item.label||item.file;img.src=item.thumb;img.dataset.full=item.src;
  const cap=document.createElement('figcaption');cap.textContent=item.label||item.file;
  fig.appendChild(img);fig.appendChild(cap);
  fig.addEventListener('click',()=>openModal(img.dataset.full,cap.textContent));
  return fig;
}
function renderGallery(id,items){const el=document.querySelector(`#${id} .grid`);if(!el)return;el.innerHTML='';items.forEach(i=>el.appendChild(makeTile(i)));}
function openModal(src,caption){const modal=document.querySelector('.modal');const img=modal.querySelector('img');const cap=modal.querySelector('.modal-caption');img.src=src;cap.textContent=caption;modal.classList.add('open');}
function closeModal(){document.querySelector('.modal').classList.remove('open');}
window.addEventListener('DOMContentLoaded',async()=>{const data=await loadManifest();renderGallery('education',data.education||[]);renderGallery('azure',data.azure||[]);renderGallery('commendations',data.commendations||[]);document.querySelector('.close').addEventListener('click',closeModal);document.querySelector('.modal').addEventListener('click',(e)=>{if(e.target.classList.contains('modal'))closeModal();});});
