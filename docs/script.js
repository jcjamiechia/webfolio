// ─── Project data ────────────────────────────────────────────────
const projects = [
  {
    image: 'assets/vrptw_slide1.png',
    title: 'Vehicle Routing Problem with Time Windows Applied to MRT Stations in Singapore',
    summary: 'Formulated a Vehicle Routing Problem with Time Windows (VRPTW) as a MILP to optimise parcel-delivery routes across all Singapore MRT stations.',
    subtitle: 'Optimised parcel-delivery routes to all MRT stations in Singapore, treating stations as high-coverage collection hubs.',
    company: '40.002 Optimisation',
    strategies: 'MILP formulation, route optimisation, time-window constraints, data visualisation',
    timeline: 'Feb 2026 – Apr 2026',
    tags: ['Data', 'Software'],
    tools: 'Python, Julia',
    description:
      "Singapore's dense urban transport network makes route planning especially complex when servicing many locations under delivery time windows. Combining the road network with a high density of stops makes routing optimisation both computationally challenging and practically valuable.\n\n" +
      'In this project, we addressed the Vehicle Routing Problem with Time Windows (VRPTW) by optimising parcel-delivery routes to all MRT stations in Singapore, treating the stations as collection hubs. MRT stations were chosen for their high accessibility and even coverage across the island — most customers live close to a station, letting them collect parcels conveniently during daily commutes while consolidating deliveries to fewer points.\n\n' +
      'We modelled the problem as a Mixed-Integer Linear Program (MILP) whose objective is to determine optimal vehicle routes that minimise total travel distance while ensuring every station is visited subject to demand and time-window constraints.',
    note: 'Slide 6 of the deck is an animation that could not be embedded in the slides/PDF — the looping route optimisation animation below shows it in full.',
    galleryTitle: 'Visualisation',
    gallery: [
      { src: 'assets/vrptw_route.gif', caption: 'Slide 6 — looping route optimisation animation across the MRT network.' },
    ],
    documents: [
      { title: 'Project Poster', url: 'https://drive.google.com/file/d/17Ri5JSjQp059i8K1kQXngNnSyYn8wsVV/preview' },
      { title: 'Presentation', url: 'https://drive.google.com/file/d/1VhONEfee0TDmVbXFE20aHak5JS2k36aB/preview' },
    ],
  },
  {
    image: 'assets/ecommerce_poster.png',
    title: 'Data Analytics for E-Commerce',
    summary: 'Forecasted SKU demand and designed a budget-constrained opening inventory for a new pharmacy, using 24 months of SwipeRx transaction data across 4,000+ SKUs.',
    subtitle: 'Built a demand forecast and an optimised opening assortment for a new pharmacy in Kota Jakarta Utara — balancing demand, category coverage, and a fixed budget.',
    company: '40.011 Data and Business Analytics',
    strategies: 'Data cleaning, exploratory analysis, demand forecasting (linear regression), SKU scoring, budget-constrained assortment',
    timeline: 'Feb 2026 – Apr 2026',
    tags: ['Data'],
    tools: 'Python, Julia',
    description:
      'SwipeRx operates the largest digital network for pharmacy professionals in Southeast Asia — over 300,000 professionals across 50,000 pharmacies. For a new pharmacy opening in Kota Jakarta Utara, we set out to forecast product demand for January 2026 and design an optimal opening inventory that stays within budget while ensuring category coverage and demand alignment.\n\n' +
      'Working from 24 months of transaction data spanning 4,000+ SKUs and 6,000+ pharmacies, we cleaned and aggregated the data, then explored purchasing trends and seasonality — finding an overall upward trend driven largely by growth in the number of active pharmacies.\n\n' +
      'We built a component-based forecast (reconstructing revenue from active pharmacies × quantity per pharmacy × implied price) using linear regression. It reached roughly 90% accuracy against actual January 2026 results and outperformed direct revenue forecasting. We then scored and ranked SKUs for the local market and assembled a category-balanced opening assortment within a fixed budget.',
    highlights: [
      'Forecast reached ~90% accuracy (4.76M predicted vs 4.83M actual units) for January 2026.',
      'Component-based forecasting outperformed direct revenue forecasting.',
      'Final assortment: 1,679 SKUs and 3,834 opening units within a ~$19,000 budget ($18,999.95 total cost).',
      'Team 13: Anchita Kharbanda, Daryl Cheong, Ezekiel Lim, Jamie Chia, Mayur Vengali.',
    ],
    gallery: [
      { src: 'assets/ecommerce_poster.png', caption: 'Project poster — full methodology and results.' },
      { src: 'assets/ecommerce_team.jpg', caption: 'Team 13.' },
    ],
    documents: [
      { title: 'Presentation', url: 'https://drive.google.com/file/d/1OvwsOnH_G2eLBTJ5XCJ2tUlpN4kkUcaI/preview' },
      { title: 'Presentation (v2)', url: 'https://drive.google.com/file/d/1VEvUrRnqz3Cb05qMU_GIq-ytOLzSx0Bc/preview' },
    ],
  },
  {
    image: 'assets/wbgtgroup.jpg',
    title: 'Solar Powered Wet Bulb Globe Thermometer',
    summary: 'Modified a WBGT monitor to be charged and powered by solar energy.',
    subtitle: 'Modified a WBGT monitor to be charged and powered by solar energy.',
    company: '10.023 Designing Energy System',
    strategies: 'Design, CAD, Energy and Power Analysis, User Research',
    timeline: 'May 2025 – Aug 2025',
    tags: ['Hardware', 'Design'],
    tools: 'Canva, Fusion360, Fritzing',
    description:
      'A Wet Bulb Globe Thermometer (WBGT) monitor modified to be charged and powered by solar energy, removing the need for mains power during outdoor heat-stress monitoring. The project covered the full design cycle — CAD enclosure design, energy and power analysis to size the solar panel and battery, and user research to shape the form factor.',
    productViews: [
      { label: 'Front', src: 'assets/wbgtfront.jpg', caption: 'Front view — solar panel and globe sensor.' },
      { label: 'Back', src: 'assets/wbgtback.jpg', caption: 'Rear housing and mounting.' },
      { label: 'Internals', src: 'assets/wbgtopen.jpg', caption: 'Internal electronics and wiring layout.' },
      { label: 'Testing', src: 'assets/wbgttesting.jpg', caption: 'Outdoor testing setup.' },
    ],
    documents: [
      { title: 'Final Report', url: 'https://drive.google.com/file/d/1VDEpza7Se055y-VaeX1hjCzBYmgYHcHt/preview' },
    ],
  },
  {
    image: 'assets/fabcat.jpg',
    title: 'FabCat',
    summary: 'Smart safety attire checker for the fabrication lab.',
    subtitle: 'Designed an AI Assisted Camera to identify Personal Protective Equipment (PPE).',
    company: '03.007 Design Thinking and Innovation',
    strategies: 'Design, CAD, Arduino, Python, User Research, Video Editing',
    timeline: 'Jan 2025 – Apr 2025',
    tags: ['Hardware', 'Software', 'Design'],
    tools: 'Canva, Blender, Adobe After Effects',
    description:
      'FabCat is a smart safety attire checker designed for fabrication lab environments. The project focuses on improving compliance and reducing human error through automated detection and feedback.',
    highlights: [
      'Won Sustainability Design Prize (Life Cycle Analysis)',
      'Combined hardware, software, and interface design into one system.',
    ],
    youtubeId: 'uq2iyMR6KBA',
    gallery: [
      { src: 'assets/fabcat_present1.jpg', caption: 'Final presentation.' },
      { src: 'assets/fabcat_present2.jpg', caption: 'Presenting the system and findings.' },
      { src: 'assets/fabcat_workshop.jpg', caption: 'Prototyping in the workshop.' },
      { src: 'assets/fabcat_esp32.jpg', caption: 'ESP32 + camera detection hardware.' },
      { src: 'assets/fabcat_team.jpg', caption: 'The FabCat team.' },
    ],
    documents: [
      { title: 'Presentation Slides', url: 'https://drive.google.com/file/d/1Bb26JtrMVajRe-tut0g1TLNbh0W01H14/preview' },
    ],
  },
  {
    image: 'assets/dtp3cover.jpg',
    title: 'Predicting Youth Interest in Hawker Culture',
    summary:
      'Built a multiple linear regression model to predict youth interest in becoming hawkers across Singapore.',
    subtitle:
      'Created a model to predict the number of youths who aspire to become hawkers across different areas in Singapore.',
    company: '10.022 Modelling Uncertainty',
    strategies: 'Data Sourcing & Cleaning, Evaluation Metric Design, Multilinear Regression',
    timeline: 'Jul 2025 – Aug 2025',
    tags: ['Data', 'Software'],
    tools: 'Excel, Python, PowerBI',
    description:
      "As students passionate about Singapore culture, we noticed that the sustainability of Singapore's hawker culture has become a serious concern as fewer youths show interest in pursuing hawking as a viable career. We built a model that predicts the number of youths (15–35) who aspire to become hawkers across different areas in Singapore, using multiple linear regression to quantify relationships between youth interest and socio-economic / environmental factors.",
    highlights: [
      'Shortlisted as Top 8 Best Design Thinking Projects.',
      'Used regression in Excel to measure correlation of variables.',
      'Considered a wide range of metrics to evaluate the model.',
    ],
    gallery: [{ src: 'assets/DTP3.jpg', caption: 'Project overview.' }],
    documents: [
      { title: 'Final Report',           url: 'https://drive.google.com/file/d/1_T0LXBQXUlAXcz8rKrWWJ2aq5dFGxw9a/preview' },
      { title: 'Data Analysis',           url: 'https://drive.google.com/file/d/12Q22PaYezzbuVzOYtLceYV3SQMScxGeQ8kN1FVzLrP8/preview' },
      { title: 'Why does our project matter?', url: 'https://drive.google.com/file/d/1hT_RDFFKfVYx8wSBt08P-5LpFU5jstyZ/preview' },
    ],
  },
];

