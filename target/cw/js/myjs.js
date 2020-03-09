function formToJson(formID) {
    var json_str = "{";
    var form_string = $('#'+formID).serialize();
    var form_string_array = form_string.split("&");
    for(var i = 0; i < form_string_array.length; i++){
        var param_string = form_string_array[i];
        var key_value_param = param_string.split("=", -1);
        var key = "\"" + key_value_param[0] + "\"";
        var value = "\""+ key_value_param[1] + "\"";
        json_str = json_str + key + ":" + value;
        if(i < form_string_array.length-1){
            json_str = json_str + ",";
        }
    }
    json_str = json_str + "}";
    return json_str;
}