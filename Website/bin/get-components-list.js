#!/bin/node

'use strict';

const fs = require('fs');
const base = './source/components/';

fs.readdir(base, {encoding: 'utf8'}, function (err, data) {

    if (err) return false;

    let result = {'list': []};

    data.map(function (componentName) {
        let componentPath = base + componentName;

        let stats = fs.statSync(componentPath);

        if (stats.isDirectory()) {
            result.list.push(componentName);
        }
    });

    result = JSON.stringify(result, null, 4);

    return fs.writeFile(base + 'list.json', result, function (err) {
        if (err) throw err;
    });
});