// ─── Experience & Leadership data ────────────────────────────────
const experiences = [
  {
    title: 'Private Tuition Teacher', at: '@ Genius Mind',
    meta: 'Part-time · May 2024 – Mar 2026',
    tasks: [
      'Taught 4 students across lower & upper secondary Mathematics, English, and University Math.',
      "Curated personalised notes and practice questions tailored to each student's needs, contributing to a 30% improvement in final exam results.",
    ],
  },
  {
    title: 'Student Mentor', at: '@ STEAMunity',
    meta: 'Volunteer · Nov 2025 – Feb 2026',
    tasks: [
      'Mentored a group of 6 students in prototyping, storytelling, and pitching skills.',
    ],
    reflection: [
      { heading: 'What I did', body: 'Reflection placeholder — describe your role mentoring the group and the project they worked on.' },
      { heading: 'What I learned', body: 'Reflection placeholder — what did mentoring teach you about communication and guiding others?' },
    ],
    photos: [
      { src: 'assets/about.jpg', caption: 'Placeholder photo — replace with an image from STEAMunity.' },
    ],
  },
];

const leadership = [
  {
    title: 'Housing Representative', at: '@ 10th SUTD Student Association Council',
    meta: 'Student Representative · Apr 2026 – Present',
    tasks: [
      'Represented residential students on housing, welfare, infrastructure, and policy matters.',
      'Liaised with the Office of Housing to surface resident feedback and quality-of-life concerns.',
      'Tracked infrastructure issues and escalated recurring concerns for follow-up.',
      'Supported communication on housing policies, complaints, disciplinary matters, and admin updates.',
      'Worked with Residential College stakeholders to ensure resident concerns were clearly represented.',
    ],
    reflection: [
      { heading: 'Why this role matters to me', body: 'Reflection placeholder — share why representing residents and advocating for their needs is meaningful to you.' },
      { heading: 'What I learned', body: 'Reflection placeholder — what have you learned about policy, stakeholder management, or listening to a community?' },
    ],
    photos: [
      { src: 'assets/about.jpg', caption: 'Placeholder photo — replace with an image from this role.' },
    ],
  },
  {
    title: 'Senator', at: '@ SUTD House Guardians',
    meta: 'Residential Life & Internal Affairs · Nov 2025 – Present',
    tasks: [
      'Supported House Guardian operations, residential activities, and internal planning.',
      'Coordinated Mass Check-In, Residential Life Briefing, HG recruitment, Housing Allocation, and Open House support.',
      'Managed the House Guardian calendar across FE, IBE, HWE, and internal HG events.',
      'Served as an information point for HGs and residents on residential and admin matters.',
      'Supported HG continuity through recruitment, internal coordination, and communication with the Residential College House Committee.',
    ],
    reflection: [
      { heading: 'What I did', body: 'Reflection placeholder — describe the operations and events you supported as a Senator.' },
      { heading: 'What I learned', body: 'Reflection placeholder — what did coordinating across teams and events teach you?' },
    ],
    photos: [
      { src: 'assets/about.jpg', caption: 'Placeholder photo — replace with an image from House Guardians.' },
    ],
  },
  {
    title: 'Logistics Director', at: '@ SUTD Orientation 2025',
    meta: 'Committee Lead · Oct 2024 – May 2025',
    tasks: [
      'Led a subcommittee of 6 and collaborated with 8 other Directors to plan Orientation for 570 freshmen over an 8-month planning cycle.',
      'Liaised with the Office of Campus Infrastructure & Facilities and the Office of Student Life to request logistics and book venues.',
      'Managed acquisition of props and materials for programmes and games.',
      'Coordinated full set-up and tear-down operations for the event.',
    ],
    reflection: [
      { heading: 'What I did', body: 'Reflection placeholder — describe leading the logistics subcommittee for Orientation 2025.' },
      { heading: 'What I learned', body: 'Reflection placeholder — what did an 8-month planning cycle teach you about leadership and logistics?' },
    ],
    photos: [
      { src: 'assets/about.jpg', caption: 'Placeholder photo — replace with an image from Orientation 2025.' },
    ],
  },
];

