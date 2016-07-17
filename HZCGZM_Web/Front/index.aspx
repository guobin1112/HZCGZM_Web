<%@ Page Title="" Language="C#" MasterPageFile="~/Front/base.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="HZCGZM_Web.Front.index" %>
<asp:Content ID="head_index" ContentPlaceHolderID="head" runat="server">
      <link rel="stylesheet" href="Style/index.css"/>
      <link rel="stylesheet" href="Style/slide.css"/>
      <script src="Script/jquery-1.8.3.min.js"></script>
      <script src="Script/index.js"></script>
</asp:Content>
<asp:Content ID="content_index" ContentPlaceHolderID="content" runat="server">
        <div class="banner" >
            <div class="ck-slide">
			    <ul class="ck-slide-wrapper">
				    <li>
                    <a href="javascript:"><img src="Image/1.jpg" alt=""/></a>
				    </li>
				    <li style="display:none">
					    <a href="javascript:"><img src="Image/2.jpg" alt=""/></a>
				    </li>
				    <li style="display:none">
					    <a href="javascript:"><img src="Image/3.jpg" alt=""/></a>
				    </li>
				    <li style="display:none">
					    <a href="javascript:"><img src="Image/4.jpg" alt=""/></a>
				    </li>
				    <li style="display:none">
					    <a href="javascript:"><img src="Image/5.jpg" alt=""/></a>
				    </li>
			    </ul>
			    <a href="javascript:;" class="ctrl-slide ck-prev">上一张</a> <a href="javascript:;" class="ctrl-slide ck-next">下一张</a>
			    <div class="ck-slidebox">
				    <div class="slideWrap">
					    <ul class="dot-wrap">
						    <li class="current"><em>1</em></li>
						    <li><em>2</em></li>
						    <li><em>3</em></li>
						    <li><em>4</em></li>
						    <li><em>5</em></li>
					    </ul>
				    </div>
			    </div>
		    </div>
        </div>
        <div class="gallery">
            <div class="product">
	            <div class="img_l"><img src="Image/arrow_left_orange.png" /></div>
	            <div class="product_nav">
	 	             <div class="product_w">
			        <div class="product_array">
				        <div class="product_img"><img src="Image/sinaminiblog.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/kaixin001.gif" /></div>
			        </div>
		
			        <div class="product_array">
				        <div class="product_img"><img src="Image/renren.gif" /></div>
			        </div>
		
			        <div class="product_array">
				        <div class="product_img"><img src="Image/baiducang.gif" /></div>
			        </div>
		
			        <div class="product_array">
				        <div class="product_img"><img src="Image/qq.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/qqshuqian.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/qqzone.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/sinavivi.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/sohubai.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/douban.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/zhuaxia.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/gmail.gif" /></div>
			        </div>
			
			        <div class="product_array">
				        <div class="product_img"><img src="Image/delicious.gif" /></div>
			        </div>
			
		        </div>
	            </div>
	            <div class="img_r"><img src="Image/arrow_right_orange.png" /></div>
            </div>
        </div>
		<script src="Script/slide.min.js"></script>
		<script>
		    $('.ck-slide').ckSlide({
		        autoPlay: true,//默认为不自动播放，需要时请以此设置
		        dir: 'x',//默认效果淡隐淡出，x为水平移动，y 为垂直滚动
		        interval: 3000//默认间隔2000毫秒
		    });
		</script>
</asp:Content>
