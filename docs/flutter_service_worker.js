'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "76f09f1c769c11586d60cc8e3d68c692",
"assets/AssetManifest.bin.json": "412b66eb24cac4b6582d646227c235d2",
"assets/AssetManifest.json": "78fdca172b7cd415f48d584660a156b3",
"assets/FontManifest.json": "33b7b694b53c7baafc73aad365ed7865",
"assets/fonts/MaterialIcons-Regular.otf": "8b5d8ac658858f2c74240a9aee6081f5",
"assets/lib/assets/about.jpg": "35bd5dac0f84ffc5e17c4078b08c7ed7",
"assets/lib/assets/capacitor.png": "806a721b913045a460086c22c7c12eb5",
"assets/lib/assets/criticalimage1.jpg": "00f6d037bb832a1f451a609312b03cfa",
"assets/lib/assets/criticalimage2.jpg": "b33e07dded8ef6e536e6e9bb47cec053",
"assets/lib/assets/dtp3.jpg": "190c0e13b841681aee2022c805e88472",
"assets/lib/assets/dtp3cover.jpg": "053f9a00e8b2ad5b3fed0c6272623cd4",
"assets/lib/assets/ecommerce_poster.png": "f64ee0f53bf5bd37159f4782cab956dc",
"assets/lib/assets/ecommerce_team.jpg": "6eac71167a06ca22e1171ceb07f0e680",
"assets/lib/assets/experience.jpg": "115e257d34069af6789ad58859c5cd0a",
"assets/lib/assets/fabcat.jpg": "c60992bb04af73cb0267221aa3c1cbaa",
"assets/lib/assets/fabcat2.jpg": "8f6aaf9dcfef07f3d3dfc6f768888036",
"assets/lib/assets/fabcat_esp32.jpg": "d3e1f62a13210667198105daa0798eb4",
"assets/lib/assets/fabcat_present1.jpg": "da1b2e6c86fdbab742b514fddc95702d",
"assets/lib/assets/fabcat_present2.jpg": "00c9f8172dc85c6459b9103bef8a51f9",
"assets/lib/assets/fabcat_team.jpg": "da267297f3c9af6f1df30a993ae1e0fd",
"assets/lib/assets/fabcat_workshop.jpg": "d51079a471955a7ff71c03ca680f06dd",
"assets/lib/assets/fonts/Inter_18pt-Bold.ttf": "f77ce9588dccbc52fdbf0b79f0d63714",
"assets/lib/assets/fonts/Inter_18pt-Italic.ttf": "ab4004692577ac82604c777fa83da556",
"assets/lib/assets/fonts/Inter_18pt-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/lib/assets/fonts/playfair-display.bold.ttf": "5156195953f94fb7d5a11f9fe1ebb916",
"assets/lib/assets/fonts/playfair-display.regular.ttf": "06b103d23cb2b5cebfb7a9ca55e10c72",
"assets/lib/assets/icecream.png": "77aa5fb0e4d85b4ccc279c9d8ed72d62",
"assets/lib/assets/profile.JPG": "29f5fbbf5fedfde779f133abe52ffcbf",
"assets/lib/assets/RWW.jpg": "24c81a65b7f8e6fcf43786430e734ef5",
"assets/lib/assets/siteanalysis.jpg": "302a055c932588a1f47c35ff09e6d190",
"assets/lib/assets/useranalysis.jpg": "9b5b09b8b0708a95df9cc3be962003ac",
"assets/lib/assets/vrptw_poster.png": "f43d243046857a1a8f4f9eb5dc9ffd36",
"assets/lib/assets/vrptw_slide1.png": "5094428936a0966dd1c5ef7250c8d748",
"assets/lib/assets/wbgt.jpg": "9f00e216b1a1999747923e92567a9453",
"assets/lib/assets/wbgtback.jpg": "fcccdb0b5b5854cc02929e51b420fdde",
"assets/lib/assets/wbgtfront.jpg": "29d39629e01b20e408f0e746f63e3493",
"assets/lib/assets/wbgtgroup.jpg": "d1c0b68180f35f4abd489e114467b705",
"assets/lib/assets/wbgtopen.jpg": "31623ce7aa32ef9ade39bafad4116f27",
"assets/lib/assets/wbgttesting.jpg": "7fa8b845844730ff09e51944b0acee6b",
"assets/lib/assets/welcome.jpg": "dfd5cd3ecf3291c4c2bdbf7900590839",
"assets/lib/assets/welcome_new.png": "b6e7e42e5b91d6de138dcb449542cace",
"assets/NOTICES": "f9ff1e555fbad8d83cd276b1f3ce6f2d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "41e8302cbaf04408585d948a435f4421",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "2f09265ed92f9addba04502cb8ddff59",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "974bdea1815886a280aaed619a53d88e",
"/": "974bdea1815886a280aaed619a53d88e",
"main.dart.js": "34f5052cb35bba689db5b745c53cb108",
"manifest.json": "1f43d7f7c58e658b111603c6dcccd3b0",
"version.json": "10762b792afdbfa78995ce94f467ea69"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