// ─── Render project grid ────────────────────────────────────────
const grid = document.getElementById('projectGrid');
const chips = document.querySelectorAll('#filterChips .chip');
let activeTag = 'All';

function renderGrid() {
  const filtered = activeTag === 'All'
    ? projects
    : projects.filter(p => p.tags.includes(activeTag));

  grid.innerHTML = filtered.map((p, i) => `
    <article class="card" data-index="${projects.indexOf(p)}" style="--i:${i}">
      <div class="card-img"><img src="${p.image}" alt="${escapeHtml(p.title)}" loading="lazy" /></div>
      <div class="card-body">
        <h3 class="card-title">${escapeHtml(p.title)}</h3>
        <p class="card-summary">${escapeHtml(p.summary)}</p>
        <div class="card-tags">
          ${p.tags.map(t => `<span class="tag">${t}</span>`).join('')}
        </div>
        <span class="card-cta">View details <i class="fa-solid fa-arrow-right"></i></span>
      </div>
    </article>
  `).join('');

  grid.querySelectorAll('.card').forEach(card => {
    card.addEventListener('click', () => openProjectModal(+card.dataset.index));
  });

  grid.classList.remove('in');
  requestAnimationFrame(() => grid.classList.add('in'));
}

chips.forEach(chip => {
  chip.addEventListener('click', () => {
    chips.forEach(c => c.classList.remove('active'));
    chip.classList.add('active');
    activeTag = chip.dataset.tag;
    renderGrid();
  });
});

