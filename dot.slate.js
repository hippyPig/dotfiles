
var resize = function (width, height, anchor) {
    if (typeof anchor === 'undefined') anchor = 'top-left';

    return slate.operation('resize', {
        'width' : width,
        'height' : height,
        'anchor' : anchor
    });
};

var nudge = function (x, y) {
    return slate.operation('nudge', {
        'x' : x,
        'y' : y
    });
};

var focus = function (app_name) {
    return slate.operation('focus', {'app' : app_name});
};

var focus_dir = function (direction) {
    return slate.operation('focus', {'direction' : direction});
};

var chain = function(actions) {
    return slate.operation('chain', {'operations' : actions});
};

var half_push = function(direction) {
  var w = 'screenSizeX*2/5';
  if (direction === 'left') {
    w = 'screenSizeX*3/5';
  };
  return slate.operation('push', {
    'direction' : direction,
    //'style' : 'bar-resize:screenSizeX/2'
    'style' : 'bar-resize:'+w
  });
};

var real_half_push = function(direction) {
  var w = 'screenSizeX*1/2';
  if (direction === 'left') {
    w = 'screenSizeX*1/2';
  };
  return slate.operation('push', {
    'direction' : direction,
    //'style' : 'bar-resize:screenSizeX/2'
    'style' : 'bar-resize:'+w
  });
};



var half_top = function(direction) {
    return slate.operation('corner', {
        'direction' : 'top-'+direction,
        'width' : 'screenSizeX/2',
        'height' : 'screenSizeY/2'
    });
};

var half_bottom = function(direction) {
    return slate.operation('corner', {
        'direction' : 'bottom-'+direction,
        'width' : 'screenSizeX/2',
        'height' : 'screenSizeY/2'
    });
};

var quarter_push = function(updown, leftright) {
  var width = 'screenSizeX*3/5';
  var height = 'screenSizeY/2';
  var originX = 'screenOriginX';
  var originY = 'screenOriginY';
  if (leftright === 'right') {
    width = 'screenSizeX*2/5';
    originX = 'screenOriginX+screenSizeX*3/5';
  };
  if (updown === 'bottom') {
    originY = 'screenOriginY+screenSizeY/2';
  };
  return slate.operation('move', {
    'x' : originX,
    'y' : originY,
    'width' : width,
    'height' : height
  });
};

var real_quarter_push = function(updown, leftright) {
  var w = 'screenSizeX/2';
  var h = 'screenSizeY/2';
  var originX = 'screenOriginX';
  var originY = 'screenOriginY';
  if (updown === 'bottom') {
    originY = 'screenOriginY+screenSizeY/2';
  }
  if (leftright === 'right') {
    originX = 'screenOriginX+screenSizeX/2';
  }
  return slate.operation('move', {
    'x' : originX,
    'y' : originY,
    'width' : w,
    'height' : h
  });
};

var fullscreen = slate.operation('corner', {
    'direction' : 'top-left',
    'width' : 'screenSizeX',
    'height' : 'screenSizeY'
});


S.configAll({
    defaultToCurrentScreen:true,
    nudgePercentOf:'screenSize',
    resizePercentOf:'screenSize'
});


var key_binds = {};
var hyper = 'ctrl,alt,cmd';
var shyper = 'shift,ctrl,alt,cmd';

//key_binds['r:ctrl,shift'] = slate.operation('relaunch');

key_binds['f:'+hyper] = fullscreen;

var half_actions = function(direction){
  return [half_push(direction), quarter_push('top', direction), quarter_push('bottom', direction)];
};

var real_half_actions = function(){
  return [real_half_push('left'), real_half_push('right')];
};

var real_quarter_actions = function(){
  return [
    real_quarter_push('top', 'left'),
    real_quarter_push('top', 'right'),
    real_quarter_push('bottom', 'left'),
    real_quarter_push('bottom', 'right'),
  ];
};

key_binds['u:'+hyper] = chain(half_actions('left'));;
key_binds['i:'+hyper] = chain(half_actions('right'));;
key_binds['q:'+hyper] = chain(real_half_actions());;
key_binds['w:'+hyper] = chain(real_quarter_actions());;

//key_binds['`:alt'] = slate.operation('undo');

key_binds['b:'+hyper] = focus('Google Chrome');
key_binds['t:'+hyper] = focus('Terminal');
key_binds['o:'+hyper] = focus('Finder');
key_binds['s:'+hyper] = focus('Skype');
key_binds['m:'+hyper] = focus('Thunderbird');
key_binds['p:'+hyper] = focus('iTunes');
key_binds['a:'+hyper] = focus('Adium');
key_binds['c:'+hyper] = focus('Calendar');
key_binds['h:'+hyper] = focus_dir('left');
key_binds['l:'+hyper] = focus_dir('right');
key_binds['j:'+hyper] = focus_dir('down');
key_binds['k:'+hyper] = focus_dir('up');

S.bindAll(key_binds);

var adium_contacts = slate.operation('move', {
  'x' : 'screenOriginX+screenSizeX*4/5',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/5',
  'height' : 'screenSizeY'
});

var adium_chat = slate.operation('move', {
  'x' : 'screenOriginX+screenSizeX*3/5',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX/5',
  'height' : 'screenSizeY'
});

var skype = slate.operation('move', {
  'x' : 'screenOriginX',
  'y' : 'screenOriginY',
  'width' : 'screenSizeX*3/5',
  'height' : 'screenSizeY'
});

slate.bind("d:"+hyper, function(win) {
  var appName = win.app().name();
  if (appName === "Adium") {
    if (win.title() === "Contacts") {
      win.doOperation(adium_contacts);
    } else {
      win.doOperation(adium_chat);
    };
  } else if (appName === "Skype") {
    win.doOperation(skype);
  } else {
    win.doOperation(fullscreen);
  };
});

