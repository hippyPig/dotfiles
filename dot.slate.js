// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000,
  "orderScreensLeftToRight" : true,
  "nudgePercentOf": "screenSize",
  "resizePercentOf": "screenSize",
  "orderScreensLeftToRight": true
});

// Definitions
var key_binds = {};
var ctrlshift = 'ctrl,shift';
var hyper = 'ctrl,cmd,alt';
var shyper = 'shift,ctrl,alt,cmd';
var leftScreenRef = "0";
var rightScreenRef = "1";


// Function definitions and such
// =============================
var focus = function (app_name) {
    return S.op('focus', {'app' : app_name});
};


var focus_dir = function (direction) {
    return slate.operation('focus', {'direction' : direction});
};


var chain = function(actions) {
    return slate.operation('chain', {'operations' : actions});
};


var fullscreen = slate.operation('corner', {
    'direction' : 'top-left',
    'width' : 'screenSizeX',
    'height' : 'screenSizeY'
});


var push_half = function(direction) {
  var w = 'screenSizeX/2';
  return slate.operation('push', {
    'direction' : direction,
    'style' : 'bar-resize:'+w
  });
};


var push_third = function(direction) {
  var w = 'screenSizeX/3';
  return slate.operation('push', {
    'direction' : direction,
    'style' : 'bar-resize:'+w
  });
};


var push_two_third = function(direction) {
  var w = 'screenSizeX*2/3';
  return slate.operation('push', {
    'direction' : direction,
    'style' : 'bar-resize:'+w
  });
};


var push_quarter = function(direction) {
  var w = 'screenSizeX/4';
  return slate.operation('push', {
    'direction' : direction,
    'style' : 'bar-resize:'+w
  });
};


var resize = function(width, height, anchor) {
    if (typeof anchor === 'undefined') anchor = 'top-left';
    return S.op('resize', {
        'width' : width,
        'height' : height,
        'anchor' : anchor
    });
};


var left_screen_right = slate.operation(
  "move",
  {
    // "screen" : leftScreenRef,
    "x" : "screenOriginX+(screenSizeX*2/3)",
    "y" : "screenOriginY",
    "width" : "screenSizeX/3",
    "height" : "screenSizeY"
  }
);


var left_screen_left = slate.operation(
  "move",
  {
    // "screen" : leftScreenRef,
    "x" : "screenOriginX",
    "y" : "screenOriginY",
    "width" : "screenSizeX/3",
    "height" : "screenSizeY"
  }
);


// var real_half_push = function(direction) {
//   var w = 'screenSizeX*1/2';
//   if (direction === 'left') {
//     w = 'screenSizeX*1/2';
//   };
//   return slate.operation('push', {
//     'direction' : direction,
//     'style' : 'bar-resize:'+w
//   });
// };


// var real_third_push = function(direction) {
//   var w = 'screenSizeX*1/3';
//   if (direction === 'left') {
//     w = 'screenSizeX*1/3';
//   };
//   return slate.operation('push', {
//     'direction' : direction,
//     'style' : 'bar-resize:'+w
//   });
// };


// var real_two_third_push = function(direction) {
//   var w = 'screenSizeX*2/3';
//   if (direction === 'left') {
//     w = 'screenSizeX*2/3';
//   };
//   return slate.operation('push', {
//     'direction' : direction,
//     'style' : 'bar-resize:'+w
//   });
// };


// var half_top = function(direction) {
//     return slate.operation('corner', {
//         'direction' : 'top-'+direction,
//         'width' : 'screenSizeX/2',
//         'height' : 'screenSizeY/2'
//     });
// };


// var half_bottom = function(direction) {
//     return slate.operation('corner', {
//         'direction' : 'bottom-'+direction,
//         'width' : 'screenSizeX/2',
//         'height' : 'screenSizeY/2'
//     });
// };


// var quarter_push = function(updown, leftright) {
//   var width = 'screenSizeX*3/5';
//   var height = 'screenSizeY/2';
//   var originX = 'screenOriginX';
//   var originY = 'screenOriginY';
//   if (leftright === 'right') {
//     width = 'screenSizeX*2/5';
//     originX = 'screenOriginX+screenSizeX*3/5';
//   };
//   if (updown === 'bottom') {
//     originY = 'screenOriginY+screenSizeY/2';
//   };
//   return slate.operation('move', {
//     'x' : originX,
//     'y' : originY,
//     'width' : width,
//     'height' : height
//   });
// };




var chain_half = function(direction){
  return chain([
    push_half(direction),
    push_third(direction),
    push_two_third(direction)
  ])
};



// Binding definitions
// ===================


// Push bindings
// key_binds["right:ctrl;shift"] = S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/2" });
// key_binds["left:ctrl;shift"] = S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/2" });
// key_binds["up:ctrl;shift"] = S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" });
// key_binds["down:ctrl;shift"] = S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" });

key_binds['f:'+hyper] = fullscreen;
key_binds['h:'+shyper] = chain_half('left');
key_binds['l:'+shyper] = chain_half('right');
// Focus
key_binds['b:'+hyper] = focus('Google Chrome');
key_binds['t:'+hyper] = focus('Terminal');
key_binds['x:'+hyper] = focus('Workplace Chat');
key_binds['a:'+hyper] = focus('Finder');
key_binds['m:'+hyper] = focus('Microsoft Outlook');

key_binds['h:'+ctrlshift] = focus_dir('left');
key_binds['l:'+ctrlshift] = focus_dir('right');
key_binds['j:'+ctrlshift] = focus_dir('down');
key_binds['k:'+ctrlshift] = focus_dir('up');


S.bindAll(key_binds);