grid.classList.add('stagger');
renderGrid();

// ─── Render Experience & Leadership ─────────────────────────────
// Toggle to re-enable clickable detail pages (reflection + photos) once the
// reflection text and real photos are ready. The data above is kept either way.
const ENABLE_EXP_DETAIL = false;

function hasDetail(item) {
  if (!ENABLE_EXP_DETAIL) return false;
  return (item.reflection && item.reflection.length) || (item.photos && item.photos.length);
}

function renderExpList(containerId, items, kind) {
  const el = document.getElementById(containerId);
  if (!el) return;
  el.innerHTML = items.map((item, i) => `
    <div class="exp-item ${hasDetail(item) ? 'clickable' : ''}" data-kind="${kind}" data-index="${i}">
      <h3>${escapeHtml(item.title)} <span class="exp-at">${escapeHtml(item.at)}</span></h3>
      <p class="exp-meta">${escapeHtml(item.meta)}</p>
      <ul>${item.tasks.map(t => `<li>${escapeHtml(t)}</li>`).join('')}</ul>
      ${hasDetail(item) ? `<span class="exp-cta">Read reflection <i class="fa-solid fa-arrow-right"></i></span>` : ''}
    </div>
  `).join('');

  el.querySelectorAll('.exp-item.clickable').forEach(node => {
    node.addEventListener('click', () => {
      const list = node.dataset.kind === 'leadership' ? leadership : experiences;
      openExpModal(list[+node.dataset.index]);
    });
  });
}

renderExpList('experienceList', experiences, 'experience');
renderExpList('leadershipList', leadership, 'leadership');

// ─── Modal ──────────────────────────────────────────────────────
const modal = document.getElementById('modal');
const modalBody = document.getElementById('modalBody');

