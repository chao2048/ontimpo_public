# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"

pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true


pin "bootstrap", to: "https://ga.jspm.io/npm:bootstrap@5.1.3/dist/js/bootstrap.esm.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.5/lib/index.js"
# pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"
pin "jquery.countdown", to: "https://ga.jspm.io/npm:jquery.countdown@1.2.8/jquery.countdown.js"
pin "moment", to: "https://ga.jspm.io/npm:moment@2.29.3/moment.js"
pin "fullcalendar", to: "https://ga.jspm.io/npm:fullcalendar@5.11.0/main.js"
pin "@fullcalendar/core", to: "https://ga.jspm.io/npm:@fullcalendar/core@5.11.0/main.js"
pin "@fullcalendar/common", to: "https://ga.jspm.io/npm:@fullcalendar/common@5.11.0/main.js"
pin "preact", to: "https://ga.jspm.io/npm:preact@10.8.2/dist/preact.module.js"
pin "preact/compat", to: "https://ga.jspm.io/npm:preact@10.8.2/compat/dist/compat.module.js"
pin "preact/hooks", to: "https://ga.jspm.io/npm:preact@10.8.2/hooks/dist/hooks.module.js"
pin "tslib", to: "https://ga.jspm.io/npm:tslib@2.4.0/tslib.es6.js"
pin "@fullcalendar/daygrid", to: "https://ga.jspm.io/npm:@fullcalendar/daygrid@5.11.0/main.js"
pin "@fullcalendar/timegrid", to: "https://ga.jspm.io/npm:@fullcalendar/timegrid@5.11.0/main.js"
pin "@fullcalendar/list", to: "https://ga.jspm.io/npm:@fullcalendar/list@5.11.0/main.js"
