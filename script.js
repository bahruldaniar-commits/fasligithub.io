/* ===== JavaScript Interaktif ===== */
(() => {
  // Ambil semua panel step
  const panels = [...document.querySelectorAll(".step-panel")];
  let step = 0; // posisi step sekarang
  const bar = document.getElementById("bar"); // progress bar
  const next = document.getElementById("nextBtn");
  const prev = document.getElementById("prevBtn");
  const submit = document.getElementById("submitBtn");
  const form = document.getElementById("formPMB");
  const summary = document.getElementById("summary");

  // Fungsi untuk menampilkan step tertentu
  function showPanel(i){
    panels.forEach((p,n)=>p.classList.toggle("active",n===i));
    step = i;
    // Update progress bar
    bar.style.width = (i/(panels.length-1))*100+"%";
    // Atur tombol prev / next / submit
    prev.style.visibility = i===0?"hidden":"visible";
    next.style.display = i===panels.length-1?"none":"inline-block";
    submit.style.display = i===panels.length-1?"inline-block":"none";
    // Jika step terakhir, buat ringkasan data
    if(i===panels.length-1) makeSummary();
  }

  // Fungsi validasi form
  function validate(i){
    const panel = panels[i];
    const req = panel.querySelectorAll("[required]");
    const err = panel.querySelector(".error");
    err.style.display="none"; err.textContent="";
    for(const el of req){
      if(el.type==="checkbox" && !el.checked){
        err.textContent="Harap centang konfirmasi."; err.style.display="block"; return false;
      }
      if(el.type==="file" && el.files.length===0){
        err.textContent="File wajib diunggah."; err.style.display="block"; return false;
      }
      if(!el.value){
        err.textContent="Mohon lengkapi field wajib."; err.style.display="block"; return false;
      }
    }
    return true;
  }

  // Ringkasan data sebelum submit
  function makeSummary(){
    const data = new FormData(form);
    let out = "<ul>";
    for(let [k,v] of data.entries()){
      if(v instanceof File){ v = v.name || "(file)"; }
      out += `<li><b>${k}</b>: ${v}</li>`;
    }
    out += "</ul>";
    summary.innerHTML = out;
  }

  // Tombol next
  next.onclick=()=>{ if(validate(step)) showPanel(step+1); };
  // Tombol prev
  prev.onclick=()=> showPanel(step-1);

  // Submit form
  form.onsubmit=(e)=>{
    e.preventDefault();
    if(!validate(step)) return;
    alert("Form berhasil dikirim (demo).");
    form.reset();       // reset semua input
    showPanel(0);       // kembali ke step pertama
    bar.style.width = "0%"; // reset progress bar
  };

  // Tampilkan step awal
  showPanel(0);
})();
