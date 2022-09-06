prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_220100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2022.04.12'
,p_release=>'22.1.4'
,p_default_workspace_id=>9487996057419088
,p_default_application_id=>126
,p_default_id_offset=>0
,p_default_owner=>'CC13'
);
end;
/
 
prompt APPLICATION 126 - Pantry
--
-- Application Export:
--   Application:     126
--   Name:            Pantry
--   Date and Time:   07:25 Dienstag September 6, 2022
--   Exported By:     CC13
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 17680120390314950
--   Manifest End
--   Version:         22.1.4
--   Instance ID:     9487704227848525
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/com_cc13_barcodereader
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(17680120390314950)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.CC13.BARCODEREADER'
,p_display_name=>'CC13 - Barcode Reader'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.9.1/underscore-min.js',
'https://rawgit.com/serratus/quaggaJS/master/dist/quagga.min.js',
'#PLUGIN_FILES#ScannerCam.js'))
,p_css_file_urls=>'#PLUGIN_FILES#ScannerCam#MIN#.css'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function render',
'  ( p_region              in apex_plugin.t_region',
'  , p_plugin              in apex_plugin.t_plugin',
'  , p_is_printer_friendly in boolean',
'  )',
'return apex_plugin.t_region_render_result',
'as',
'    l_result        apex_plugin.t_region_render_result;',
'',
'    --attributes',
'    l_attribute1    p_region.attribute_01%type := p_region.attribute_01;',
'    l_attribute2    p_region.attribute_02%type := p_region.attribute_02;',
'    l_attribute3    p_region.attribute_03%type := p_region.attribute_03;',
'',
'    l_region_id     p_region.static_id%type    := p_region.static_id;',
'    l_ajax_id       p_region.static_id%type    := apex_plugin.get_ajax_identifier;',
'',
'    --perform escaping',
'    l_region_id_esc p_region.static_id%type    := apex_escape.html_attribute(l_region_id);',
'',
'    -- constants',
'    c_video_id      varchar2(100) := ''scanner_cam'';',
'begin',
'',
'    --debug',
'    if apex_application.g_debug ',
'    then',
'        apex_plugin_util.debug_region',
'          ( p_plugin => p_plugin',
'          , p_region => p_region',
'          );',
'    end if;',
'',
'    --write html to buffer via sys.htp.p',
'    -- sys.htp.p(''<div id="'' || l_region_id_esc || ''">'');',
'    -- sys.htp.p(''hello'');',
'    -- sys.htp.p(''</div>'');',
'    sys.htp.p(''<div id ="''||c_video_id||''" width="160" height="120"/>'');',
'',
'    --apex_javascript.add_inline_code(''App.scanItem'');',
'    apex_javascript.add_inline_code(''App.init('' || l_region_id || '')'');',
'',
'    --initialize the plugin via JavaScript',
'    apex_json.initialize_clob_output;',
'    ',
'    apex_json.open_object;',
'    ',
'    apex_json.write(''regionId''      , l_region_id );     -- needed for selecting the element',
'    apex_json.write(''ajaxIdentifier'', l_ajax_id   );     -- needed for ajax communication',
'    apex_json.write(''attribute1''    , l_attribute1);',
'    apex_json.write(''attribute2''    , l_attribute2);',
'    apex_json.write(''attribute3''    , l_attribute3);',
'    ',
'    apex_json.close_object;',
'    ',
'    apex_javascript.add_onload_code(p_code => ''console.log(''|| apex_json.get_clob_output || '');'');',
'    --apex_javascript.add_onload_code(p_code => apex_json.get_clob_output || '');'');',
'    apex_json.free_output;',
'    ',
'    return l_result;',
'end render;'))
,p_api_version=>2
,p_render_function=>'render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>84
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(17685703643400263)
,p_plugin_id=>wwv_flow_imp.id(17680120390314950)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Barcode'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(17724411340058939)
,p_plugin_id=>wwv_flow_imp.id(17680120390314950)
,p_name=>'barcodereader_event'
,p_display_name=>'barcodereader_event'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '766172207363616E6E657243616D456C203D20646F63756D656E742E676574456C656D656E744279496428277363616E6E65725F63616D27293B0D0A76617220636F64656C697374203D20646F63756D656E742E676574456C656D656E74427949642827';
wwv_flow_imp.g_varchar2_table(2) := '636F6465732D6C69737427293B0D0A0D0A76617220417070203D207B0D0A20202020436F6E6669673A207B0D0A202020206576656E744E616D653A2022626172636F64657265616465725F6576656E74227D2C0D0A20202020696E69743A2066756E6374';
wwv_flow_imp.g_varchar2_table(3) := '696F6E28726567696F6E494429207B0D0A20202020202020207661722073656C66203D20746869733B0D0A2020202020202020636F6E736F6C652E6C6F672827696E69743A2027202B20726567696F6E4944293B0D0A0D0A202020202020202051756167';
wwv_flow_imp.g_varchar2_table(4) := '67612E696E697428746869732E636F6E6669672C2066756E6374696F6E2865727229207B0D0A2020202020202020202020206966202865727229207B0D0A2020202020202020202020202020202072657475726E2073656C662E68616E646C654572726F';
wwv_flow_imp.g_varchar2_table(5) := '7228657272293B0D0A2020202020202020202020207D0D0A2020202020202020202020205175616767612E737461727428293B0D0A20202020202020207D293B0D0A202020207D2C0D0A2020202068616E646C654572726F723A2066756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(6) := '65727229207B0D0A2020202020202020636F6E736F6C652E6C6F6728657272293B0D0A202020207D2C0D0A20202020636F6E6669673A207B0D0A2020202020202020696E70757453747265616D3A207B0D0A202020202020202020202020746172676574';
wwv_flow_imp.g_varchar2_table(7) := '3A207363616E6E657243616D456C2C0D0A20202020202020202020202074797065203A20224C69766553747265616D222C0D0A202020202020202020202020636F6E73747261696E74733A207B0D0A202020202020202020202020202020207769647468';
wwv_flow_imp.g_varchar2_table(8) := '3A207B6D696E3A203136307D2C0D0A202020202020202020202020202020206865696768743A207B6D696E3A203132307D2C0D0A20202020202020202020202020202020666163696E674D6F64653A2022656E7669726F6E6D656E74222C0D0A20202020';
wwv_flow_imp.g_varchar2_table(9) := '202020202020202020202020617370656374526174696F3A207B6D696E3A20312C206D61783A20327D0D0A2020202020202020202020207D0D0A20202020202020207D2C0D0A20202020202020206C6F6361746F723A207B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(10) := '2020706174636853697A653A20226D656469756D222C0D0A20202020202020202020202068616C6653616D706C653A20747275650D0A20202020202020207D2C0D0A20202020202020206E756D4F66576F726B6572733A20322C0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(11) := '6672657175656E63793A2031302C0D0A20202020202020206465636F6465723A207B0D0A20202020202020202020202072656164657273203A205B7B0D0A20202020202020202020202020202020666F726D61743A202265616E5F726561646572222C0D';
wwv_flow_imp.g_varchar2_table(12) := '0A20202020202020202020202020202020636F6E6669673A207B7D0D0A2020202020202020202020207D5D0D0A20202020202020207D2C0D0A20202020202020206C6F636174653A20747275650D0A202020207D0D0A7D3B0D0A0D0A4170702E696E6974';
wwv_flow_imp.g_varchar2_table(13) := '28293B0D0A0D0A66756E6374696F6E207363616E4974656D28636F646529207B0D0A0D0A202076617220656C203D20646F63756D656E742E637265617465456C656D656E7428276C6927293B0D0A2020656C2E696E6E657254657874203D20636F64653B';
wwv_flow_imp.g_varchar2_table(14) := '0D0A20200D0A2020636F64656C6973742E76616C7565203D20636F64653B0D0A20207363616E6E657243616D456C2E636C6173734C6973742E61646428277363616E6E65722D63616D2D2D7363616E6E656427293B0D0A7D0D0A0D0A766172206465626F';
wwv_flow_imp.g_varchar2_table(15) := '756E6365645363616E6E6572203D205F2E6465626F756E6365287363616E4974656D2C20313030302C2074727565293B0D0A0D0A766172207374796C6554696D65723B0D0A0D0A5175616767612E6F6E44657465637465642828726573756C7429203D3E';
wwv_flow_imp.g_varchar2_table(16) := '207B0D0A202076617220636F6465203D20726573756C742E636F6465526573756C742E636F64653B0D0A0D0A20202F2F617065782E6576656E742E7472696767657228646F63756D656E742C4170702E436F6E6669672E6576656E744E616D65202C636F';
wwv_flow_imp.g_varchar2_table(17) := '6465290D0A20202F2F2428222322202B20726567696F6E4944292E74726967676572284170702E436F6E6669672E6576656E744E616D652C20636F6465293B0D0A20202F2F617065782E6974656D2861747472696275746531292E73657456616C756528';
wwv_flow_imp.g_varchar2_table(18) := '636F6465293B0D0A20200D0A20206966202821636F64652E6D61746368282F5B302D395D2B5C2F5B302D395D2B5C2F5B412D5A5D2B5C2F5B302D395D2B2F672929207B20636F6E736F6C652E6C6F6728636F6465293B2072657475726E3B207D0D0A2020';
wwv_flow_imp.g_varchar2_table(19) := '6465626F756E6365645363616E6E657228636F6465293B0D0A2020636C65617254696D656F7574287374796C6554696D6572293B0D0A0D0A20207374796C6554696D6572203D2073657454696D656F75742866756E6374696F6E2829207B0D0A20202020';
wwv_flow_imp.g_varchar2_table(20) := '7363616E6E657243616D456C2E636C6173734C6973742E72656D6F766528277363616E6E65722D63616D2D2D7363616E6E656427293B0D0A20207D2C2031303030293B0D0A7D293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(17680417127320367)
,p_plugin_id=>wwv_flow_imp.id(17680120390314950)
,p_file_name=>'ScannerCam.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E7363616E6E65722D63616D207B0D0A2020626F726465723A2035707820736F6C6964207265643B0D0A202077696474683A2036343070783B0D0A20206865696768743A2034383070783B0D0A7D0D0A0D0A2E7363616E6E65722D63616D2D2D7363616E';
wwv_flow_imp.g_varchar2_table(2) := '6E6564207B0D0A2020626F726465722D636F6C6F723A20677265656E3B0D0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(17680712714332889)
,p_plugin_id=>wwv_flow_imp.id(17680120390314950)
,p_file_name=>'ScannerCam.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E7363616E6E65722D63616D7B626F726465723A35707820736F6C6964207265643B77696474683A36343070783B6865696768743A34383070787D2E7363616E6E65722D63616D2D2D7363616E6E65647B626F726465722D636F6C6F723A677265656E7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(17682244203333772)
,p_plugin_id=>wwv_flow_imp.id(17680120390314950)
,p_file_name=>'ScannerCam.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '766172207363616E6E657243616D456C3D646F63756D656E742E676574456C656D656E744279496428227363616E6E65725F63616D22292C636F64656C6973743D646F63756D656E742E676574456C656D656E74427949642822636F6465732D6C697374';
wwv_flow_imp.g_varchar2_table(2) := '22292C4170703D7B436F6E6669673A7B6576656E744E616D653A22626172636F64657265616465725F6576656E74227D2C696E69743A66756E6374696F6E2865297B766172206E3D746869733B636F6E736F6C652E6C6F672822696E69743A20222B6529';
wwv_flow_imp.g_varchar2_table(3) := '2C5175616767612E696E697428746869732E636F6E6669672C2866756E6374696F6E2865297B696628652972657475726E206E2E68616E646C654572726F722865293B5175616767612E737461727428297D29297D2C68616E646C654572726F723A6675';
wwv_flow_imp.g_varchar2_table(4) := '6E6374696F6E2865297B636F6E736F6C652E6C6F672865297D2C636F6E6669673A7B696E70757453747265616D3A7B7461726765743A7363616E6E657243616D456C2C747970653A224C69766553747265616D222C636F6E73747261696E74733A7B7769';
wwv_flow_imp.g_varchar2_table(5) := '6474683A7B6D696E3A3136307D2C6865696768743A7B6D696E3A3132307D2C666163696E674D6F64653A22656E7669726F6E6D656E74222C617370656374526174696F3A7B6D696E3A312C6D61783A327D7D7D2C6C6F6361746F723A7B70617463685369';
wwv_flow_imp.g_varchar2_table(6) := '7A653A226D656469756D222C68616C6653616D706C653A21307D2C6E756D4F66576F726B6572733A322C6672657175656E63793A31302C6465636F6465723A7B726561646572733A5B7B666F726D61743A2265616E5F726561646572222C636F6E666967';
wwv_flow_imp.g_varchar2_table(7) := '3A7B7D7D5D7D2C6C6F636174653A21307D7D3B66756E6374696F6E207363616E4974656D2865297B646F63756D656E742E637265617465456C656D656E7428226C6922292E696E6E6572546578743D652C636F64656C6973742E76616C75653D652C7363';
wwv_flow_imp.g_varchar2_table(8) := '616E6E657243616D456C2E636C6173734C6973742E61646428227363616E6E65722D63616D2D2D7363616E6E656422297D4170702E696E697428293B766172207374796C6554696D65722C6465626F756E6365645363616E6E65723D5F2E6465626F756E';
wwv_flow_imp.g_varchar2_table(9) := '6365287363616E4974656D2C3165332C2130293B5175616767612E6F6E44657465637465642828653D3E7B766172206E3D652E636F6465526573756C742E636F64653B6E2E6D61746368282F5B302D395D2B5C2F5B302D395D2B5C2F5B412D5A5D2B5C2F';
wwv_flow_imp.g_varchar2_table(10) := '5B302D395D2B2F67293F286465626F756E6365645363616E6E6572286E292C636C65617254696D656F7574287374796C6554696D6572292C7374796C6554696D65723D73657454696D656F7574282866756E6374696F6E28297B7363616E6E657243616D';
wwv_flow_imp.g_varchar2_table(11) := '456C2E636C6173734C6973742E72656D6F766528227363616E6E65722D63616D2D2D7363616E6E656422297D292C31653329293A636F6E736F6C652E6C6F67286E297D29293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(18433248415892714)
,p_plugin_id=>wwv_flow_imp.id(17680120390314950)
,p_file_name=>'ScannerCam.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
