var order={};

order.rowNo=0;
order.clickMtl=null;
order.template =null;

order.calculate=function(event) {
	var t = $(event.target).parents("tr");
	var a = t.find(".price");
	var b = t.find(".quantity");
	var c = t.find(".subTotal");

	c.val(a.val() * b.val());
};

order.addRow=function() {
	$(order.template(order.rowNo)).appendTo("#itemBody");
	$('#productSearchBtn_'+order.rowNo).click(order.showProductSearch);
	order.rowNo++;
};

order.showBillSearch=function(event){
	order.queryBill();
	$('#billResult').empty();
	$('#billModal').modal('show');
};

order.billSearchOk=function(){
	var checkedMtl=$('#billModal :radio:checked');
	if(checkedMtl.length==0){
		alert("请先选择一行数据");
		return;
	}
	var bill=$(checkedMtl[0]).attr("data-product");
	if(typeof bill =="string"){
		bill=JSON.parse(bill);
	}
	
	$('#linkMan').val(bill.linkMan);
	$('#address').val(bill.address);
	$('#vendor').val(bill.vendor);
	
	$('#itemBody').empty();
	order.rowNo=0;
	$.each(bill.items,function(i,item){
		order.addRow();
		$('#productCode_'+i).val(item.productCode);
		$('#unit_'+i).val(item.unit);
		$('#price_'+i).val(item.price);
		$('#quantity_'+i).val(item.quantity);
		$('#subTotal_'+i).val(item.subTotal);
		$('#remark_'+i).val(item.remark);
	});
	
	$('#billModal').modal('hide');
	$('#billResult').empty();
};

order.queryBill=function(){
	$.ajax({
		url:ctx+"/enquiry/purchase/search",
		data:"",
	success: function(result){
		if(result.success==true){
			var tbody=$('#billResult');
			$.each(result.data,function(i,bill){
				var tr='<tr>';
				tr+=('<td><input type="radio" name="selectRow" data-product=\''+JSON.stringify(bill)+'\' ></td>');
				tr+=('<td>'+bill.billNo+'</td>');
				tr+=('<td>'+bill.vendor+'</td>');
				tr+=('<td>'+bill.startDate+'</td>');
				tr+=('<td>'+bill.endDate+'</td>');
				tr+='</tr>';
				
				tbody.append($(tr));
			});
		}
		else{
			
		}
	},
	error:function(){
		
	}
	});
};

order.showProductSearch=function(event){
	
	order.clickMtl=$(event.target).parents('tr');
//	order.queryMtl();
//	$('#productResult').empty();
	$('#productModal').modal('show');
};
order.productSearchOk=function(){
	var checkedMtl=$('#productModal :radio:checked');
	if(checkedMtl.length==0){
		alert("请先选择一行数据");
		return;
	}
	var product=$(checkedMtl[0]).attr("data-product");
	if(typeof product =="string"){
		product=JSON.parse(product);
	}
	
	var input=$(order.clickMtl[0]).find("input");
	$(input[0]).val(product.code);
	$(input[1]).val(product.unit);
	$(input[2]).val(product.prePurPrice);
	$('#productModal').modal('hide');
	$('#productResult').empty();
	order.clickMtl=null;
};

order.queryMtl=function(){
	$.ajax({
		url:ctx+"/jimi/product/search",
		data:"",
	success: function(result){
		if(result.success==true){
			var tbody=$('#productResult');
			$.each(result.data,function(i,product){
				var tr='<tr>';
				tr+=('<td><input type="radio" name="selectRow" data-product=\''+JSON.stringify(product)+'\' ></td>');
				tr+=('<td>'+product.id+'</td>');
				tr+=('<td>'+product.product+'</td>');
				tr+=('<td>'+product.price+'</td>');
				tr+='</tr>';
				
				tbody.append($(tr));
			});
		}
		else{
			
		}
	},
	error:function(){
		
	}
	});
};


