#!/usr/bin/env node
/**
 * 更新docker 镜像中的package.json配置
 */

!process.env.NEED_PATCH && process.exit(0);

let fs = require('story-fs');

const source = './package-modify.json';
const dist = './package.json';

fs.readJSON(source).then(function (sourceContent) {
    return fs.readJSON(dist).then(function (distContent) {
        let result = distContent;
        result.hexo = sourceContent.hexo;
        result.hexoHackedFeature = sourceContent.hexoHackedFeature;
        console.log('update dist source:', result);
        return result;
    });
}).then(function (content) {
    return fs.writeJSON(dist, content);
}).catch(function (e) {
    console.error(e);
});