function normalizePhotos(arr) {
  return (arr || []).map(g => (typeof g === 'string' ? { src: g, caption: '' } : g));
}

function storyGallery(items) {
  const photos = normalizePhotos(items);
  if (!photos.length) return '';
  return `<div class="story-gallery">${photos.map(p => `
    <figure class="story-photo">
      <img src="${p.src}" alt="" loading="lazy" />
      ${p.caption ? `<figcaption>${escapeHtml(p.caption)}</figcaption>` : ''}
    </figure>`).join('')}</div>`;
}

function productViewer(views) {
  if (!views || !views.length) return '';
  const first = views[0];
  return `
    <div class="product-viewer" data-pv>
      <div class="pv-main"><img src="${first.src}" alt="" data-pv-main /></div>
      <p class="pv-caption" data-pv-caption>${escapeHtml(first.caption || '')}</p>
      <div class="pv-thumbs">
        ${views.map((v, i) => `
          <button class="pv-thumb ${i === 0 ? 'active' : ''}" data-src="${v.src}" data-caption="${escapeHtml(v.caption || '')}">
            <span class="pv-ring"><img src="${v.src}" alt="" /></span>
            <span class="pv-label">${escapeHtml(v.label)}</span>
          </button>`).join('')}
      </div>
    </div>`;
}

function bindProductViewer() {
  const pv = modalBody.querySelector('[data-pv]');
  if (!pv) return;
  const mainImg = pv.querySelector('[data-pv-main]');
  const cap = pv.querySelector('[data-pv-caption]');
  pv.querySelectorAll('.pv-thumb').forEach(btn => {
    btn.addEventListener('click', () => {
      pv.querySelectorAll('.pv-thumb').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      mainImg.src = btn.dataset.src;
      cap.textContent = btn.dataset.caption;
    });
  });
}

function openModalShell(html) {
  modalBody.innerHTML = html;
  modalBody.scrollTop = 0;
  modal.classList.add('open');
  modal.setAttribute('aria-hidden', 'false');
  document.body.style.overflow = 'hidden';
  bindImageZoom();
}

// ─── Lightbox (in-site image zoom, never zooms the page) ────────
function bindImageZoom() {
  modalBody.querySelectorAll('.story-photo img, .pv-main img').forEach(img => {
    img.style.cursor = 'zoom-in';
    img.addEventListener('click', () => openLightbox(img.src));
  });
}

function openLightbox(src) {
  let lb = document.getElementById('lightbox');
  if (!lb) {
    lb = document.createElement('div');
    lb.id = 'lightbox';
    lb.className = 'lightbox';
    lb.innerHTML =
      '<button class="lightbox-close" aria-label="Close"><i class="fa-solid fa-xmark"></i></button>' +
      '<div class="lightbox-scroll"><img alt="" /></div>';
    document.body.appendChild(lb);
    lb.addEventListener('click', e => {
      if (e.target === lb || e.target.closest('.lightbox-close') || e.target.classList.contains('lightbox-scroll')) {
        closeLightbox();
      }
    });
    const lbImg = lb.querySelector('img');
    lbImg.addEventListener('click', e => { e.stopPropagation(); lbImg.classList.toggle('zoomed'); });
  }
  const lbImg = lb.querySelector('img');
  lbImg.src = src;
  lbImg.classList.remove('zoomed');
  lb.querySelector('.lightbox-scroll').scrollTop = 0;
  lb.classList.add('open');
  document.body.style.overflow = 'hidden';
}

function closeLightbox() {
  const lb = document.getElementById('lightbox');
  if (lb) lb.classList.remove('open');
  document.body.style.overflow = modal.classList.contains('open') ? 'hidden' : '';
}

