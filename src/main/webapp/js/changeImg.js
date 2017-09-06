//图片上传预览    IE是用了滤镜。

	function previewImage(file, i) {
		$('#hasFileImg').val('hasFileImg');
		var oDivs = getClass('axImg', document);
		var MAXWIDTH = 200;
		var MAXHEIGHT = 200;
		if (file.files && file.files[0]) {
			oDivs[i].innerHTML = '<img id=imgChange' + i + '>';
			var oImg = document.getElementById('imgChange' + i);
			oImg.onload = function() {
				var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT,
						oImg.offsetWidth, oImg.offsetHeight);
				oImg.width = rect.width;
				oImg.height = rect.height;
				// oImg.style.marginLeft = rect.left+'px';
				oImg.style.marginTop = rect.top + 'px';
			};
			var reader = new FileReader();
			reader.onload = function(evt) {
				oImg.src = evt.target.result;
			}
			reader.readAsDataURL(file.files[0]);
		} else // 兼容IE
		{
			var sFilter = 'filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale,src="';
			file.select();
			var src = document.selection.createRange().text;
			oDivs[i].innerHTML = '<img id=imgChange' + i + '>';
			var oImg = document.getElementById('imgChange' + i);
			oImg.filters.item('DXImageTransform.Microsoft.AlphaImageLoader').src = src;
			var rect = clacImgZoomParam(MAXWIDTH, MAXHEIGHT, oImg.offsetWidth,
					oImg.offsetHeight);
			// status
			// =('rect:'+rect.top+','+rect.left+','+rect.width+','+rect.height);
			oDivs[i].innerHTML = "<div id='divChange" + i + "' style='width:"
					+ rect.width + "px;height:" + rect.height
					+ "px;margin-top:" + rect.top + "px;" + sFilter + src
					+ "\"'></div>";
		}
	}

	function clacImgZoomParam(maxWidth, maxHeight, width, height) {
		var param = {
			top : 0,
			left : 0,
			width : width,
			height : height
		};
		if (width > maxWidth || height > maxHeight) {
			rateWidth = width / maxWidth;
			rateHeight = height / maxHeight;

			if (rateWidth > rateHeight) {
				param.width = maxWidth;
				param.height = Math.round(height / rateWidth);
			} else {
				param.width = Math.round(width / rateHeight);
				param.height = maxHeight;
			}
		}

		param.left = Math.round((maxWidth - param.width) / 2);
		param.top = Math.round((maxHeight - param.height) / 2);
		return param;
	}

	function getEle(strClass, eles) {
		var a = [];
		var reg = new RegExp('\\b' + strClass + '\\b');
		for (var i = 0; i < eles.length; i++) {

			if (reg.test(eles[i].className)) {
				a.push(eles[i]);
			}
		}
		return a;

	}
	function getClass(strClass, contextEle) {
		if (typeof strClass != 'string') {
			alert('第一个参数错误！');
			throw new Error('第一个参数strClass错误!')
		}
		contextEle = contextEle || document;
		if (contextEle.nodeType != 1 && contextEle.nodeType != 9) {
			alert('第二个参数错误！');
			throw new Error('第二个参数contextEle错误!');
		}
		if (contextEle.getElementsByClassName) {
			return contextEle.getElementsByClassName(strClass);
		} else {
			var aClass = [];
			aClass = strClass.split(' ');
			var eles = contextEle.getElementsByTagName('*');
			for (var i = 0; i < aClass.length; i++) {
				if (aClass[i].replace(/\s/g, '').length > 0) {
					eles = getEle(aClass[i], eles);
				}
			}
			return eles;
		}
	}

	var oFile = getClass('fileCss', document);
	function objChange(n) {
		oFile[n].onchange = function() {
			previewImage(oFile[n], n);
		}
	}
	for (var i = 0; i < oFile.length; i++) {
		objChange(i);
	}
