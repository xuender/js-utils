// Generated by CoffeeScript 1.6.3
/*
# utils 常用工具方法
*/

var arrayRemove, findArray, getId, groupBy, isArray, localStorageGet, localStorageSet, sortOn, updateArray;

getId = function(id) {
  if (id == null) {
    id = 'ID';
  }
  /* 获取不重复的顺序ID*/

  if (window[id] === void 0) {
    window[id] = 1;
  }
  return window[id]++;
};

isArray = function(array) {
  /* 判断对象是否是数组*/

  return Object.prototype.toString.call(array) === '[object Array]';
};

findArray = function(collection, attribute, value) {
  /* 数组对象查找*/

  var c, o, ret, _i, _j, _len, _len1;
  if (isArray(value)) {
    ret = [];
    for (_i = 0, _len = value.length; _i < _len; _i++) {
      o = value[_i];
      ret.push(findArray(collection, attribute, o));
    }
    return ret;
  }
  for (_j = 0, _len1 = collection.length; _j < _len1; _j++) {
    c = collection[_j];
    if (c[attribute] === value) {
      return c;
    }
  }
  return null;
};

updateArray = function(collection, o, n) {
  /* 数组替换*/

  var index, value;
  for (index in collection) {
    value = collection[index];
    if (value === o) {
      collection[index] = n;
    }
  }
  return collection;
};

arrayRemove = function(collection, obj) {
  /* 删除对象*/

  var index, value, _results;
  _results = [];
  for (index in collection) {
    value = collection[index];
    if (value === obj) {
      _results.push(collection.splice(index, 1));
    }
  }
  return _results;
};

sortOn = function(collection, name) {
  /* 根据数组中对象某属性进行排序*/

  var desc;
  if (name[0] === '-') {
    desc = true;
    name = name.slice(1);
  }
  collection.sort(function(a, b) {
    if (a[name] <= b[name]) {
      return -1;
    }
    return 1;
  });
  if (desc) {
    return collection.reverse();
  }
};

groupBy = function(items, attribute) {
  /* 获取对象分组*/

  var group, groupValue, i, ret, _i, _len;
  ret = [];
  sortOn(items, attribute);
  groupValue = '_INVALID_GROUP_VALUE_';
  for (_i = 0, _len = items.length; _i < _len; _i++) {
    i = items[_i];
    if (i[attribute] !== groupValue) {
      group = {
        label: i[attribute],
        items: []
      };
      groupValue = group.label;
      ret.push(group);
    }
    group.items.push(i);
  }
  return ret;
};

localStorageGet = function(key, defaultValue) {
  var value;
  if (defaultValue == null) {
    defaultValue = false;
  }
  /* 读取本地数据*/

  value = localStorage.getItem(key);
  if (value) {
    return JSON.parse(value);
  }
  return defaultValue;
};

localStorageSet = function(key, value) {
  /* 设置本地数据*/

  return localStorage.setItem(key, JSON.stringify(value));
};