function openProjectModal(idx) {
  const p = projects[idx];
  if (!p) return;

  const meta = [
    p.company    && metaBlock('Course',     p.company),
    p.timeline   && metaBlock('Timeline',   p.timeline),
    p.strategies && metaBlock('Strategies', p.strategies),
    p.tools      && metaBlock('Tools',      p.tools),
  ].filter(Boolean).join('');

  openModalShell(`
    <div class="modal-hero"><img src="${p.image}" alt="" /></div>
    <h2>${escapeHtml(p.title)}</h2>
    <p class="subtitle">${escapeHtml(p.subtitle || p.summary)}</p>

    ${meta ? `<div class="modal-meta">${meta}</div>` : ''}

    ${p.description ? `<h3>Overview</h3><p>${escapeHtml(p.description).replace(/\n/g, '<br/>')}</p>` : ''}

    ${p.note ? `<p class="note">${escapeHtml(p.note)}</p>` : ''}

    ${p.highlights?.length ? `
      <h3>Highlights</h3>
      <ul class="highlights">${p.highlights.map(h => `<li>${escapeHtml(h)}</li>`).join('')}</ul>` : ''}

    ${p.youtubeId ? `
      <h3>Demo</h3>
      <div class="video-wrap">
        <iframe src="https://www.youtube.com/embed/${p.youtubeId}"
                title="YouTube video player"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowfullscreen></iframe>
      </div>` : ''}

    ${p.documents?.length ? `
      <h3>Documents</h3>
      ${p.documents.map(d => `
        <p class="doc-title">${escapeHtml(d.title)}</p>
        <div class="video-wrap">
          <iframe src="${d.url}" title="${escapeHtml(d.title)}" allowfullscreen></iframe>
        </div>`).join('')}` : ''}

    ${p.productViews?.length ? `<h3>Product Views</h3>${productViewer(p.productViews)}` : ''}

    ${p.gallery?.length ? `<h3>${escapeHtml(p.galleryTitle || 'Gallery')}</h3>${storyGallery(p.gallery)}` : ''}
  `);

  bindProductViewer();
}

function openExpModal(item) {
  if (!item) return;
  openModalShell(`
    <h2 class="exp-modal-title">${escapeHtml(item.title)} <span class="exp-at">${escapeHtml(item.at)}</span></h2>
    <p class="subtitle">${escapeHtml(item.meta)}</p>

    ${item.tasks?.length ? `
      <h3>What I did</h3>
      <ul>${item.tasks.map(t => `<li>${escapeHtml(t)}</li>`).join('')}</ul>` : ''}

    ${item.reflection?.length ? `
      <h3>Reflection</h3>
      ${item.reflection.map(s => `
        <div class="reflection-block">
          <p class="reflection-head">${escapeHtml(s.heading)}</p>
          <p>${escapeHtml(s.body)}</p>
        </div>`).join('')}` : ''}

    ${item.photos?.length ? `<h3>Photos</h3>${storyGallery(item.photos)}` : ''}
  `);
}

function closeModal() {
  modal.classList.remove('open');
  modal.setAttribute('aria-hidden', 'true');
  document.body.style.overflow = '';
}

modal.addEventListener('click', e => {
  if (e.target.matches('[data-close]')) closeModal();
});
document.addEventListener('keydown', e => {
  if (e.key !== 'Escape') return;
  const lb = document.getElementById('lightbox');
  if (lb && lb.classList.contains('open')) { closeLightbox(); return; }
  if (modal.classList.contains('open')) closeModal();
});

function metaBlock(label, value) {
  return `<div><p class="meta-label">${label}</p><p class="meta-value">${escapeHtml(value)}</p></div>`;
}

function escapeHtml(s) {
  return String(s).replace(/[&<>"']/g, c => ({
    '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;',
  }[c]));
}

// ─── Scroll-driven nav highlight, elevation & progress bar ──────
const nav = document.getElementById('nav');
const navLinks = document.querySelectorAll('.nav-links a');
const progressBar = document.getElementById('scrollProgress');
const sections = ['about', 'projects', 'experience', 'leadership']
  .map(id => document.getElementById(id));

function onScroll() {
  nav.classList.toggle('elevated', window.scrollY > 24);

  const doc = document.documentElement;
  const max = doc.scrollHeight - doc.clientHeight;
  if (progressBar) progressBar.style.width = max > 0 ? `${(window.scrollY / max) * 100}%` : '0%';

  const probe = window.scrollY + 120;
  let active = null;
  for (const sec of sections) {
    if (!sec) continue;
    if (sec.offsetTop <= probe) active = sec.id;
  }
  navLinks.forEach(a => a.classList.toggle('active', a.dataset.section === active));
}
window.addEventListener('scroll', onScroll, { passive: true });
onScroll();

// ─── Reveal-on-scroll (IntersectionObserver) ────────────────────
const io = new IntersectionObserver((entries) => {
  for (const e of entries) {
    if (e.isIntersecting) {
      e.target.classList.add('in');
      io.unobserve(e.target);
    }
  }
}, { threshold: 0.12 });

document.querySelectorAll('.reveal').forEach(el => io.observe(el));