//vendor searcher dialog start
order.showVendorSearch=function(event){
	order.queryVendor();
	$('#vendorResult').empty();
	$('#vendorModal').modal('show');
};
order.vendorSearchOk=function(){
	var checkedMtl=$('#vendorModal :radio:checked');
	if(checkedMtl.length==0){
		alert("请先选择一行数据");
		return;
	}
	var vendor=$(checkedMtl[0]).attr("data-vendor");
	if(typeof vendor =="string"){
		vendor=JSON.parse(vendor);
	}
	
	$('#vendor').val(vendor.name);
	$('#vendorModal').modal('hide');
	$('#vendorResult').empty();
};

order.queryVendor=function(){
	$.ajax({
		url:ctx+"/vendor/search",
		data:"",
	success: function(result){
		if(result.success==true){
			var tbody=$('#vendorResult');
			$.each(result.data,function(i,vendor){
				var tr='<tr>';
				tr+=('<td><input type="radio" name="selectRow" data-vendor=\''+JSON.stringify(vendor)+'\' ></td>');
				tr+=('<td>'+vendor.name+'</td>');
				tr+=('<td>'+vendor.fullName+'</td>');
				tr+=('<td>'+vendor.area+'</td>');
				tr+=('<td>'+vendor.linkMan+'</td>');
				tr+='</tr>';
				
				tbody.append($(tr));
			});
		}
		else{
			
		}
	},
	error:function(){
		
	}
	});
};


//customer searcher dialog start
order.showCustomerSearch=function(event){
	order.queryCustomer();
	$('#customerResult').empty();
	$('#customerModal').modal('show');
};
order.customerSearchOk=function(){
	var checkedMtl=$('#customerModal :radio:checked');
	if(checkedMtl.length==0){
		alert("请先选择一行数据");
		return;
	}
	var customer=$(checkedMtl[0]).attr("data-customer");
	if(typeof customer =="string"){
		customer=JSON.parse(customer);
	}
	
	$('#customer').val(customer.name);
	$('#customerModal').modal('hide');
	$('#customerResult').empty();
};

order.queryCustomer=function(){
	$.ajax({
		url:ctx+"/customer/search",
		data:"",
	success: function(result){
		if(result.success==true){
			var tbody=$('#customerResult');
			$.each(result.data,function(i,customer){
				var tr='<tr>';
				tr+=('<td><input type="radio" name="selectRow" data-customer=\''+JSON.stringify(customer)+'\' ></td>');
				tr+=('<td>'+customer.name+'</td>');
				tr+=('<td>'+customer.fullName+'</td>');
				tr+=('<td>'+customer.area+'</td>');
				tr+=('<td>'+customer.linkMan+'</td>');
				tr+='</tr>';
				
				tbody.append($(tr));
			});
		}
		else{
			
		}
	},
	error:function(){
		
	}
	});
};
$(document).ready(function() {
	//聚焦第一个输入框
	$("#companyId").focus();
	//为inputForm注册validate函数
	$("#inputForm").validate({
		rules : {
			loginName : {
				remote : "${ctx}/jimi/order/checkName"
			}
		},
		messages : {
			loginName : {
				remote : "订单名已存在"
			}
		}
	});
	order.template= $.validator.format($
			.trim($("#template").val()))
	$('.form_date').datetimepicker({
		language : 'zh-CN',
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});
	
	order.rowNo=$('#itemBody').children().length;
	if(order.rowNo==0){
		// start with one row
		order.addRow();
	}
	// add more rows on click
	$("#add").click(order.addRow);
	

	$("#inputForm").validateDelegate("input.quantity", "keyup",
			order.calculate);
	$("#inputForm").validateDelegate("input.price", "keyup",
			order.calculate);
	
	//init search button
	$('#customerSearch').click(order.showCustomerSearch);
	$('#customerSearchOk').click(order.customerSearchOk);
	$('#productSearchOk').click(order.productSearchOk);
});
